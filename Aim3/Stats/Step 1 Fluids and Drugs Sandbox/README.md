# Explanation of the Two Notebooks

This document explains what the following to Jupyter notebooks do, what inputs they require, and what outputs they produce.


1. `Pressor and Fluids Data Processing.ipynb`
2. `Plotting.ipynb`

---

## 1. `Pressor and Fluids Data Processing.ipynb`

### Purpose

This notebook processes raw experimental Excel files from MacKenzie containing pressor, fluid, vasopressin, blood pressure, and urine-output data. It converts raw time-series data into cleaner summary tables at predefined time points, applies dose and weight adjustments, calculates total and cumulative vasopressin, and creates final Excel workbooks for later plotting or analysis.

In the overall workflow, this notebook should be run before `Plotting.ipynb`, because it creates `Processed_Data_with_Vasopressin.xlsx`, which the plotting notebook uses as one of its main inputs.

---

### Main steps performed

#### 1. Locate raw Excel files

The notebook expects a folder named:

```text
Raw Data/
```

inside the current working directory. It lists all `.xlsx` files inside that folder.

Each raw Excel file is read into a pandas DataFrame. The filename without the `.xlsx` extension is used as the sheet name when the processed output is written.

---

#### 2. Process each raw Excel file

For each raw data file, the notebook:

1. Converts `Study Time(sec)` to a numeric column.
2. Replaces invalid time values with `0` if conversion creates missing values.
3. Converts `Study Time(sec)` from seconds to minutes.
4. Extracts rows at specific time points:

```text
0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60,
65, 70, 75, 80, 85, 90, 120, 180, 240, 270 minutes
```

5. Pulls selected values from each time point, including fluids, norepinephrine, vasopressin, and pressure columns.
6. Counts vasopressin values between the previous time point and the current time point.
7. Writes the processed data to `Processed Data.xlsx`, with one sheet per raw file.

The vasopressin-counting logic creates four columns:

```text
Vasopressin_0
Vasopressin_1
Vasopressin_2
Vasopressin_3
```

These represent the count of rows where the `Vasopressin` column had values `0`, `1`, `2`, or `3` during each time interval.

---

#### 3. Reorder processed sheets

The notebook reads `Processed Data.xlsx`, sorts its sheet names by the numeric portion of each sheet name, and saves the reordered workbook as:

```text
Processed Data In Order.xlsx
```

Note: a later cell refers to `Processed Data in Order.xlsx` with a lowercase `in`. On case-sensitive systems, this difference may matter.

---

#### 4. Apply vasopressin/norepinephrine scaling and normalize by weight

The notebook then reads:

```text
Processed Data in Order.xlsx
Vasopressin and Norepi.xlsx
```

It matches each row in `Vasopressin and Norepi.xlsx` to a sheet in the processed workbook using the `Parent Folder` column.

For each matching sheet, it:

1. Copies the processed sheet.
2. Multiplies matching columns by the corresponding values from `Vasopressin and Norepi.xlsx`.
3. Divides `Plasmalyte` and `Norepi` by `Weight`, when weight is present and nonzero.
4. Calculates `Total Vasopressin` as the row-wise sum of the available `Vasopressin_0` through `Vasopressin_3` columns.
5. Calculates `Cumulative Vasopressin` as the cumulative sum of `Total Vasopressin`.
6. Writes the adjusted sheet to:

```text
Processed_Data_with_Vasopressin.xlsx
```

---

#### 5. Add urine-output data

The notebook also builds a combined dataset from the ERNE sheets in `Processed_Data_with_Vasopressin.xlsx`.

It reads:

```text
Urine Output.xlsx
```

The urine-output workbook is expected to have:

- A `Time` column.
- One column per subject or source sheet.

The notebook matches urine-output values by:

- `Time`
- source sheet name / subject ID

It then saves the combined dataset as:

```text
Processed_Data_Output.xlsx
```

with a sheet named:

```text
All Data
```

---

### Inputs required

#### Folder input

```text
Raw Data/
```

This folder must contain raw `.xlsx` files.

#### Excel file inputs

```text
Processed Data.xlsx
Processed Data in Order.xlsx
Vasopressin and Norepi.xlsx
Urine Output.xlsx
Experiment Tracker.xlsx
Processed_Data_with_Vasopressin.xlsx
```

