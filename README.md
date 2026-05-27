# Artificial Intelligence and Advanced Modeling Techniques for Optimizing Resuscitation Strategies in Hemorrhagic Shock

This repository contains the data-processing notebooks, statistical workflows, machine learning / deep learning code, and figure-generation files supporting my PhD dissertation research on **hemorrhagic shock**, **REBOA**, **partial REBOA**, cardiovascular physiology, and data-driven trauma decision support.

The overall goal of this work is to use **physiological signal processing**, **pressure-volume loop analysis**, **machine learning**, and **translational large-animal models** to better understand how hemorrhage severity and aortic occlusion strategies affect hemodynamic recovery, cardiac performance, organ perfusion, and resuscitation needs.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Research Aims](#research-aims)
- [Repository Status](#repository-status)
- [Recommended Repository Structure](#recommended-repository-structure)
- [How to Navigate the Repository](#how-to-navigate-the-repository)
- [Aim 1: Hemorrhage Severity Classification](#aim-1-hemorrhage-severity-classification)
- [Aim 2: Pressure-Volume Loop Analysis During Hemorrhage and REBOA](#aim-2-pressure-volume-loop-analysis-during-hemorrhage-and-reboa)
- [Aim 3: Graded Hemorrhage and REBOA Strategy Optimization](#aim-3-graded-hemorrhage-and-reboa-strategy-optimization)
- [Supporting Data Folders](#supporting-data-folders)
- [Suggested Setup](#suggested-setup)
- [Suggested Analysis Order](#suggested-analysis-order)
- [File Organization Notes](#file-organization-notes)
- [Data and Reproducibility Notes](#data-and-reproducibility-notes)
- [Citation / Dissertation Reference](#citation--dissertation-reference)
- [Contact](#contact)

---

## Project Overview

Hemorrhagic shock is a life-threatening condition caused by blood loss, reduced circulating volume, inadequate tissue perfusion, and eventual cardiovascular decompensation. REBOA, or **Resuscitative Endovascular Balloon Occlusion of the Aorta**, can temporarily stabilize central pressure during non-compressible truncal hemorrhage, but full occlusion can also increase afterload, reduce distal perfusion, and worsen ischemia-reperfusion injury.

This project investigates the problem from three complementary perspectives:

1. **Real-time severity assessment** using arterial pressure waveforms and AI.
2. **Cardiac function analysis** using pressure-volume loop processing and beat-to-beat physiology.
3. **Therapeutic strategy evaluation** comparing no occlusion, partial REBOA, and full REBOA across graded hemorrhage levels.

The repository is intended to help future readers understand where raw data, processed data, notebooks, statistical scripts, and final figures live.

---

## Research Aims

### Aim 1: AI-Based Hemorrhage Severity Classification

**Question:** How severe is the hemorrhage?

**Goal:** Develop machine learning and deep learning models that classify hemorrhage severity using arterial pressure waveform data.

This aim uses pressure waveform processing, feature engineering, Savitzky-Golay filtering, decision trees, random forests, genetic-algorithm-assisted feature optimization, and a multi-head 1D convolutional neural network.

---

### Aim 2: Pressure-Volume Loop Analysis During Hemorrhage and REBOA

**Question:** How do hemorrhage and REBOA affect cardiac performance?

**Goal:** Analyze left ventricular pressure-volume relationships during hemorrhage, aortic occlusion, and vena-caval occlusion using Python-based beat-to-beat PV loop processing.

This aim is currently planned for repository expansion. The raw Aim 2 Excel files and associated processing / statistics code have not yet been uploaded. A recommended folder structure is included below so the future Aim 2 upload can match the rest of the repository.

---

### Aim 3: Graded Hemorrhage and REBOA Strategy Optimization

**Question:** How effective are no occlusion, partial REBOA, and full REBOA in restoring hemodynamics across hemorrhage levels?

**Goal:** Evaluate the graded physiological impact of hemorrhage and aortic occlusion modality on cardiac performance, organ perfusion, metabolic state, coagulation, fluids, vasopressors, and recovery.

This aim includes pressure-volume loop outputs, hemodynamic figures, CBC data, TEG data, CG4/CHEM8 data, fluid and pressor processing, statistical scripts, and final figure panels.

---

## Repository Status

Current high-level status:

| Section | Current Status | Notes |
|---|---:|---|
| Root README | Present | Existing README provided the scientific overview and aims. This version expands navigation and reproducibility details. |
| Aim 1 | Present | Contains PV/flow/pressure notebooks and multi-head CNN inputs/code. |
| Aim 2 | Planned | Raw Excel files and Aim 2 processing/statistics scripts are not yet uploaded. Placeholder structure is recommended below. |
| Aim 3 | Present | Contains analysis notebooks, processed Excel files, plotting code, stats folders, and generated figures. |
| Fluids and Pressors | Present | Contains raw/processed fluid and vasopressor data workflows. |
| TEG | Present | Contains TEG cleaned/original data, plotting notebook, R stats script, and graph archives. |

---

## Recommended Repository Structure

The directory currently contains Aim 1 and Aim 3 materials, along with supporting data folders. After Aim 2 is added, the repository should ideally look like this:

```text
.
├── README.md
├── filepaths.ipynb
├── Sandras Experiment Tracker.xlsx
├── ERNE QA Log.xlsx
├── Aim1/
│   ├── README.md
│   ├── Main Function Flow and Pressure.ipynb
│   ├── Main Function PV.ipynb
│   ├── Cleaned Ensemble Averaged PV Loops.ipynb
│   └── Multi-head CNN Code/
│       ├── Multi-head 1D CNN model.ipynb
│       ├── 1D_CNN_Inputs-BL.xlsx
│       ├── 1D_CNN_Inputs-Added Groups.xlsx
│       └── all_dfs.pickle
├── Aim2/                                  # Planned / not yet uploaded
│   ├── README.md
│   ├── raw_data/
│   │   ├── subject_level_excel_files/
│   │   └── experiment_tracker.xlsx
│   ├── processed_data/
│   │   ├── cleaned_pv_loops.xlsx
│   │   ├── beat_to_beat_parameters.xlsx
│   │   ├── ensemble_averaged_pv_loops.xlsx
│   │   └── load_independent_metrics.xlsx
│   ├── notebooks/
│   │   ├── 01_import_labchart_exports.ipynb
│   │   ├── 02_clean_and_segment_pv_loops.ipynb
│   │   ├── 03_extract_pv_parameters.ipynb
│   │   ├── 04_generate_ensemble_averages.ipynb
│   │   └── 05_plot_aim2_figures.ipynb
│   ├── stats/
│   │   ├── aim2_statistics.R
│   │   ├── model_outputs/
│   │   └── statistical_tables/
│   └── figures/
│       ├── pv_loop_examples/
│       ├── load_dependent_metrics/
│       └── load_independent_metrics/
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
└── TEG/
    ├── TEG Data Plotting.ipynb
    ├── TEG Stats_06.02.25.R
    ├── original_ERNE_TEG.xlsx
    └── cleaned_ERNE_TEG.xlsx
```

---

## How to Navigate the Repository

Use the repository based on the question you are trying to answer:

| Question | Start Here | Main Files / Folders |
|---|---|---|
| What is the overall dissertation project? | Root `README.md` | Project overview, aims, repository map |
| How were pressure and flow waveforms processed? | `Aim1/` | `Main Function Flow and Pressure.ipynb`, `Main Function PV.ipynb` |
| How was the multi-head 1D CNN trained? | `Aim1/Multi-head CNN Code/` | `Multi-head 1D CNN model.ipynb`, CNN input Excel files, `all_dfs.pickle` |
| How were Aim 3 PV loops analyzed? | `Aim3/` | `PV Loop Data-ANALYZER.ipynb`, ensemble averaged PV loop Excel files |
| Where are Aim 3 final paper figures? | `Aim3/Paper3-RawFigures/` | Final figure PNGs for CO, ESV, PV loops, carotid flow, renal flow, lactate, creatinine, base excess, fluids/drugs |
| Where are Aim 3 plotting outputs? | `Aim3/Paper Plotting/` | Hemodynamics, hemorrhage comparison, pressure-volume, TEG, CBC, CG4/CHEM8 figures |
| Where are statistics scripts? | `Aim3/Stats/Step 3 Actual Stats/` | R scripts for PV, TEG, CG4/CHEM8, fluids/drugs |
| Where are fluid and vasopressor workflows? | `Fluids and Pressors/Fluid Data/` and `Aim3/Stats/Step 1 Fluids and Drugs Sandbox/` | Raw data, processed outputs, plotting notebooks |
| Where is coagulation / TEG analysis? | `TEG/` and `Aim3/Paper Plotting/TEG/` | TEG plotting notebook, cleaned data, R stats script, generated TEG panels |
| Where will Aim 2 go? | Future `Aim2/` folder | Raw Excel files, PV processing code, stats code, and paper-related outputs |

---

## Aim 1: Hemorrhage Severity Classification

### Scientific Purpose

Aim 1 develops AI-based models to classify hemorrhage severity using arterial pressure waveform data. The motivation is that traditional vital signs, such as MAP and heart rate, are often insufficient to capture patient-specific compensatory physiology during hemorrhage.

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
└── Multi-head CNN Code/
    ├── Multi-head 1D CNN model.ipynb
    ├── 1D_CNN_Inputs-BL.xlsx
    ├── 1D_CNN_Inputs-Added Groups.xlsx
    └── all_dfs.pickle
```

### Expected Outputs

- Cleaned waveform data
- Feature-engineered datasets
- CNN-ready input arrays
- Classification metrics
- Confusion matrices
- Feature importance comparisons
- Model performance summaries

### Key Interpretation

Aim 1 supports the idea that higher-dimensional waveform features provide better hemorrhage severity classification than traditional vital sign thresholds alone. The final defense materials emphasized that multi-domain features and AI models improved classification, especially for intermediate hemorrhage classes.

---

## Aim 2: Pressure-Volume Loop Analysis During Hemorrhage and REBOA

> **Current status:** Aim 2 files are not yet uploaded. This section is written as a planned structure and documentation template to match when the raw Excel files, code, and statistics scripts are added.

### Scientific Purpose

Aim 2 investigates how hemorrhage and aortic occlusion alter cardiac performance using left ventricular pressure-volume loop analysis. This aim focuses on both load-dependent and load-independent cardiovascular parameters.

### Experimental Context

Based on the defense slides, Aim 2 used a Yorkshire-cross swine model with controlled hemorrhage and REBOA intervention. The Aim 2 model included:

- Controlled hemorrhage of approximately 25% blood volume over 30 minutes
- Full REBOA, partial REBOA / EVAC, and no occlusion groups
- Left ventricular pressure-volume catheter data
- Vena-caval occlusion periods for load-independent analysis
- Pre-IVCO, during-IVCO, and post-IVCO extraction windows

### Planned Aim 2 Folder Structure

When Aim 2 data are uploaded, use a structure like this:

```text
Aim2/
├── README.md
├── raw_data/
│   ├── subject_level_excel_files/
│   │   ├── Subject_01_raw.xlsx
│   │   ├── Subject_02_raw.xlsx
│   │   └── ...
│   └── experiment_tracker.xlsx
├── processed_data/
│   ├── cleaned_pv_loops.xlsx
│   ├── beat_to_beat_parameters.xlsx
│   ├── ensemble_averaged_pv_loops.xlsx
│   ├── espvr_edpvr_outputs.xlsx
│   └── statistical_input_table.xlsx
├── notebooks/
│   ├── 01_import_labchart_exports.ipynb
│   ├── 02_clean_and_segment_pv_loops.ipynb
│   ├── 03_extract_pv_parameters.ipynb
│   ├── 04_generate_ensemble_averages.ipynb
│   └── 05_plot_aim2_figures.ipynb
├── stats/
│   ├── aim2_statistics.R
│   ├── model_outputs/
│   └── statistical_tables/
└── figures/
    ├── pv_loop_examples/
    ├── load_dependent_metrics/
    ├── load_independent_metrics/
    └── manuscript_figures/
```

### Planned Aim 2 Workflow

The Aim 2 workflow should be documented in the Aim 2 folder using the following order:

1. **Raw data import**
   - Load Excel exports from LabChart or equivalent acquisition software.
   - Import synchronized pressure and volume signals.
   - Preserve subject ID, time point, treatment group, and IVCO window metadata.

2. **PV loop reconstruction**
   - Combine one-dimensional pressure and volume signals into two-dimensional PV loops.
   - Confirm that pressure and volume signals are aligned.
   - Remove corrupted or incomplete segments.

3. **Beat separation**
   - Detect individual PV loops.
   - Segment continuous PV data into beat-to-beat loops.
   - Apply cleaning rules for physiologically implausible beats.

4. **Parameter extraction**
   - Extract load-dependent parameters such as:
     - End-systolic pressure
     - End-diastolic pressure
     - End-systolic volume
     - End-diastolic volume
     - Stroke volume
     - Stroke work
     - Ejection fraction
     - Cardiac output
     - Arterial elastance
   - Extract load-independent relationships such as:
     - ESPVR
     - EDPVR

5. **Ensemble averaging**
   - Generate subject-level ensemble averaged PV loops.
   - Generate group-level ensemble averaged PV loops.
   - Compare baseline, hemorrhage, intervention, and recovery time points.

6. **Statistics**
   - Prepare cleaned statistical input tables.
   - Run treatment-by-time comparisons.
   - Include repeated-measures or mixed-effects modeling when appropriate.
   - Export model outputs, p-values, estimated marginal means, and manuscript-ready tables.

7. **Figures**
   - Generate PV loop panels.
   - Generate load-dependent parameter plots.
   - Generate ESPVR / EDPVR summaries.
   - Export publication-ready figures.

### Planned Aim 2 README Checklist

When Aim 2 is uploaded, the local `Aim2/README.md` should include:

- Dataset source and experimental design
- Subject count and treatment groups
- Time points analyzed
- Raw file naming convention
- Exact notebooks/scripts to run
- Required input files for each notebook
- Output files generated by each notebook
- Statistical tests used
- Figure panels produced
- Notes on excluded animals, excluded beats, or failed IVCO segments

### Expected Aim 2 Outputs

- Cleaned PV loop files
- Beat-to-beat parameter tables
- Ensemble averaged PV loop tables
- ESPVR / EDPVR summaries
- Statistical input tables
- Model output tables
- Manuscript-ready plots

---

## Aim 3: Graded Hemorrhage and REBOA Strategy Optimization

### Scientific Purpose

Aim 3 evaluates how hemorrhage severity and REBOA strategy affect hemodynamic recovery, cardiac performance, distal perfusion, metabolic injury, coagulation, and resuscitation burden.

### Experimental Context

Aim 3 uses a graded hemorrhage model with animals assigned to:

- 10% hemorrhage
- 20% hemorrhage
- 30% hemorrhage

Within each hemorrhage level, animals were assigned to:

- No occlusion
- Partial REBOA
- Full REBOA

The defense slides describe this aim as a translational porcine model with automated critical care monitoring and continuous hemodynamic / perfusion data. The main conclusions were that increasing hemorrhage reduced cardiac performance and perfusion, full REBOA caused stronger ischemia-reperfusion injury, and partial REBOA better preserved renal perfusion and reduced fluid / pressor needs.

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

These files appear to store processed PV loop summaries, fractional change outputs, or intermediate tables used for downstream plotting and statistical analysis.

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

Examples:

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

`Aim3/Paper Plotting/CG4 and CHEM8 Data.xlsx`

`Aim3/Paper Plotting/CG4 and CHEM8 Plots/`

Contains blood chemistry, metabolic, renal, acid-base, and electrolyte related outputs such as lactate, base excess, creatinine, BUN, potassium, chloride, anion gap, pH, and related values.

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

This folder contains the main fluid and pressor processing sandbox, including:

- raw fluid / pressor data
- processed fluid outputs
- vasopressin and norepinephrine files
- plotting notebooks
- experiment tracker
- archived / graveyard files

#### Step 2: File Cleaning

Use this folder for intermediate file cleaning steps before statistical analysis.

#### Step 3: Actual Stats

This folder appears to contain the main R statistical scripts and cleaned statistical inputs:

```text
PV_02.18.26.R
TEG Stats_08.27.25.R
Fluids_Drugs_08.27.25.R
CG4_CHEM8_Stats_08.13.25.R
CG4 and CHEM8 Data.xlsx
Experiment Tracker.xlsx
Fractional_Increase_0.xlsx
ERNE_TEG_Cleaned.xlsx
README.md
```

Use this folder when reproducing the statistical analysis.

#### Step 4: Tables and Stats

Use this folder for final statistical tables, exported summaries, formatted outputs, and manuscript-supporting tables.

---

## Supporting Data Folders

### Fluids and Pressors

```text
Fluids and Pressors/
├── Fluid Data/
└── CG4Processing/
```

This folder contains standalone or earlier-stage processing for fluid, vasopressor, hetastarch, urine output, waveform-derived outputs, and CG4 processing.

Important files include:

```text
Fluids and Pressors/Fluid Data/Pressor and Fluids Data Processing.ipynb
Fluids and Pressors/Fluid Data/CLEANED Pressor and Fluids Data Processing.ipynb
Fluids and Pressors/Fluid Data/Processed Data.xlsx
Fluids and Pressors/Fluid Data/Processed_Data_Output.xlsx
Fluids and Pressors/Fluid Data/Vasopressin and Norepi.xlsx
Fluids and Pressors/Fluid Data/Urine Output.xlsx
Fluids and Pressors/Fluid Data/Raw Data/
```

The `CG4Processing/` folder contains CG4 raw and processed zip files, renaming code, and clustering notebooks.

### TEG

```text
TEG/
├── TEG Data Plotting.ipynb
├── TEG Stats_06.02.25.R
├── original_ERNE_TEG.xlsx
├── cleaned_ERNE_TEG.xlsx
├── SEM Graphs.zip
├── graph_archive.zip
└── old_code_archives.zip
```

This folder contains thromboelastography processing and statistical analysis.

---

## Suggested Setup

This repository includes Jupyter notebooks, Excel files, image outputs, and R scripts. A mixed Python/R environment is recommended.

### Python Environment

Create a Python environment:

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
```

Install commonly needed packages:

```bash
pip install numpy pandas scipy scikit-learn matplotlib seaborn openpyxl jupyter notebook ipykernel
```

For deep learning workflows, install either TensorFlow or PyTorch depending on the notebook requirements. For example:

```bash
pip install tensorflow
```

or:

```bash
pip install torch torchvision torchaudio
```

Register the environment as a Jupyter kernel:

```bash
python -m ipykernel install --user --name hemorrhage-ai --display-name "Hemorrhage AI"
```

### R Environment

Install R and RStudio or use VS Code with the R extension. Commonly useful packages may include:

```r
install.packages(c(
  "tidyverse",
  "readxl",
  "openxlsx",
  "lme4",
  "lmerTest",
  "emmeans",
  "ggplot2",
  "ggpubr"
))
```

Specific scripts may require additional packages. Install missing packages as needed when running the R scripts.

---

## Suggested Analysis Order

For a new user trying to reproduce or understand the project, use this order:

### 1. Read the root README

Start here to understand the full dissertation structure and repository map.

### 2. Review Aim 1

Open:

```text
Aim1/README.md
Aim1/Main Function Flow and Pressure.ipynb
Aim1/Multi-head CNN Code/Multi-head 1D CNN model.ipynb
```

Use Aim 1 to understand waveform processing, feature engineering, and AI classification.

### 3. Review Aim 3 PV loop analysis

Open:

```text
Aim3/PV Loop Data-ANALYZER.ipynb
Aim3/Individual ERNE Ensemble Averaged PV Loops.xlsx
Aim3/T30 Ensemble Averaged PV Loops.xlsx
```

Use this section to understand PV loop processing and Aim 3 cardiac outputs.

### 4. Review Aim 3 plotting

Open:

```text
Aim3/Paper Plotting/Plotting Code.ipynb
```

Then inspect generated figures in:

```text
Aim3/Paper Plotting/Hemodynamics/
Aim3/Paper Plotting/Hemorrhage Comparison/
Aim3/Paper Plotting/Pressure-Volume/
Aim3/Paper Plotting/TEG/
Aim3/Paper Plotting/CG4 and CHEM8 Plots/
Aim3/Paper3-RawFigures/
```

### 5. Review Aim 3 statistics

Open:

```text
Aim3/Stats/README.md
Aim3/Stats/Step 3 Actual Stats/
```

Start with the R scripts that correspond to the domain being analyzed:

```text
PV_02.18.26.R
TEG Stats_08.27.25.R
Fluids_Drugs_08.27.25.R
CG4_CHEM8_Stats_08.13.25.R
```

### 6. Review supporting folders

Use these for additional processing context:

```text
Fluids and Pressors/
TEG/
```

### 7. Add Aim 2

Once Aim 2 raw Excel files and code are uploaded, add them under the recommended `Aim2/` structure and update this README with exact filenames, run order, and outputs.

---

## File Organization Notes

### Files to Keep in the Repository

Keep:

- README files
- analysis notebooks
- R scripts
- cleaned or de-identified processed datasets
- final figure panels
- statistical summary tables
- small metadata files needed to reproduce analyses

### Files to Consider Excluding

Consider excluding or moving to archive:

- `.DS_Store`
- `~$` Excel temporary files
- `.ipynb_checkpoints/`
- `.RData` if it is not needed for reproducibility
- old archive zip files unless they are intentionally preserved
- raw files that cannot be shared publicly
- large binary outputs that can be regenerated

Suggested `.gitignore` additions:

```gitignore
.DS_Store
.ipynb_checkpoints/
~$*.xlsx
.RData
*.zip
__pycache__/
.venv/
.env
```

If zip files are important for reproducibility, do not globally ignore `*.zip`; instead, move them to a clearly labeled `archive/` folder and document their purpose.

---

## Data and Reproducibility Notes

This repository may include sensitive, unpublished, or large experimental data files. Before making the repository public, confirm that all uploaded datasets are approved for sharing.

Recommended reproducibility practices:

1. Add a local README inside each major aim folder.
2. Add a short header to each notebook explaining:
   - input files required
   - output files generated
   - expected runtime
   - whether the notebook is exploratory or final
3. Separate raw, processed, and figure outputs.
4. Use consistent subject IDs and treatment labels across all Excel files.
5. Avoid relying on hard-coded absolute file paths.
6. Keep final manuscript figures separate from exploratory figures.
7. Document excluded animals, excluded time points, and cleaning rules.

---

## Suggested Naming Conventions Going Forward

For Aim 2 and future updates, use consistent names such as:

```text
Aim2/raw_data/Subject_<ID>_RawPV.xlsx
Aim2/processed_data/Subject_<ID>_CleanedPV.xlsx
Aim2/processed_data/Aim2_BeatToBeat_PV_Parameters.xlsx
Aim2/processed_data/Aim2_Ensemble_Averaged_PV_Loops.xlsx
Aim2/stats/Aim2_Stats.R
Aim2/figures/Fig1_PV_Loop_Example.png
Aim2/figures/Fig2_Load_Dependent_Parameters.png
Aim2/figures/Fig3_ESPVR_EDPVR.png
```

This will make the repository easier to understand and easier to cite in a dissertation, manuscript, or portfolio.

---

## Citation / Dissertation Reference

Dissertation title:

**Artificial Intelligence and Advanced Modeling Techniques for Optimizing Resuscitation Strategies in Hemorrhagic Shock**

Author:

**Fahim Usshihab Mobin, MS**

Advisor:

**Dr. Ellie Rahbar**

---

## Contact

For questions about the repository, analysis workflow, or dissertation code organization, contact the repository owner / dissertation author.
