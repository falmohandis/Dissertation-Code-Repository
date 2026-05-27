# ============================================================
# Complete R Workflow: Drug Treatments + Hetastarch
# ============================================================

library(readxl)
library(dplyr)
library(stats)
library(emmeans)  # for post-hoc comparisons

# ------------------------------------------------------------
# Dynamic file path
# ------------------------------------------------------------
script_dir <- if ("rstudioapi" %in% rownames(installed.packages()) &&
                  rstudioapi::isAvailable()) {
  dirname(rstudioapi::getActiveDocumentContext()$path)
} else getwd()

file_path <- file.path(script_dir, "Raw_Values_by_Parameter_and_Time.xlsx")

# ------------------------------------------------------------
# List all sheets
# ------------------------------------------------------------
sheet_names <- excel_sheets(file_path)
cat("Sheets in workbook:\n")
print(sheet_names)

# ------------------------------------------------------------
# Identify Hetastarch sheet
# ------------------------------------------------------------
hetastarch_sheet <- sheet_names[grepl("Hetastarch", sheet_names, ignore.case = TRUE)]
if(length(hetastarch_sheet) == 0){
  stop("No sheet containing 'Hetastarch' found in workbook.")
} else {
  hetastarch_sheet <- hetastarch_sheet[1]  # take first match
  cat("Detected Hetastarch sheet:", hetastarch_sheet, "\n")
}

# ------------------------------------------------------------
# Function: Drug Treatment ANOVA + post-hoc
# ------------------------------------------------------------
run_two_way_anova_posthoc <- function(df, hemorrhage_level) {
  cat("\n============================\n")
  cat("Hemorrhage Level:", hemorrhage_level, "\n")
  cat("============================\n")
  
  df_h <- df %>% filter(Hemorrhage_Level == hemorrhage_level)
  
  if(nrow(df_h) == 0) {
    cat("No data for this hemorrhage level.\n")
    return(NULL)
  }
  
  # Ensure factors
  df_h$Occlusion_Type <- as.factor(df_h$Occlusion_Type)
  df_h$Time <- as.factor(df_h$Time)
  
  # Two-way ANOVA
  model <- aov(Value ~ Occlusion_Type * Time, data = df_h)
  print(summary(model))
  
  # Post-hoc: Emmeans for Occlusion_Type at each Time
  cat("\n--- Post-hoc comparisons: Occlusion Type ---\n")
  em <- emmeans(model, ~ Occlusion_Type | Time)
  print(pairs(em, adjust = "tukey"))
}

# ------------------------------------------------------------
# Process Drug Treatment sheets
# ------------------------------------------------------------
drug_sheets <- setdiff(sheet_names, hetastarch_sheet)  # remove Hetastarch

for(sheet in drug_sheets) {
  cat("\n\n###############################\n")
  cat("Parameter:", sheet, "\n")
  cat("###############################\n")
  
  df <- read_excel(file_path, sheet = sheet)
  names(df) <- gsub(" ", "_", names(df))
  
  hemorrhage_levels <- unique(df$Hemorrhage_Level)
  
  for(h in hemorrhage_levels) {
    run_two_way_anova_posthoc(df, h)
  }
}

# ------------------------------------------------------------
# Hetastarch ANOVA (Occlusion × Hemorrhage)
# ------------------------------------------------------------
cat("\n\n============================\nHetastarch ANOVA\n============================\n")
df_het <- read_excel(file_path, sheet = hetastarch_sheet)
names(df_het) <- gsub(" ", "_", names(df_het))

# Ensure factors
df_het$Occlusion_Type <- as.factor(df_het$Occlusion_Type)
df_het$Hemorrhage_Level <- as.factor(df_het$Hemorrhage_Level)

# Two-way ANOVA
model_het <- aov(Value ~ Occlusion_Type * Hemorrhage_Level, data = df_het)
print(summary(model_het))

# Post-hoc: Occlusion Type differences for each Hemorrhage Level
cat("\n--- Post-hoc comparisons: Occlusion Type within Hemorrhage Level ---\n")
em_het <- emmeans(model_het, ~ Occlusion_Type | Hemorrhage_Level)
print(pairs(em_het, adjust = "tukey"))






##########################################################


#### Adding the time effect:



# ============================================================
# Complete R Workflow: Drug Treatments + Hetastarch + Time Effect
# ============================================================

library(readxl)
library(dplyr)
library(stats)
library(emmeans)  # for post-hoc comparisons