Some of these are created by earlier cells in the notebook, while others must already exist before running the relevant cells.

#### Required columns in raw Excel files

Each raw Excel file is expected to contain these columns:

```text
Study Time(sec)
Cumulative Volume
Cumulative (Nor)epi Dose
Vasopressin
Prox_Sys_PowerLab_PC
Prox_Dia_PowerLab_PC
Prox_Mean_PowerLab_PC
Dist_Sys_PowerLab_PC
Dist_Dia_PowerLab_PC
Dist_Mean_PowerLab_PC
Dist_Sys_LPF_PowerLab_PC
Dist_Dia_LPF_PowerLab_PC
Dist_Mean_LPF_PowerLab_PC
```

#### Required columns in `Vasopressin and Norepi.xlsx`

```text
Parent Folder
Weight
```

It may also contain columns that match columns in the processed sheets. Matching columns are used as scaling factors.

#### Required structure in `Urine Output.xlsx`

```text
Time
<one column per subject/source sheet>
```

The subject/source sheet column names must match the sheet names in `Processed_Data_with_Vasopressin.xlsx`.

#### Required sheets and columns in `Experiment Tracker.xlsx`

This notebook reads the following sheets, although the categorization values are not heavily used in the final urine-processing section:

Sheet: `T30 categorization`

```text
Group_10
Group_20
Group_30
```

Sheet: `T60 categorization`

```text
Full_Occlusion
Partial_Occlusion
No_Occlusion
```

---

### Outputs produced

The notebook can produce these files:

```text
Processed Data.xlsx
Processed Data In Order.xlsx
Processed_Data_with_Vasopressin.xlsx
Processed_Data_Output.xlsx
```

#### `Processed Data.xlsx`

Contains one processed sheet per raw Excel file. Each sheet includes selected values at predefined time points.

Main columns include:

```text
Time
Plasmalyte
Norepi
Prox_Sys_PowerLab_PC
Prox_Dia_PowerLab_PC
Prox_Mean_PowerLab_PC
Dist_Sys_PowerLab_PC
Dist_Dia_PowerLab_PC
Dist_Mean_PowerLab_PC
Dist_Sys_LPF_PowerLab_PC
Dist_Dia_LPF_PowerLab_PC
Dist_Mean_LPF_PowerLab_PC
Vasopressin_0
Vasopressin_1
Vasopressin_2
Vasopressin_3
```

#### `Processed Data In Order.xlsx`

Contains the same sheets as `Processed Data.xlsx`, but sorted by the numeric portion of the sheet names.

#### `Processed_Data_with_Vasopressin.xlsx`

Contains adjusted processed data by subject/sheet. It adds:

```text
Total Vasopressin
Cumulative Vasopressin
```

It also normalizes `Plasmalyte` and `Norepi` by weight when possible.

#### `Processed_Data_Output.xlsx`

Contains a single combined sheet named `All Data`. It includes ERNE subject data, selected variables, a `Source` column, and a `Urine Output` column.

---

### Important assumptions and potential issues

1. The code assumes exact column names. A spelling or spacing mismatch will cause errors.
2. The code assumes requested time points exist exactly in the data after converting seconds to minutes. If a time point is missing, expressions such as `.values[0]` can fail.
3. The workbook name appears in two forms:

```text
Processed Data In Order.xlsx
Processed Data in Order.xlsx
```

On case-sensitive systems, these are different filenames.

4. `Processed Data.xlsx` is opened in append mode. It must already exist or be created before that cell runs, depending on the environment and pandas/openpyxl behavior.
5. The data-processing loop rereads all Excel files inside the loop over `excel_files`, which may cause repeated processing. Functionally, the goal is to process all raw files, but the current structure may do extra repeated work.

---

## 2. `Plotting.ipynb`

### Purpose

This notebook creates summary plots from the processed experimental data. It groups subjects by hemorrhage level and occlusion category, calculates pooled means and standard deviations over time, and generates interactive Plotly charts.

It mainly uses:

```text
Experiment Tracker.xlsx
Processed_Data_with_Vasopressin.xlsx
```

and, in its final section, also uses:

```text
Urine Output.xlsx
```

---

### Main steps performed

#### 1. Read experiment categorization data

The notebook reads two sheets from:

```text
Experiment Tracker.xlsx
```

From `T30 categorization`, it reads:

