# Artificial Intelligence and Advanced Modeling Techniques for Optimizing Resuscitation Strategies in Hemorrhagic Shock

This repository contains the code, processed data files, statistical workflows, and figure-generation files that support my PhD dissertation work on **hemorrhagic shock**, **REBOA**, **partial REBOA**, cardiovascular physiology, and data-driven trauma decision support.

The main idea behind this project is pretty simple: hemorrhagic shock is physiologically complicated, and the usual clinical measurements do not always capture what is happening underneath. Across the three aims, I used pressure waveforms, pressure-volume loops, machine learning, and large-animal translational models to better understand how hemorrhage severity and aortic occlusion strategy affect cardiac performance, organ perfusion, metabolic recovery, coagulation, and resuscitation needs.

This README is meant to be a navigation guide. It does not replace the papers, dissertation, or analysis notebooks. It is mainly here so that someone opening the repository can understand what each folder is for, where the major files live, and how the different pieces of the project fit together.

NOTE: I generated this using text to speech and then had AI help to simplify readability. Feel free to [email me](mailto:fahim.mobin@gmail.com) to follow up if something is not making sense.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Research Aims](#research-aims)
- [Repository Status](#repository-status)
- [Repository Map](#repository-map)
- [How to Navigate the Repository](#how-to-navigate-the-repository)
- [Aim 1: Hemorrhage Severity Classification](#aim-1-hemorrhage-severity-classification)
- [Aim 2: Pressure-Volume Loop Analysis During Hemorrhage and REBOA](#aim-2-pressure-volume-loop-analysis-during-hemorrhage-and-reboa)
- [Aim 3: Graded Hemorrhage and REBOA Strategy Optimization](#aim-3-graded-hemorrhage-and-reboa-strategy-optimization)
- [Supporting Data Folders](#supporting-data-folders)
- [Final Documents](#final-documents)
- [Suggested Setup](#suggested-setup)
- [Suggested Analysis Order](#suggested-analysis-order)
- [File Organization Notes](#file-organization-notes)
- [Data and Reproducibility Notes](#data-and-reproducibility-notes)
- [Citation / Dissertation Reference](#citation--dissertation-reference)
- [Contact](#contact)

---

## Project Overview

Hemorrhagic shock is a life-threatening condition caused by blood loss, reduced circulating volume, inadequate tissue perfusion, and eventual cardiovascular decompensation. REBOA, or **Resuscitative Endovascular Balloon Occlusion of the Aorta**, can temporarily stabilize central pressure during non-compressible truncal hemorrhage. However, full aortic occlusion can also increase afterload, limit distal perfusion, and contribute to ischemia-reperfusion injury.

This project approaches the problem from three related directions:

1. **Real-time severity assessment** using arterial pressure waveforms and AI.
2. **Cardiac function analysis** using pressure-volume loop processing and beat-to-beat physiology.
3. **Therapeutic strategy evaluation** comparing no occlusion, partial REBOA, and full REBOA across hemorrhage levels.

So, in practical terms, the repository has three major scientific cores:

- **Aim 1** asks whether arterial waveform data can tell us how bad the hemorrhage is.
- **Aim 2** asks how hemorrhage and REBOA change cardiac function using pressure-volume loop analysis.
- **Aim 3** asks which REBOA strategy performs best across graded hemorrhage severity.

---

## Research Aims

### Aim 1: AI-Based Hemorrhage Severity Classification

**Question:** How severe is the hemorrhage?

**Goal:** Develop machine learning and deep learning models that classify hemorrhage severity using arterial pressure waveform data.

This aim uses waveform processing, feature engineering, Savitzky-Golay filtering, decision trees, random forests, genetic-algorithm-assisted feature optimization, and a multi-head 1D convolutional neural network.

---

### Aim 2: Pressure-Volume Loop Analysis During Hemorrhage and REBOA

**Question:** How do hemorrhage and REBOA affect cardiac performance?

**Goal:** Analyze left ventricular pressure-volume relationships during hemorrhage, aortic occlusion, and vena-caval occlusion using Python-based PV loop processing and downstream statistical analysis.

This aim now has the raw data files, PV loop processing notebooks, processed PV loop outputs, statistics files, manuscript figures, reviewer response materials, and supplementary files uploaded into the repository.

---

### Aim 3: Graded Hemorrhage and REBOA Strategy Optimization

**Question:** How effective are no occlusion, partial REBOA, and full REBOA in restoring hemodynamics across hemorrhage levels?

**Goal:** Evaluate the graded physiological impact of hemorrhage and aortic occlusion modality on cardiac performance, organ perfusion, metabolic state, coagulation, fluids, vasopressors, and recovery.

This aim includes pressure-volume loop outputs, hemodynamic figures, CBC data, TEG data, CG4/CHEM8 data, fluid and pressor processing, statistical scripts, and final manuscript-level figure panels.

---

## Repository Status

| Section | Current Status | Notes |
|---|---:|---|
| Root README | Present | This file is the main navigation page for the repository. |
| Aim 1 | Present | Contains waveform/PV notebooks, random forest and decision tree code, feature-importance outputs, and multi-head CNN inputs/code. |
| Aim 2 | Present | Contains raw PV loop Excel files, PV loop processing code, non-caval and caval occlusion outputs, ESPVR/EDPVR outputs, statistics files, figures, and reviewer-response materials. |
| Aim 3 | Present | Contains PV analysis notebooks, processed Excel files, plotting code, stats folders, generated figures, and manuscript-level outputs. |
| Fluids and Pressors | Present | Contains raw and processed fluid/pressor data workflows, including vasopressin/norepinephrine and urine output processing. |
| TEG | Present | Contains cleaned/original TEG data, plotting notebook, R statistics script, and graph archives. |
| Final Documents | Present | Contains dissertation, defense slides, and paper/manuscript documents. |

---

## Repository Map

The repository is not perfectly clean because it contains both final analysis files and older working folders. That is normal for a dissertation research repository. The map below focuses on the folders that matter most for navigation.

```text
.
├── README.md
├── filepaths.ipynb
├── Sandras Experiment Tracker.xlsx
├── ERNE QA Log.xlsx
├── Kristen Project Graphs.zip
├── MiscOldCodes.zip
├── Aim1/
│   ├── README.md
│   ├── Main Function Flow and Pressure.ipynb
│   ├── Main Function PV.ipynb
│   ├── Cleaned Ensemble Averaged PV Loops.ipynb
│   ├── Multi-head CNN Code/
│   └── Random Forest and Decision Tree Code/
├── Aim2/
│   ├── Ensemble Comparison.ipynb
│   ├── Fahim Paper 1 All Files.zip
│   ├── ESPVR_Curves.xlsx
│   ├── PV Loop Analysis Methodology.pptx
│   ├── paper1_figures.pptx
│   ├── Raw Data Files/
│   ├── Codes/
│   ├── Outputs- Non Caval Occlusion/
│   ├── Outputs- Caval Occlusion/
│   ├── Statistics/
│   └── Reviewer Comments/
├── Aim3/
│   ├── PV Loop Data-ANALYZER.ipynb
│   ├── Individual ERNE Ensemble Averaged PV Loops.xlsx
│   ├── T30 Ensemble Averaged PV Loops.xlsx
│   ├── Experiment Tracker.xlsx
│   ├── Weights and Genders.xlsx
│   ├── PV_Panels/
│   ├── Paper3-RawFigures/
│   ├── Paper Plotting/
│   └── Stats/
├── Fluids and Pressors/
│   ├── Fluid Data/
│   └── CG4Processing/
├── TEG/
└── final-documents/
```

---

## How to Navigate the Repository

Use the repository based on the question you are trying to answer.

| Question | Start Here | Main Files / Folders |
|---|---|---|
| What is the overall dissertation project? | Root `README.md` | Project overview, aims, repository map |
| How were pressure and flow waveforms processed? | `Aim1/` | `Main Function Flow and Pressure.ipynb`, `Main Function PV.ipynb` |
| How were the machine learning models built? | `Aim1/Random Forest and Decision Tree Code/` | RF, decision tree, data generator, feature importance notebooks |
| How was the multi-head 1D CNN trained? | `Aim1/Multi-head CNN Code/` | CNN notebook, input Excel files, `all_dfs.pickle` |
| Where are Aim 2 raw PV files? | `Aim2/Raw Data Files/` | Subject-level Excel files such as `A 1822.xlsx`, `B 1809.xlsx`, `E 1844.xlsx` |
| Where is the Aim 2 processing code? | `Aim2/Codes/` | `PV Loop Code with ESPVR.ipynb`, `PV Loop Code without ESPVR.ipynb` |
| Where are Aim 2 processed outputs? | `Aim2/Outputs- Non Caval Occlusion/` and `Aim2/Outputs- Caval Occlusion/` | PV loop output Excel files organized by time point |
| Where are Aim 2 statistics files? | `Aim2/Statistics/` | Raw stats tables, JMP files, Stata `.do` scripts, JSL script, exported plots |
| Where are Aim 2 reviewer/manuscript files? | `Aim2/Reviewer Comments/` | Reviewer documents, revised figures, supplementary files, STATS PDFs |
| How were Aim 3 PV loops analyzed? | `Aim3/` | `PV Loop Data-ANALYZER.ipynb`, ensemble averaged PV loop Excel files |
| Where are Aim 3 final paper figures? | `Aim3/Paper3-RawFigures/` | Final figure PNGs for CO, ESV, PV loops, carotid flow, renal flow, lactate, creatinine, base excess, fluids/drugs |
| Where are Aim 3 plotting outputs? | `Aim3/Paper Plotting/` | Hemodynamics, hemorrhage comparison, pressure-volume, TEG, CBC, CG4/CHEM8 figures |
| Where are Aim 3 statistics scripts? | `Aim3/Stats/Step 3 Actual Stats/` | R scripts for PV, TEG, CG4/CHEM8, fluids/drugs |
| Where are fluid and vasopressor workflows? | `Fluids and Pressors/Fluid Data/` and `Aim3/Stats/Step 1 Fluids and Drugs Sandbox/` | Raw data, processed outputs, plotting notebooks |
| Where is coagulation / TEG analysis? | `TEG/` and `Aim3/Paper Plotting/TEG/` | TEG plotting notebook, cleaned data, R stats script, generated TEG panels |
| Where are final dissertation/paper files? | `final-documents/` | Dissertation, defense slides, manuscript documents, final figure slides |

---

## Aim 1: Hemorrhage Severity Classification

### Scientific Purpose

Aim 1 develops AI-based models to classify hemorrhage severity using arterial pressure waveform data. The motivation is that traditional vital signs, such as MAP and heart rate, are often not enough to capture patient-specific compensatory physiology during hemorrhage.

### Experimental Context

- Large-animal swine hemorrhage model
- Hemorrhage levels: baseline / 0%, 10%, 20%, and 30%
- Pressure waveforms used for feature extraction and model development
- Dataset boosted with intermediate time points to improve lower-hemorrhage representation

### Main Analysis Components

1. Import raw pressure / flow / PV data.
2. Segment data into cardiac cycles or standardized time windows.
3. Apply smoothing and preprocessing, including Savitzky-Golay filtering.
4. Extract pressure, area, slope, time-domain, and frequency-domain features.
5. Train and compare:
   - Decision Tree
   - Random Forest
   - Random Forest with genetic algorithm feature optimization
   - Multi-head 1D CNN

### Important Files

```text
Aim1/
├── README.md
├── Main Function Flow and Pressure.ipynb
├── Main Function PV.ipynb
├── Cleaned Ensemble Averaged PV Loops.ipynb
├── Multi-head CNN Code/
│   ├── Multi-head 1D CNN model.ipynb
│   ├── 1D_CNN_Inputs-BL.xlsx
│   ├── 1D_CNN_Inputs-Added Groups.xlsx
│   └── all_dfs.pickle
└── Random Forest and Decision Tree Code/
    ├── Decision Tree.ipynb
    ├── RF Code.ipynb
    ├── RF Data Generator.ipynb
    ├── Random Forest Input.xlsx
    ├── Enhanced Random Forest Input.xlsx
    ├── NonEnesmble Waveform Total Output.xlsx
    └── Paper 2 Feature Importance Stuff/
```

### Random Forest and Decision Tree Folder

`Aim1/Random Forest and Decision Tree Code/` contains the classical machine learning workflow for Aim 1.

Main files include:

- `Decision Tree.ipynb`
- `RF Code.ipynb`
- `RF Data Generator.ipynb`
- `Random Forest Input.xlsx`
- `Enhanced Random Forest Input.xlsx`
- `NonEnesmble Waveform Total Output.xlsx`

The nested folder `Paper 2 Feature Importance Stuff/` contains notebooks and outputs used to study feature importance across models. It also includes tree visualization outputs in `Tree Branches/`.

### Expected Outputs

- Cleaned waveform data
- Feature-engineered datasets
- CNN-ready input arrays
- Classification metrics
- Confusion matrices
- Feature importance comparisons
- Model performance summaries

### Key Interpretation

Aim 1 supports the idea that higher-dimensional waveform features provide better hemorrhage severity classification than traditional vital sign thresholds alone. The defense materials emphasized that multi-domain features and AI models improved classification, especially for intermediate hemorrhage classes.

---

## Aim 2: Pressure-Volume Loop Analysis During Hemorrhage and REBOA

### Scientific Purpose

Aim 2 investigates how hemorrhage and aortic occlusion change cardiac performance using left ventricular pressure-volume loop analysis. This aim focuses on both the standard load-dependent PV loop parameters and the load-independent relationships that come from caval occlusion.

This is the aim that is most directly focused on the heart itself. The big question is not only whether REBOA restores pressure, but what that restoration does to ventricular function, afterload, preload, contractility, and pressure-volume relationships.

### Experimental Context

Aim 2 uses a swine hemorrhage and REBOA model with left ventricular pressure-volume catheter data. Based on the dissertation materials, this aim included:

- Controlled hemorrhage of approximately 25% blood volume
- Full REBOA, partial REBOA / EVAC, and no occlusion groups
- Left ventricular pressure-volume catheter data
- Vena-caval occlusion periods for load-independent cardiac assessment
- Non-caval segments for standard PV loop parameter extraction
- Caval occlusion segments for ESPVR and EDPVR-related analysis

### Aim 2 Folder Overview

```text
Aim2/
├── Ensemble Comparison.ipynb
├── Fahim Paper 1 All Files.zip
├── ESPVR_Curves.xlsx
├── PV Loop Analysis Methodology.pptx
├── paper1_figures.pptx
├── Raw Data Files/
├── Codes/
├── Outputs- Non Caval Occlusion/
├── Outputs- Caval Occlusion/
├── Statistics/
└── Reviewer Comments/
```

### Aim 2 Top-Level Files

These are the main top-level files in the Aim 2 folder:

- `Aim2/Ensemble Comparison.ipynb`
- `Aim2/Fahim Paper 1 All Files.zip`
- `Aim2/ESPVR_Curves.xlsx`
- `Aim2/PV Loop Analysis Methodology.pptx`
- `Aim2/paper1_figures.pptx`

How to think about these files:

- `Ensemble Comparison.ipynb` appears to be the main notebook for comparing processed PV loop outputs across animals, time points, or groups.
- `Fahim Paper 1 All Files.zip` is likely the compressed archive of the full Aim 2 paper-related working folder.
- `ESPVR_Curves.xlsx` stores end-systolic pressure-volume relationship outputs or curve data.
- `PV Loop Analysis Methodology.pptx` documents the processing approach visually.
- `paper1_figures.pptx` contains Aim 2 / Paper 1 figure panels.

### Aim 2 Raw Data Files

Raw Aim 2 Excel files are stored here:

```text
Aim2/Raw Data Files/
```

Current raw files:

- `Aim2/Raw Data Files/B 1832.xlsx`
- `Aim2/Raw Data Files/B 1809.xlsx`
- `Aim2/Raw Data Files/E 1844.xlsx`
- `Aim2/Raw Data Files/E 1848.xlsx`
- `Aim2/Raw Data Files/E 1824.xlsx`
- `Aim2/Raw Data Files/A 1822.xlsx`
- `Aim2/Raw Data Files/A 1839.xlsx`
- `Aim2/Raw Data Files/B 1827.xlsx`
- `Aim2/Raw Data Files/A 1825.xlsx`

These look like subject-level raw Excel files. The file names use letter-number animal identifiers, such as `A 1822.xlsx`, `B 1809.xlsx`, and `E 1844.xlsx`.

### Aim 2 Processing Code

The main PV loop processing notebooks are stored here:

```text
Aim2/Codes/
```

Current code files:

- `Aim2/Codes/PV Loop Code with ESPVR.ipynb`
- `Aim2/Codes/PV Loop Code without ESPVR.ipynb`

The two main notebooks separate the processing workflow into:

1. **PV loop processing with ESPVR**  
   This is used when caval occlusion is included and load-independent relationships are being calculated.

2. **PV loop processing without ESPVR**  
   This is used for standard non-caval occlusion PV loop processing, where the main goal is extracting beat-to-beat or time-window PV loop parameters.

### Aim 2 Non-Caval Occlusion Outputs

Processed non-caval outputs are stored here:

```text
Aim2/Outputs- Non Caval Occlusion/
```

This folder contains PV loop output Excel files organized by time point. The current time-point folders are:

```text
T0.0/
T0.2/
T30.0/
T30.2/
T74.0/
T74.2/
```

These files generally follow this naming pattern:

```text
PVLoop_Output_<Animal ID>.xlsx_<Time Point>.xlsx
```

Example file names include:

```text
PVLoop_Output_A 1822.xlsx_T0.0.xlsx
PVLoop_Output_B 1809.xlsx_T30.0.xlsx
PVLoop_Output_E 1848.xlsx_T74.2.xlsx
```

In plain language, this folder is where I would look for the standard PV loop parameter outputs that do **not** require caval occlusion / ESPVR processing.

### Aim 2 Caval Occlusion Outputs

Processed caval occlusion outputs are stored here:

```text
Aim2/Outputs- Caval Occlusion/
```

The current time-point folders are:

```text
T0.1/
T30.1/
T74.1/
```

This folder contains three major output types:

```text
PVLoop_Output_<Animal ID>.xlsx_<Time Point>.xlsx
PVLoop_ESPVR_<Animal ID>.xlsx_<Time Point>.xlsx
PVLoop_EDPVR_<Animal ID>.xlsx_<Time Point>.xlsx
```

How to read these:

- `PVLoop_Output_*` = processed PV loop parameter outputs.
- `PVLoop_ESPVR_*` = end-systolic pressure-volume relationship outputs.
- `PVLoop_EDPVR_*` = end-diastolic pressure-volume relationship outputs.

This is the folder that matters most for load-independent analysis, because caval occlusion allows preload to be varied so that ESPVR and EDPVR relationships can be estimated.

### Aim 2 Statistics Folder

Aim 2 statistics files are stored here:

```text
Aim2/Statistics/
```

Current statistics-related files:

- `Aim2/Statistics/Raw Data Table.xlsx`
- `Aim2/Statistics/Pre and Post Occlusion Analyses - Predictor Screening.jpg`
- `Aim2/Statistics/Expanded_Analysis_Framework.xlsx`
- `Aim2/Statistics/JMP_raw_work.txt`
- `Aim2/Statistics/Pre and Post Occlusion Analyses.jmp`
- `Aim2/Statistics/Cumulative Sheet Analyses - Predictor Screening.png`
- `Aim2/Statistics/JMP_Pre_and_Post.txt`
- `Aim2/Statistics/Cumulative Sheet Analyses -ESV.png`
- `Aim2/Statistics/Session Script.jsl`
- `Aim2/Statistics/Fahim_round_1_stata.do`
- `Aim2/Statistics/PV Loop Statistics-Raw Data.xlsx`
- `Aim2/Statistics/Pre_and_Post_Occlusion_Analysis.do`
- `Aim2/Statistics/Cumulative_Occlusion_Analysis.do`
- `Aim2/Statistics/Sandbox.do`
- `Aim2/Statistics/Cumulative Sheet Analyses -SW.png`
- `Aim2/Statistics/Cumulative Sheet Analyses-2.jmp`
- `Aim2/Statistics/JMP Complete.txt`
- `Aim2/Statistics/Pre and Post Occlusion Analyses - Graph Builder.png`
- `Aim2/Statistics/Cumulative Sheet Analyses.jmp`

This folder contains a mix of raw statistical input tables, JMP analyses, Stata scripts, exported JMP text, and diagnostic/graph builder outputs.

Important files include:

- `Raw Data Table.xlsx`
- `PV Loop Statistics-Raw Data.xlsx`
- `Expanded_Analysis_Framework.xlsx`
- `Pre_and_Post_Occlusion_Analysis.do`
- `Cumulative_Occlusion_Analysis.do`
- `Fahim_round_1_stata.do`
- `Session Script.jsl`
- `Pre and Post Occlusion Analyses.jmp`
- `Cumulative Sheet Analyses.jmp`

A reasonable way to read this folder is:

1. Use the Excel files as the statistical input / cleaned summary tables.
2. Use the `.do` files for Stata-based analyses.
3. Use the `.jmp` and `.jsl` files for JMP analyses and scripted JMP workflows.
4. Use the `.txt`, `.jpg`, and `.png` files as exported analysis logs or figure outputs from the statistics process.

### Aim 2 Reviewer Comments and Manuscript Materials

Reviewer and revision-related files are stored here:

```text
Aim2/Reviewer Comments/
```

Main reviewer/manuscript files:

- `Aim2/Reviewer Comments/Finalized Supplementary File_edit.docx`
- `Aim2/Reviewer Comments/Frontiers-Reviewer3-comments.docx`
- `Aim2/Reviewer Comments/Supplementary_File_A.docx`
- `Aim2/Reviewer Comments/Frontiers-Manuscript-RevisedFigures-072723.pptx`
- `Aim2/Reviewer Comments/Supplementary_File_B.docx`
- `Aim2/Reviewer Comments/paper1_figures-edited.pptx`
- `Aim2/Reviewer Comments/Frontiers-Reviewer2-comments.docx`

Figures are stored here:

```text
Aim2/Reviewer Comments/Figures/
```

Current figure files:

- `Aim2/Reviewer Comments/Figures/Figure3.jpg`
- `Aim2/Reviewer Comments/Figures/Figure2.jpg`
- `Aim2/Reviewer Comments/Figures/Figure1.jpg`
- `Aim2/Reviewer Comments/Figures/Figure5.jpg`
- `Aim2/Reviewer Comments/Figures/Figure4.jpg`
- `Aim2/Reviewer Comments/Figures/Figure6.jpg`
- `Aim2/Reviewer Comments/Figures/Figure7.jpg`

Reviewer-related statistics PDFs are stored here:

```text
Aim2/Reviewer Comments/STATS/
```

Current STATS files:

- `Aim2/Reviewer Comments/STATS/EaEJF.pdf`
- `Aim2/Reviewer Comments/STATS/ESPVR.pdf`
- `Aim2/Reviewer Comments/STATS/F-Test3.pdf`
- `Aim2/Reviewer Comments/STATS/F-Test2.pdf`
- `Aim2/Reviewer Comments/STATS/HRCO.pdf`
- `Aim2/Reviewer Comments/STATS/End Diastole.pdf`
- `Aim2/Reviewer Comments/STATS/F-Test.pdf`
- `Aim2/Reviewer Comments/STATS/PV Loop Statistics-Raw Data.xlsx`
- `Aim2/Reviewer Comments/STATS/End Systole.pdf`
- `Aim2/Reviewer Comments/STATS/StrokeStuff.pdf`

This section is useful if someone is trying to understand how the final Aim 2 manuscript changed during review, or if they want to find the figure and statistics files that supported the revised Frontiers submission.

### Aim 2 Workflow

A practical Aim 2 workflow looks like this:

1. **Start with raw Excel files**  
   Use `Aim2/Raw Data Files/` as the original subject-level PV loop data source.

2. **Run the PV loop processing notebooks**  
   Use `Aim2/Codes/PV Loop Code without ESPVR.ipynb` for standard PV loop outputs.  
   Use `Aim2/Codes/PV Loop Code with ESPVR.ipynb` when caval occlusion and ESPVR/EDPVR are needed.

3. **Check the output folders**  
   Use `Outputs- Non Caval Occlusion/` for standard PV loop outputs.  
   Use `Outputs- Caval Occlusion/` for PV loop outputs plus ESPVR and EDPVR files.

4. **Use ensemble comparison / compiled files**  
   Use `Ensemble Comparison.ipynb` and `ESPVR_Curves.xlsx` for downstream summaries and comparisons.

5. **Run statistics**  
   Use the files in `Aim2/Statistics/`, especially the raw statistics tables and `.do` scripts.

6. **Find manuscript and reviewer outputs**  
   Use `paper1_figures.pptx`, `PV Loop Analysis Methodology.pptx`, and `Reviewer Comments/` for final presentation, figure, and review-related material.

### Expected Aim 2 Outputs

- Cleaned PV loop output files
- Non-caval PV loop parameter summaries
- Caval occlusion PV loop outputs
- ESPVR output files
- EDPVR output files
- Ensemble comparison outputs
- Statistical input tables
- JMP / Stata analysis files
- Manuscript-ready figures
- Reviewer-response figures and supplementary files

---

## Aim 3: Graded Hemorrhage and REBOA Strategy Optimization

### Scientific Purpose

Aim 3 evaluates how hemorrhage severity and REBOA strategy affect hemodynamic recovery, cardiac performance, distal perfusion, metabolic injury, coagulation, and resuscitation burden.

This aim is broader than Aim 2. Aim 2 is focused heavily on cardiac mechanics and PV relationships. Aim 3 uses the bigger graded hemorrhage dataset and asks how hemorrhage level and occlusion strategy affect the whole physiological response.

### Experimental Context

Aim 3 uses a graded hemorrhage model with animals assigned to:

- 10% hemorrhage
- 20% hemorrhage
- 30% hemorrhage

Within each hemorrhage level, animals were assigned to:

- No occlusion
- Partial REBOA
- Full REBOA

The main idea is to compare whether partial REBOA can preserve hemodynamics and organ perfusion while avoiding some of the injury patterns associated with full occlusion.

### Main Aim 3 Files

```text
Aim3/
├── PV Loop Data-ANALYZER.ipynb
├── Individual ERNE Ensemble Averaged PV Loops.xlsx
├── T30 Ensemble Averaged PV Loops.xlsx
├── Experiment Tracker.xlsx
├── Weights and Genders.xlsx
├── PV_Panels/
├── Paper3-RawFigures/
├── Paper Plotting/
└── Stats/
```

### Aim 3 Main Notebook

`Aim3/PV Loop Data-ANALYZER.ipynb`

Likely purpose:

- Load pressure-volume data
- Clean and process PV loop data
- Generate subject-level or group-level PV loop summaries
- Export ensemble averaged PV loop tables
- Support Aim 3 pressure-volume figure generation

### Aim 3 Processed PV Data

```text
Aim3/Individual ERNE Ensemble Averaged PV Loops.xlsx
Aim3/T30 Ensemble Averaged PV Loops.xlsx
Aim3/Paper Plotting/PV_Fractional_Increase_T0-1.xlsx
Aim3/Paper Plotting/Fractional_Increase_0.xlsx
```

These files store processed PV loop summaries, fractional change outputs, or intermediate tables used for downstream plotting and statistical analysis.

### Aim 3 Final Raw Figure Folder

```text
Aim3/Paper3-RawFigures/
├── Fig2-CO.png
├── Fig2-ESV.png
├── Fig3-PVLoop.png
├── Fig4-Carotid.png
├── Fig4-Renal.png
├── Fig5-BaseExcess.png
├── Fig5-Creatinine.png
├── Fig5-Lactate.png
└── Fig6-DrugsFluidsCombined.png
```

This folder appears to contain manuscript-level figure panels for Aim 3.

### Aim 3 Paper Plotting Folder

```text
Aim3/Paper Plotting/
├── Plotting Code.ipynb
├── CG4 and CHEM8 Data.xlsx
├── ERNE_TEG_Cleaned.xlsx
├── Experiment Tracker.xlsx
├── Weights and Genders.xlsx
├── Hemodynamics/
├── Hemorrhage Comparison/
├── Pressure-Volume/
├── PV Box Plots/
├── TEG/
├── CBC Data/
├── CG4 and CHEM8 Plots/
└── Targetted/
```

This folder contains the plotting notebook, cleaned supporting data, and output folders for different physiological domains.

#### Hemodynamics

`Aim3/Paper Plotting/Hemodynamics/`

Contains probe-level plots for pressure, flow, and volume values. Examples include:

- Ascending flow
- Carotid flow
- Renal flow
- Distal flow
- Distal pressure
- Proximal pressure
- Right jugular pressure
- LV pressure
- LV volume
- Aoballoon flow
- Brachiocephalic flow

Files are generally named using this pattern:

```text
Probe_<Probe Name>_<Summary Statistic>.png
```

Example files:

```text
Probe_Renal Flow_Avg.png
Probe_Carotid Flow_Max.png
Probe_Distal Pressure_Min.png
Probe_LV Pressure_Avg.png
```

#### Hemorrhage Comparison

`Aim3/Paper Plotting/Hemorrhage Comparison/`

Contains combined comparison figures across hemorrhage levels and/or treatment groups. Files use a pattern like:

```text
Probe_<Probe Name>_<Summary Statistic>_combined.png
```

#### Pressure-Volume

`Aim3/Paper Plotting/Pressure-Volume/`

Contains PV-derived parameter panels, including:

- Cardiac output
- Ejection fraction
- Stroke volume
- Stroke work
- Heart rate
- Elastance
- End-diastolic pressure
- End-diastolic volume
- End-systolic pressure
- End-systolic volume

Example files:

```text
Cardiac Output_Panel.png
Ejection Fraction_Panel.png
Stroke Volume_Panel.png
Elastance_Panel.png
EDP_Panel.png
EDV_Panel.png
ESP_Panel.png
ESV_Panel.png
```

#### CBC Data

`Aim3/Paper Plotting/CBC Data/`

Contains CBC Excel files, a CBC plotting notebook, a combined debug workbook, experiment tracker, and CBC output plots.

Important files / folders:

```text
CBC_Plotting.ipynb
CBC_combined_debug.xlsx
Experiment Tracker.xlsx
CBC_Plots/
```

The `CBC_Plots/` folder contains parameter-level plots such as WBC, RBC, HGB, HCT, PLT, MCV, MCH, MCHC, lymphocytes, neutrophils, eosinophils, monocytes, basophils, and related percentages.

#### TEG

`Aim3/Paper Plotting/TEG/`

Contains Aim 3 TEG figure panels, including:

```text
TEG_R_time_Panel.png
TEG_K_time_Panel.png
TEG_Angle_Panel.png
TEG_MA_Panel.png
TEG_G_Panel.png
TEG_LY30_Panel.png
```

#### CG4 and CHEM8

```text
Aim3/Paper Plotting/CG4 and CHEM8 Data.xlsx
Aim3/Paper Plotting/CG4 and CHEM8 Plots/
```

Contains blood chemistry, metabolic, renal, acid-base, and electrolyte related outputs such as lactate, base excess, creatinine, BUN, potassium, chloride, anion gap, pH, and related values.

#### Targetted

`Aim3/Paper Plotting/Targetted/`

This folder contains a more focused plotting workflow and targeted outputs, including:

```text
Plotting-Targetted.ipynb
Processed_Data_with_Vasopressin.xlsx
Hemorrhage_Occlusion_3x3_grid.png
Hemodynamics/Avg_multiplot.png
Pressure-Volume/Multiterm_Panel.png
```

This appears to be the place where specific targeted plots were created after the broader plotting workflow was already developed.

### Aim 3 Statistics Folder

```text
Aim3/Stats/
├── README.md
├── Step 1 Fluids and Drugs Sandbox/
├── Step 2 File Cleaning/
├── Step 3 Actual Stats/
├── Step 4 Tables and Stats/
├── Pig Vendor Data/
└── data_graveyard/
```

#### Step 1: Fluids and Drugs Sandbox

This folder contains the main fluid and vasopressor processing sandbox.

Important files:

```text
Pressor and Fluids Data Processing.ipynb
Process Data.ipynb
Plotting.ipynb
Processed_Data_Output.xlsx
Processed_Data_with_Vasopressin.xlsx
Vasopressin and Norepi.xlsx
Processed Data.xlsx
Processed Data In Order.xlsx
Urine Output.xlsx
Experiment Tracker.xlsx
MacKenzie Raw Data/
```

The `MacKenzie Raw Data/` folder contains subject-level raw fluid/pressor files.

#### Step 2: File Cleaning

This folder contains cleaned files generated before statistics.

Important files:

```text
Append Fluid and Drug Data.ipynb
Processed_Data_Output.xlsx
cleanedPV_Fractional_Increase_T0-1.xlsx
cleanedFractional_Increase_0.xlsx
README.md
```

#### Step 3: Actual Stats

This is the main Aim 3 statistics folder.

Important files:

```text
PV_02.18.26.R
CHEM8_CG4_02.19.26.R
Flow_Pressure_06.13.25.R
TEG Stats_08.27.25.R
Fluids_Drugs_08.27.25.R
PV_Fractional_Increase_T0-1.xlsx
Fractional_Increase_0.xlsx
CG4 and CHEM8 Data.xlsx
ERNE_TEG_Cleaned.xlsx
Experiment Tracker.xlsx
README.md
```

This is the folder I would use first when trying to reproduce the final Aim 3 statistical outputs.

#### Step 4: Tables and Stats

This folder contains manuscript/statistical summary tables and table-specific significance tests.

Important files:

```text
PV.xlsx
Flow.xlsx
TEG.xlsx
Carotid.xlsx
Experiment Tracker.xlsx
Working manuscript _Aim 3.docx
Working manuscript _Aim 3 06.24.25.docx
Working manuscript _Aim 3 06.30.25.docx
Table Tests of Significance/
```

The nested `Table Tests of Significance/` folder contains R scripts and Excel files for table-specific tests, including PV, MAP, renal, carotid, and fluids analyses.

---

## Supporting Data Folders

### Fluids and Pressors

The `Fluids and Pressors/` folder contains a broader standalone workflow for fluid, urine output, vasopressor, and CG4 processing.

```text
Fluids and Pressors/
├── Fluid Data/
└── CG4Processing/
```

#### Fluid Data

`Fluids and Pressors/Fluid Data/` includes raw data, cleaned data, processed output tables, and plotting notebooks.

Important files:

```text
Pressor and Fluids Data Processing.ipynb
CLEANED Pressor and Fluids Data Processing.ipynb
Process Data.ipynb
Plotting.ipynb
oldPlotting.ipynb
Processed_Data_Output.xlsx
Processed_Data_with_Vasopressin.xlsx
Processed_Data_with_Vasopressin_and_Division.xlsx
Vasopressin and Norepi.xlsx
Urine Output.xlsx
Hetastarch Raw.xlsx
Processed_Hetastarch_Data.xlsx
Raw_Treatment_Data_By_Time.xlsx
Raw_Data_by_Treatment.xlsx
Raw_Values_at_Time240_by_Parameter.xlsx
Raw_Values_by_Parameter_and_Time.xlsx
Raw Data/
```

The `Raw Data/` folder contains the subject-level raw Excel files and templates used to build the processed fluid/pressor tables.

#### CG4 Processing

`Fluids and Pressors/CG4Processing/` contains CG4-related processing and unsupervised learning experiments.

Important files:

```text
K-Means Clustering- Unsupervised Learning Code.ipynb
sandboxK-Means Clustering.ipynb
Code to Rename Excels.ipynb
Raw CG4.zip
Processed CG4.zip
```

### TEG

The standalone `TEG/` folder contains coagulation-related data and workflows.

Important files:

```text
TEG/TEG Data Plotting.ipynb
TEG/TEG Stats_06.02.25.R
TEG/original_ERNE_TEG.xlsx
TEG/cleaned_ERNE_TEG.xlsx
TEG/graph_archive.zip
TEG/SEM Graphs.zip
TEG/old_code_archives.zip
```

This folder is useful for reproducing or checking the TEG analysis outside the Aim 3 paper plotting folder.

---

## Final Documents

The `final-documents/` folder contains the major final writing and presentation files.

```text
final-documents/
├── Dissertation- Fahim Mobin.docx
├── Dissertation- Fahim Mobin.pdf
├── PhD Defense Final.pptx
├── Paper2.docx
├── Paper3.docx
└── Paper3_Final Figures.pptx
```

These files are useful for understanding how the code and data outputs were ultimately presented in dissertation and manuscript form.

---

## Suggested Setup

This repository contains a mix of Python notebooks, R scripts, Stata scripts, JMP files, Excel workbooks, PowerPoint files, and Word documents.

A basic working setup should include:

- Python 3.x
- Jupyter Notebook or JupyterLab
- pandas
- numpy
- scipy
- matplotlib
- seaborn
- scikit-learn
- TensorFlow / Keras, if running the CNN code
- R and RStudio, if running the Aim 3 R statistics scripts
- Stata, if running the Aim 2 `.do` files
- JMP, if opening the `.jmp` and `.jsl` files
- Microsoft Excel for checking raw and processed workbook outputs

Because this was developed across multiple phases of a dissertation, some notebooks may have local file paths that need to be updated before running on a new machine.

---

## Suggested Analysis Order

The analysis order depends on what someone is trying to reproduce, but this is the order I would recommend for understanding the project.

### 1. Start with the dissertation-level overview

Read:

```text
README.md
final-documents/Dissertation- Fahim Mobin.pdf
final-documents/PhD Defense Final.pptx
```

This gives the scientific motivation, experimental design, and high-level conclusions.

### 2. Review Aim 1

Start with:

```text
Aim1/README.md
Aim1/Main Function Flow and Pressure.ipynb
Aim1/Random Forest and Decision Tree Code/RF Data Generator.ipynb
Aim1/Random Forest and Decision Tree Code/RF Code.ipynb
Aim1/Multi-head CNN Code/Multi-head 1D CNN model.ipynb
```

This shows how the waveform-based AI side of the project was built.

### 3. Review Aim 2

Start with:

```text
Aim2/PV Loop Analysis Methodology.pptx
Aim2/Codes/PV Loop Code without ESPVR.ipynb
Aim2/Codes/PV Loop Code with ESPVR.ipynb
Aim2/Ensemble Comparison.ipynb
Aim2/Statistics/PV Loop Statistics-Raw Data.xlsx
```

This shows how the PV loop data were processed and how the statistical analysis was organized.

### 4. Review Aim 3

Start with:

```text
Aim3/PV Loop Data-ANALYZER.ipynb
Aim3/Paper Plotting/Plotting Code.ipynb
Aim3/Stats/Step 3 Actual Stats/README.md
Aim3/Stats/Step 3 Actual Stats/PV_02.18.26.R
Aim3/Stats/Step 3 Actual Stats/Flow_Pressure_06.13.25.R
Aim3/Stats/Step 3 Actual Stats/CHEM8_CG4_02.19.26.R
Aim3/Stats/Step 3 Actual Stats/TEG Stats_08.27.25.R
Aim3/Stats/Step 3 Actual Stats/Fluids_Drugs_08.27.25.R
```

This gives the most direct path to the Aim 3 outputs and final statistics.

---

## File Organization Notes

A few notes will make the repository easier to work with:

1. **Temporary system files are present.**  
   Files like `.DS_Store`, `.ipynb_checkpoints`, and `~$...xlsx` are generated by macOS, Jupyter, or Microsoft Office. They are not scientific source files and can generally be ignored.

2. **Some archive folders are historical.**  
   Files or folders named `archive`, `graveyard`, `old`, or `sandbox` usually contain earlier versions of code or intermediate experiments. They may still be useful for tracing development, but they are not usually the first place to start.

3. **Aim 2 has both non-caval and caval outputs.**  
   This distinction matters. Non-caval outputs are mainly standard PV loop parameters. Caval occlusion outputs are where ESPVR and EDPVR-related files live.

4. **Aim 3 has several duplicate-looking files because the workflow moved through stages.**  
   For Aim 3 statistics, the cleanest place to start is usually `Aim3/Stats/Step 3 Actual Stats/` rather than the older sandbox or graveyard folders.

5. **Some filenames contain spaces.**  
   This is fine for normal navigation, but if running scripts from a terminal, wrap file paths in quotes.

6. **Some notebooks may need path edits.**  
   Several notebooks were likely written on a local machine and may contain absolute or relative paths that need to be adjusted before running elsewhere.

---

## Data and Reproducibility Notes

This repository is designed as a research archive and navigation point, not a fully packaged Python library. The main reproducibility path is through the notebooks and scripts.

General reproducibility approach:

1. Start from the raw or cleaned Excel files in the relevant aim folder.
2. Run the processing notebook for that aim.
3. Check the generated processed Excel outputs.
4. Run the statistics script or JMP/Stata workflow.
5. Compare the generated figures or tables with the manuscript/dissertation outputs.

Because these datasets come from large-animal experiments, users should also preserve subject IDs, treatment groups, time points, and any exclusion notes when modifying or rerunning analyses.

---

## Citation / Dissertation Reference

Dissertation title:

**Artificial Intelligence and Advanced Modeling Techniques for Optimizing Resuscitation Strategies in Hemorrhagic Shock**

Author:

**Fahim Usshihab Mobin, PhD**

Advisor:

**Dr. Ellie Rahbar**

Institutional context:

Virginia Tech – Wake Forest University School of Biomedical Engineering and Sciences / Wake Forest School of Medicine research environment.

---

## Contact

For questions about the repository, dissertation work, or analysis files, contact the repository owner / dissertation author.
