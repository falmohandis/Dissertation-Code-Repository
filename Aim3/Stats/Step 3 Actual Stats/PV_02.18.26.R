# ==============================
# Load Libraries
# ==============================
library(readxl)
library(dplyr)
library(stringr)
library(openxlsx)
library(rstatix)
library(tidyverse)
library(FSA)

# ==============================
# Robust script directory
# ==============================
if ("rstudioapi" %in% rownames(installed.packages())) {
  library(rstudioapi)
  if (isAvailable()) {
    script_dir <- dirname(getActiveDocumentContext()$path)
  } else {
    script_dir <- getwd()
  }
} else {
  script_dir <- getwd()
}

# ==============================
# Load Data
# ==============================
file_path <- "PV_Fractional_Increase_T0-1.xlsx"
full_file_path <- file.path(script_dir, file_path)
df <- read_excel(full_file_path)

# Clean column names
colnames(df) <- colnames(df) %>%
  str_replace_all("[ \\-\\(\\)]", "") %>%
  make.names(unique = TRUE)

# ==============================
# TimePoint mapping
# ==============================
timepoint_map <- c(
  "T0-1" = 0, "T5-6" = 5, "T10-11" = 10, "T15-16" = 15,
  "T20-21" = 20, "T25-26" = 25, "T29-30" = 30, "T30-T31" = 31,
  "T35-36" = 35, "T40-41" = 40, "T45-46" = 45, "T50-51" = 50,
  "T55-56" = 55, "T59-60" = 60, "T64-65" = 65, "T70-71" = 70,
  "T74-75" = 75, "T75-76" = 76, "T80-81" = 80, "T120-121" = 120,
  "T180-181" = 180, "T239-240" = 240
)

df$OcclusionGroup <- sub("^\\d+%\\s+", "", df$TreatmentGroup)
df$TimePoint <- timepoint_map[df$OGTimePoint]

# ==============================
# Factor transformations
# ==============================
df <- df %>%
  mutate(
    SubjectID = as.factor(ParentFolder),
    TimePoint = as.factor(TimePoint),
    OcclusionGroup = factor(OcclusionGroup, levels = c("None", "Partial", "Full")),
    OcclusionGroup = as.numeric(OcclusionGroup) - 1,
    HemorrhageLevel = as.factor((HemorrhageLevel / 10) - 1)
  )

df$OcclusionGroup <- factor(df$OcclusionGroup, levels = 0:2, labels = c("None", "Partial", "Full"))
df$HemorrhageLevel <- factor(df$HemorrhageLevel, levels = 0:2, labels = c("10", "20", "30"))

# ==============================
# Select PV datasets
# ==============================
reference_columns <- c("SubjectID", "TimePoint", "HemorrhageLevel", "OcclusionGroup",
                       "CumulativeVasopressin", "Plasmalyte", "Norepi")

strokework <- df %>% select(all_of(reference_columns), StrokeWork)
strokevolume <- df %>% select(all_of(reference_columns), StrokeVolume)
ejectionfraction <- df %>% select(all_of(reference_columns), EjectionFraction)
heartrate <- df %>% select(all_of(reference_columns), HeartRate)
cardiacoutput <- df %>% select(all_of(reference_columns), CardiacOutput)
elastance <- df %>% select(all_of(reference_columns), Elastance)
esv <- df %>% select(all_of(reference_columns), ESV)
esp <- df %>% select(all_of(reference_columns), ESP)
edv <- df %>% select(all_of(reference_columns), EDV)
edp <- df %>% select(all_of(reference_columns), EDP)

pv_datasets <- list(
  StrokeWork = strokework,
  StrokeVolume = strokevolume,
  EjectionFraction = ejectionfraction,
  HeartRate = heartrate,
  CardiacOutput = cardiacoutput,
  Elastance = elastance,
  ESV = esv,
  ESP = esp,
  EDV = edv,
  EDP = edp
)

# ==============================
# Create Excel workbook
# ==============================
wb <- createWorkbook()

