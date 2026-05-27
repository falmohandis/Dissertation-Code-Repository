# PhD Thesis Task Tracker

This README tracks the remaining analysis, coding, and manuscript tasks needed to complete the dissertation.

---

## Overview

The dissertation work is currently centered on three major areas:

1. **R code development and clinical question analyses**
2. **Paper 3 manuscript completion**
3. **Future machine learning manuscripts for Papers 4 and 5**

The highest-priority work is completing the R scripts and statistical analyses needed for Paper 3 and the dissertation core.

---

## 1. R Code Development and Clinical Question Analyses

### 1.1 Hemodynamics and Cardiac Function

**Dataset focus:**  
Renal artery flow, carotid artery flow, and left ventricular pressure-volume relationship.

The goal is to evaluate how hemorrhage severity, aortic occlusion strategy, intervention timing, and recovery affect physiological and hemodynamic outcomes.

---

### T30: End of Hemorrhage

**Clinical question:**  
How do different hemorrhage levels affect physiological and hemodynamic outcomes?

**Planned analysis:**

- One-way ANOVA  
- Rank-based one-way ANCOVA if assumptions are violated  
- Tukey post hoc comparisons

**Status:**  
Pending R code development and analysis execution.

---

### T60: End of Occlusion

**Clinical question:**  
What are the combined effects of hemorrhage level and occlusion type on physiological and hemodynamic outcomes?

**Planned analysis:**

- Two-way ANOVA  
- Rank-based two-way ANCOVA if assumptions are violated  
- Tukey post hoc comparisons

**Status:**  
Pending R code development and analysis execution.

---

### T60 to T65: Early Blood Transfusion Period

**Clinical question:**  
How do hemorrhage, occlusion, and time interact to acutely influence system dynamics during the early transfusion period?

**Planned analysis:**

- Linear mixed model  
- Rank-based linear mixed-effects model if assumptions are violated  
- Post hoc comparisons

**Status:**  
Pending R code development and analysis execution.

---

### T0 to T240: Full Experimental Timeline

**Clinical question:**  
When and how does the subject return to homeostasis compared with baseline?

**Baseline reference:**  
T0

**Planned analysis:**

- Linear mixed model  
- Rank-based linear mixed-effects model if assumptions are violated  
- Post hoc comparisons  
- Emphasis on physiological recovery trajectories

**Status:**  
Pending R code development and analysis execution.

---

## 1.2 TEG Data

**Dataset focus:**  
Thromboelastography data across time and intervention groups.

---

### Question A: Longitudinal Changes Over Time

**Objective:**  
Determine whether TEG factors significantly change over time because of hemorrhage severity, intervention group differences, or their interaction.

**Original proposed analysis:**

- ANOVA

**Preferred likely analysis:**

- Linear mixed model

**Reasoning:**  
Repeated-measures ANOVA may not handle missing data as well as a mixed-model approach.

**Decision needed:**  
Confirm with advisor or statistician whether linear mixed models should be used as the primary approach.

**Status:**  
Pending statistical confirmation.

---

### Question B: End-of-Study Versus Baseline Differences

**Objective:**  
Determine whether there are significant group differences in TEG factors at the end of the study compared with baseline.

**Comparison:**  
T240 versus T0

**Planned analysis:**

- ANOVA  
- Linear mixed model

**Status:**  
Pending statistical confirmation and R code development.

---

## 2. Paper Writing and Publication Plan

## Paper 3

**Working title:**  
*Capturing the Hemodynamics and Physiologic Response to Varying Degrees of Hemorrhagic Shock and Aortic Occlusion: A First Step Towards Developing a Mathematical Framework for Acute Transient Cardiovascular Modeling*

### Current status

- Introduction completed
- Methods completed
- Results partially completed
- Results are waiting on the R-based analyses listed above, especially ANOVA and linear mixed model outputs

### Next steps

- Finalize R scripts for all clinical questions
- Run final statistical analyses
- Generate tables and figures
- Complete Results section
- Write Discussion section
- Write Conclusion section
- Select target journal

### Priority

High

This paper is directly tied to the dissertation core and should remain the primary writing priority.

---

## Paper 4

**Tentative title:**  
*Development of an AI Model to Classify Hemorrhage Rates from Arterial Pressure Waveforms*

### Data focus

- Left subclavian pressure
- Distal aortic pressure

### Next steps