```text
Group_10
Group_20
Group_30
```

These appear to represent hemorrhage groups, likely 10%, 20%, and 30% hemorrhage.

From `T60 categorization`, it reads:

```text
Full_Occlusion
Partial_Occlusion
No_Occlusion
```

These represent occlusion categories.

The notebook converts each column into a set of subject IDs.

---

#### 2. Create combined groups

The notebook creates intersections between the hemorrhage groups and occlusion groups.

For example:

```text
10% Hemorrhage + Full Occlusion
10% Hemorrhage + Partial Occlusion
10% Hemorrhage + No Occlusion
20% Hemorrhage + Full Occlusion
...
30% Hemorrhage + No Occlusion
```

Each combined group is a set of subjects that belong to both the hemorrhage category and the occlusion category.

---

#### 3. Load processed subject data

The notebook reads:

```text
Processed_Data_with_Vasopressin.xlsx
```

It only keeps sheets whose names start with:

```text
ERNE
```

For each ERNE sheet, it removes hyphens from the sheet name when storing it in a dictionary. This matters because the subject IDs in `Experiment Tracker.xlsx` must match these cleaned sheet names.

The notebook filters each subject sheet to only include rows where:

```text
Time <= 240
```

---

#### 4. Calculate pooled mean and standard deviation

The notebook defines a helper function named:

```text
calculate_mean_and_std(...)
```

This function takes a group of subject IDs and a variable name, then:

1. Finds matching subject data in the processed-data dictionary.
2. Collects values for each time point.
3. Calculates the mean at each time point.
4. Calculates the standard deviation at each time point.
5. Returns:

```text
times, means, standard deviations
```

Some cells calculate values for all available time points. Later cells restrict the plots to this list:

```text
0, 5, 10, 15, 20, 25, 30, 60, 65, 75, 85, 120, 180, 240
```

---

#### 5. Generate Plotly charts

The notebook creates interactive line plots with markers and error bars. The error bars represent standard deviation.

The first plotting sections create charts for:

```text
Cumulative Vasopressin
Plasmalyte
Norepi
```

Later sections generate charts for these variables:

```text
Cumulative Vasopressin
Plasmalyte
Norepi
Prox_Sys_PowerLab_PC
Prox_Dia_PowerLab_PC
Prox_Mean_PowerLab_PC
Dist_Sys_PowerLab_PC
Dist_Dia_PowerLab_PC
Dist_Mean_PowerLab_PC
Dist_Sys_LPF_PowerLab_PC
Dist_Dia_LPF_PowerLab_PC
Dist_Mean_LPF_PowerLab_PC
```

Each group combination is plotted as a separate line.

---

#### 6. Save charts as HTML

The notebook creates a folder named:

```text
drug concentrations/
```

It saves interactive HTML charts in that folder.

Specific outputs include:

```text
drug concentrations/vasopressin.html
drug concentrations/plasmalyte.html
drug concentrations/norepi.html
```

The broader plotting section also saves one HTML file per graphed column, such as:

```text
drug concentrations/Cumulative_Vasopressin.html
drug concentrations/Plasmalyte.html
drug concentrations/Norepi.html
drug concentrations/Prox_Sys_PowerLab_PC.html
...
```

---

#### 7. Create combined output with urine data

The final section of the plotting notebook repeats a urine-output merge similar to the processing notebook.

It:

1. Reads ERNE sheets from `Processed_Data_with_Vasopressin.xlsx`.
2. Keeps selected columns.
3. Adds a `Source` column containing the original sheet name.
4. Concatenates all selected ERNE sheets into one DataFrame.
5. Reads `Urine Output.xlsx`.
6. Matches urine-output values by `Time` and `Source`.
7. Writes:

```text
Processed_Data_Output.xlsx
```

with a sheet named:

```text
All Data
```

---

### Inputs required

#### Excel file inputs

```text
Experiment Tracker.xlsx
Processed_Data_with_Vasopressin.xlsx
Urine Output.xlsx
```

#### Required sheets and columns in `Experiment Tracker.xlsx`

Sheet: `T30 categorization`

```text
Group_10
Group_20
Group_30
```

Sheet: `T60 categorization`

```text
Full_Occlusion
Partial_Occlusion
No_Occlusion
```

#### Required sheets in `Processed_Data_with_Vasopressin.xlsx`