# Partial eta² function
compute_partial_eta2 <- function(aov_model) {
  anova_table <- summary(aov_model)[[1]]
  SS_effects <- anova_table$`Sum Sq`[-length(anova_table$`Sum Sq`)]  # drop residual
  SS_residual <- tail(anova_table$`Sum Sq`, 1)
  eta2 <- SS_effects / (SS_effects + SS_residual)
  return(round(eta2, 3))
}

# ==============================
# Main Loop
# ==============================
for (pv_name in names(pv_datasets)) {
  
  cat("\n============================\n")
  cat("Running analyses for:", pv_name, "\n")
  cat("============================\n\n")
  
  data <- pv_datasets[[pv_name]]
  
  # ------------------------------
  # 1. T30 Kruskal-Wallis
  # ------------------------------
  data_30 <- data %>% filter(TimePoint == 30)
  data_30$HemorrhageLevel <- as.factor(data_30$HemorrhageLevel)
  
  cat("Normality test at T30:\n")
  print(data_30 %>% group_by(HemorrhageLevel) %>% shapiro_test(!!sym(pv_name)))
  
  cat("\nKruskal-Wallis T30:\n")
  print(kruskal.test(as.formula(paste(pv_name, "~ HemorrhageLevel")), data = data_30))
  
  cat("\nPairwise Wilcoxon T30:\n")
  print(pairwise.wilcox.test(data_30[[pv_name]], data_30$HemorrhageLevel, p.adjust.method = "bonferroni"))
  # 
  # # ------------------------------
  # # 2. T60 Two-way ANOVA
  # # ------------------------------
  data_60 <- data %>% filter(TimePoint == 60)

  if (nrow(data_60) > 0) {

    data_60$HemorrhageLevel <- as.factor(data_60$HemorrhageLevel)
    data_60$OcclusionGroup <- as.factor(data_60$OcclusionGroup)

    # Descriptive statistics
    desc_60 <- data_60 %>%
      group_by(HemorrhageLevel, OcclusionGroup) %>%
      summarise(
        n = n(),
        mean = mean(.data[[pv_name]], na.rm = TRUE),
        sd = sd(.data[[pv_name]], na.rm = TRUE),
        .groups = "drop"
      )

    print(desc_60)

    # Two-way ANOVA
    formula_60 <- as.formula(paste(pv_name, "~ HemorrhageLevel * OcclusionGroup"))
    model_60 <- aov(formula_60, data = data_60)
    anova_table <- summary(model_60)[[1]]

    # Partial eta²
    eta2 <- compute_partial_eta2(model_60)
    # Add column, match rows
    anova_table$PartialEta2 <- c(eta2, NA)

    print(anova_table)

    # Tukey post hoc
    tukey_results <- TukeyHSD(model_60)
    tukey_df <- do.call(rbind, lapply(names(tukey_results), function(factor_name) {
      df <- as.data.frame(tukey_results[[factor_name]])
      df$Comparison <- rownames(df)
      df$Factor <- factor_name
      df <- df[, c("Factor", "Comparison", "diff", "lwr", "upr", "p adj")]
      return(df)
    }))

    print(tukey_df)

    # ------------------------------
    # Save to workbook
    # ------------------------------
    addWorksheet(wb, paste0(pv_name, "_Desc"))
    writeData(wb, sheet = paste0(pv_name, "_Desc"), desc_60)

    addWorksheet(wb, paste0(pv_name, "_ANOVA"))
    writeData(wb, sheet = paste0(pv_name, "_ANOVA"), as.data.frame(anova_table))

    addWorksheet(wb, paste0(pv_name, "_Tukey"))
    writeData(wb, sheet = paste0(pv_name, "_Tukey"), tukey_df)

  }
}

# ==============================
# Save workbook
# ==============================
output_file <- file.path(script_dir, "PV_T60_Analysis.xlsx")
saveWorkbook(wb, output_file, overwrite = TRUE)
cat("\nAll T60 results saved to:", output_file, "\n")