- Define model architecture
  - Potential starting models:
    - Random Forest
    - Convolutional Neural Network
    - Long Short-Term Memory network
- Preprocess waveform data
- Split data into training, validation, and testing sets
- Train and evaluate model
- Compare model performance across pressure waveform sources

### Priority

Medium

This work can continue after graduation if needed.

---

## Paper 5

**Tentative title:**  
*Machine Learning Classification of Kidney Injury Using Oxidative Stress Markers*

### Data focus

- Oxidative stress markers
- Primary marker of interest: 8-Isoprostane

### Next steps

- Gather and organize datasets
- Perform exploratory data analysis
- Define kidney injury classification outcome
- Test classification algorithms
  - Random Forest
  - Logistic Regression
  - Neural Networks
- Compare model performance and interpretability

### Priority

Medium

This work can continue after graduation if needed.

---

## 3. Current Priorities

### High Priority

Finish the R scripts for the clinical questions.

These analyses are directly tied to:

- Paper 3
- Dissertation results
- Core physiological interpretation
- Final manuscript figures and tables

---

### Medium Priority

Continue developing Papers 4 and 5.

These papers are important but can potentially continue after graduation.

---

## 4. Decision Points

The following items need confirmation before final analysis and manuscript completion:

1. **TEG statistical approach**  
   Confirm with advisor or statistician whether linear mixed models should replace repeated-measures ANOVA as the primary approach.

2. **Parametric versus non-parametric strategy**  
   Decide whether to use standard parametric models or rank-based approaches depending on:
   - Normality testing
   - Variance testing
   - Model residual diagnostics
   - Sample size limitations

3. **Hetastarch clarification**  
   Talk to Magan or Williams to clarify details related to hetastarch.

4. **Target journal for Paper 3**  
   Select the most appropriate journal once the Results and Discussion are closer to completion.

---

## 5. Code Development Notes

The R code should be rebuilt so that it answers the research questions in a simpler, cleaner, and more elegant way.

### Coding goals

- Centralize the analysis workflow
- Avoid repetitive scripts
- Use reusable functions where possible
- Keep all cofactors in the models
- Make the code easier to audit, rerun, and modify
- Generate consistent tables and plots across outcomes
- Run all analyses from one main document or master script if possible

### Important reminder

Keep all cofactors in the analysis models unless there is a clear statistical or biological reason to remove them.

---

## 6. Suggested Repository Structure

```text
project-root/
├── README.md
├── data/
│   ├── raw/
│   ├── processed/
│   └── metadata/
├── scripts/
│   ├── 00_setup.R
│   ├── 01_data_cleaning.R
│   ├── 02_hemodynamics_analysis.R
│   ├── 03_teg_analysis.R
│   ├── 04_posthoc_tests.R
│   └── 05_generate_figures_tables.R
├── outputs/
│   ├── figures/
│   ├── tables/
│   └── model_results/
├── manuscripts/
│   ├── paper_3/
│   ├── paper_4/
│   └── paper_5/
└── notes/
```

---

## 7. Suggested R Workflow

A simplified workflow could be:

1. Load libraries and helper functions
2. Import cleaned datasets
3. Define outcomes, cofactors, grouping variables, and timepoints
4. Run assumption checks
5. Select parametric or rank-based model
6. Run primary models
7. Run post hoc comparisons
8. Export model summaries
9. Export tables
10. Export figures

---

## 8. Immediate Next Actions

1. Rewrite the R code around the main clinical questions.
2. Keep all cofactors in the models.
3. Finalize the analysis plan for T30, T60, T60 to T65, and T0 to T240.
4. Confirm the TEG modeling strategy with advisor or statistician.
5. Clarify hetastarch details with Magan or Williams.
6. Generate final statistical outputs for Paper 3.
7. Complete the Results, Discussion, and Conclusion sections for Paper 3.

---

## 9. Status Summary

| Area | Status | Priority |
|---|---:|---:|
| Hemodynamics R analyses | Pending | High |
| Cardiac function R analyses | Pending | High |
| TEG analysis plan | Needs confirmation | High |
| Paper 3 Results | Partially complete | High |
| Paper 3 Discussion and Conclusion | Pending | High |
| Paper 4 AI waveform model | Not started | Medium |
| Paper 5 kidney injury ML model | Not started | Medium |
| Hetastarch clarification | Pending | Medium |
| Target journal selection | Pending | Medium |
