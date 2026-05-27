# ==========================================================
# REPEATED MEASURES ANOVA (Reference Time = 0)
# ==========================================================

cat("\n\n====================================================\n")
cat("REPEATED MEASURES ANOVA (Reference = Time 0)\n")
cat("====================================================\n")

for (metric in selected_metrics) {
  
  if (!metric %in% names(df)) {
    cat("\nSkipping:", metric, "- column not found\n")
    next
  }
  
  cat("\n====================================================\n")
  cat("REPEATED MEASURES METRIC:", metric, "\n")
  cat("====================================================\n")
  
  # Keep baseline (0) + selected timepoints
  rm_df <- df %>%
    filter(`Time Point` %in% c(0, selected_timepoints)) %>%
    select(Subject,
           `Hemorrhage Level`,
           `Occlusion Group`,
           `Time Point`,
           all_of(metric)) %>%
    drop_na()
  
  if (nrow(rm_df) < 10) {
    cat("Insufficient repeated measures data\n")
    next
  }
  
  rm_df$Subject <- factor(rm_df$Subject)
  rm_df$`Time Point` <- factor(rm_df$`Time Point`)
  
  # Set Time = 0 as reference
  rm_df$`Time Point` <- relevel(rm_df$`Time Point`, ref = "0")
  
  # =========================
  # REPEATED MEASURES MODEL
  # =========================
  
  formula_rm <- as.formula(
    paste(metric,
          "~ `Hemorrhage Level` * `Occlusion Group` * `Time Point` +",
          "Error(Subject/`Time Point`)")
  )
  
  rm_model <- aov(formula_rm, data = rm_df)
  
  cat("\nRepeated Measures ANOVA Output:\n")
  print(summary(rm_model))
  
  # =========================
  # TYPE III ANOVA (car package)
  # =========================
  
  lm_model <- lm(
    as.formula(
      paste(metric,
            "~ `Hemorrhage Level` * `Occlusion Group` * `Time Point`")
    ),
    data = rm_df
  )
  
  rm_anova <- Anova(lm_model, type = 3)
  print(rm_anova)
  
  rm_anova_df <- as.data.frame(rm_anova)
  rm_anova_df$Effect <- rownames(rm_anova_df)
  rownames(rm_anova_df) <- NULL
  
  # =========================
  # EFFECT SIZE
  # =========================
  
  rm_eta <- eta_squared(lm_model, partial = TRUE)
  print(rm_eta)
  
  rm_eta_df <- as.data.frame(rm_eta)
  
  # =========================
  # WRITE TO EXCEL
  # =========================
  
  sheet_name <- paste(metric, "RepeatedMeasures", sep = "_")
  
  addWorksheet(wb, sheet_name)
  
  writeData(wb, sheet_name,
            paste("Repeated Measures ANOVA:", metric),
            startRow = 1)
  
  writeData(wb, sheet_name,
            rm_anova_df,
            startRow = 3)
  
  writeData(wb, sheet_name,
            "Partial Eta Squared",
            startRow = 15)
  
  writeData(wb, sheet_name,
            rm_eta_df,
            startRow = 17)
}