The notebook expects one sheet per subject. It only processes sheets whose names start with:

```text
ERNE
```

#### Required columns in each ERNE sheet

For the basic drug plots:

```text
Time
Cumulative Vasopressin
Plasmalyte
Norepi
```

For the expanded plotting section and combined output:

```text
Time
Cumulative Vasopressin
Plasmalyte
Norepi
Prox_Sys_PowerLab_PC
Prox_Dia_PowerLab_PC
Prox_Mean_PowerLab_PC
Dist_Sys_PowerLab_PC
Dist_Dia_PowerLab_PC
Dist_Mean_PowerLab_PC
Dist_Sys_LPF_PowerLab_PC
Dist_Dia_LPF_PowerLab_PC
Dist_Mean_LPF_PowerLab_PC
```

#### Required structure in `Urine Output.xlsx`

```text
Time
<one column per subject/source sheet>
```

The subject/source columns must match the sheet names in `Processed_Data_with_Vasopressin.xlsx`.

---

### Outputs produced

The notebook can produce:

```text
drug concentrations/vasopressin.html
drug concentrations/plasmalyte.html
drug concentrations/norepi.html
```

It can also produce one HTML chart for each of the expanded set of variables:

```text
drug concentrations/Cumulative_Vasopressin.html
drug concentrations/Plasmalyte.html
drug concentrations/Norepi.html
drug concentrations/Prox_Sys_PowerLab_PC.html
drug concentrations/Prox_Dia_PowerLab_PC.html
drug concentrations/Prox_Mean_PowerLab_PC.html
drug concentrations/Dist_Sys_PowerLab_PC.html
drug concentrations/Dist_Dia_PowerLab_PC.html
drug concentrations/Dist_Mean_PowerLab_PC.html
drug concentrations/Dist_Sys_LPF_PowerLab_PC.html
drug concentrations/Dist_Dia_LPF_PowerLab_PC.html
drug concentrations/Dist_Mean_LPF_PowerLab_PC.html
```

It may also produce:

```text
Processed_Data_Output.xlsx
```

with a sheet named:

```text
All Data
```

---

### Important assumptions and potential issues

1. Subject IDs in `Experiment Tracker.xlsx` must match the processed sheet names after hyphens are removed.
2. Only sheets starting with `ERNE` are plotted. Sheets starting with `ERDE` or any other prefix are ignored.
3. The code assumes all required columns exist in every selected ERNE sheet.
4. The code filters out rows where `Time > 240`.
5. The notebook contains repeated sections that perform similar plotting steps. The later sections are more complete because they save HTML files and include more variables.
6. If a group has no matching subjects in the processed data, no trace is plotted for that group.

---

## Overall workflow

A typical workflow is:

1. Place raw Excel files in the `Raw Data/` folder.
2. Prepare `Vasopressin and Norepi.xlsx` with dose/weight information.
3. Prepare `Experiment Tracker.xlsx` with group and occlusion categorization.
4. Prepare `Urine Output.xlsx` if urine-output data should be merged.
5. Run `Pressor and Fluids Data Processing.ipynb` to create the processed Excel files.
6. Run `Plotting.ipynb` to create Plotly HTML charts and, optionally, `Processed_Data_Output.xlsx`.

---

## Summary table

| Notebook | Main purpose | Main inputs | Main outputs |
|---|---|---|---|
| `Pressor and Fluids Data Processing.ipynb` | Converts raw Excel time-series files into processed and normalized Excel workbooks | `Raw Data/*.xlsx`, `Vasopressin and Norepi.xlsx`, `Urine Output.xlsx`, `Experiment Tracker.xlsx` | `Processed Data.xlsx`, `Processed Data In Order.xlsx`, `Processed_Data_with_Vasopressin.xlsx`, `Processed_Data_Output.xlsx` |
| `Plotting.ipynb` | Creates group-level plots with means and standard-deviation error bars | `Experiment Tracker.xlsx`, `Processed_Data_with_Vasopressin.xlsx`, `Urine Output.xlsx` | Interactive HTML charts in `drug concentrations/`, plus optionally `Processed_Data_Output.xlsx` |

---

## Python packages used

The notebooks use:

```text
pandas
numpy
plotly
openpyxl
xlsxwriter
os
re
```

`os` and `re` are part of the Python standard library. The others usually need to be installed separately.