# ------------------------------------------------------------
# Dynamic file path
# ------------------------------------------------------------
script_dir <- if ("rstudioapi" %in% rownames(installed.packages()) &&
                  rstudioapi::isAvailable()) {
  dirname(rstudioapi::getActiveDocumentContext()$path)
} else getwd()

file_path <- file.path(script_dir, "Raw_Values_by_Parameter_and_Time.xlsx")

# ------------------------------------------------------------
# List all sheets
# ------------------------------------------------------------
sheet_names <- excel_sheets(file_path)
cat("Sheets in workbook:\n")
print(sheet_names)

# ------------------------------------------------------------
# Identify Hetastarch sheet
# ------------------------------------------------------------
hetastarch_sheet <- sheet_names[grepl("Hetastarch", sheet_names, ignore.case = TRUE)]
if(length(hetastarch_sheet) == 0){
  stop("No sheet containing 'Hetastarch' found in workbook.")
} else {
  hetastarch_sheet <- hetastarch_sheet[1]  # take first match
  cat("Detected Hetastarch sheet:", hetastarch_sheet, "\n")
}

# ------------------------------------------------------------
# Function: Drug Treatment ANOVA + post-hoc + time effect
# ------------------------------------------------------------
run_two_way_anova_posthoc <- function(df, hemorrhage_level) {
  cat("\n============================\n")
  cat("Hemorrhage Level:", hemorrhage_level, "\n")
  cat("============================\n")
  
  df_h <- df %>% filter(Hemorrhage_Level == hemorrhage_level)
  
  if(nrow(df_h) == 0) {
    cat("No data for this hemorrhage level.\n")
    return(NULL)
  }
  
  # Ensure factors
  df_h$Occlusion_Type <- as.factor(df_h$Occlusion_Type)
  df_h$Time <- as.factor(df_h$Time)
  
  # Relevel Time so that 85 is reference
  if("85" %in% levels(df_h$Time)) {
    df_h$Time <- relevel(df_h$Time, ref = "85")
  } else {
    cat("Warning: Time=85 not found; reference not changed.\n")
  }
  
  # Two-way ANOVA
  model <- aov(Value ~ Occlusion_Type * Time, data = df_h)
  print(summary(model))
  
  # Post-hoc: Emmeans for Occlusion_Type at each Time
  cat("\n--- Post-hoc comparisons: Occlusion Type ---\n")
  em <- emmeans(model, ~ Occlusion_Type | Time)
  print(pairs(em, adjust = "tukey"))
  
  # Post-hoc: Time effect relative to Time=85
  cat("\n--- Post-hoc comparisons: Time effect (reference = 85) ---\n")
  em_time <- emmeans(model, ~ Time | Occlusion_Type)
  print(pairs(em_time, adjust = "tukey"))
}

# ------------------------------------------------------------
# Process Drug Treatment sheets
# ------------------------------------------------------------
drug_sheets <- setdiff(sheet_names, hetastarch_sheet)  # remove Hetastarch

for(sheet in drug_sheets) {
  cat("\n\n###############################\n")
  cat("Parameter:", sheet, "\n")
  cat("###############################\n")
  
  df <- read_excel(file_path, sheet = sheet)
  names(df) <- gsub(" ", "_", names(df))
  
  hemorrhage_levels <- unique(df$Hemorrhage_Level)
  
  for(h in hemorrhage_levels) {
    run_two_way_anova_posthoc(df, h)
  }
}

# ------------------------------------------------------------
# Hetastarch ANOVA (Occlusion × Hemorrhage)
# ------------------------------------------------------------
cat("\n\n============================\nHetastarch ANOVA\n============================\n")
df_het <- read_excel(file_path, sheet = hetastarch_sheet)
names(df_het) <- gsub(" ", "_", names(df_het))

# Ensure factors
df_het$Occlusion_Type <- as.factor(df_het$Occlusion_Type)
df_het$Hemorrhage_Level <- as.factor(df_het$Hemorrhage_Level)

# Two-way ANOVA
model_het <- aov(Value ~ Occlusion_Type * Hemorrhage_Level, data = df_het)
print(summary(model_het))

# Post-hoc: Occlusion Type differences for each Hemorrhage Level
cat("\n--- Post-hoc comparisons: Occlusion Type within Hemorrhage Level ---\n")
em_het <- emmeans(model_het, ~ Occlusion_Type | Hemorrhage_Level)
print(pairs(em_het, adjust = "tukey"))
