# Explanation of `Append Fluid and Drug Data.ipynb`

## Overview

This notebook appends processed statistics from one Excel file onto two existing cleaned datasets. It does this by matching rows using two shared columns:

- `Parent Folder`
- `Time Point`

The notebook has two main sections:

1. **PV section**: merges processed statistics into the cleaned PV fractional increase dataset.
2. **Fluid section**: merges processed statistics into the cleaned fluid fractional increase dataset.

Both sections use the same logic: read two Excel files, perform a left merge, and write the original and merged results to a new Excel workbook.

---

## Required Python package

The notebook uses:

```python
import pandas as pd
```

It also writes Excel files using the `openpyxl` engine through `pd.ExcelWriter`, so the environment must have:

```text
pandas
openpyxl
```

---

# Section 1: PV

## What this code does

```python
import pandas as pd

# File paths
file1 = "cleanedPV_Fractional_Increase_T0-1.xlsx"
file2 = "Processed_Data_Output.xlsx"
output_file = "cleanedPV_with_PV_Stats.xlsx"

# Read data from both Excel files
df1 = pd.read_excel(file1)
df2 = pd.read_excel(file2)

# Perform a left merge on 'Parent Folder' and 'Time Point'
merged_df = pd.merge(df1, df2, on=["Parent Folder", "Time Point"], how="left")

# Save the original data and the merged results into a new Excel file
with pd.ExcelWriter(output_file, engine="openpyxl") as writer:
    df1.to_excel(writer, index=False, sheet_name="Original Data")
    merged_df.to_excel(writer, index=False, sheet_name="PV Stats")
```

This section combines the cleaned PV fractional increase data with the processed statistics data.

It reads:

- `cleanedPV_Fractional_Increase_T0-1.xlsx`
- `Processed_Data_Output.xlsx`

Then it merges them using `Parent Folder` and `Time Point` as matching keys. Because it uses a **left merge**, every row from `cleanedPV_Fractional_Increase_T0-1.xlsx` is preserved. Matching columns from `Processed_Data_Output.xlsx` are added where a match exists.

If a row in the PV file does not have a matching `Parent Folder` and `Time Point` in the processed data file, the added statistics columns will contain blank or missing values.

## Inputs

### `cleanedPV_Fractional_Increase_T0-1.xlsx`

This is the main PV dataset. It must contain at least these columns:

```text
Parent Folder
Time Point
```

It may also contain other PV-related columns, such as fractional increase values or cleaned measurement data.

### `Processed_Data_Output.xlsx`

This is the statistics or processed output file. It must also contain at least:

```text
Parent Folder
Time Point
```

Any other columns in this file are appended to the PV dataset during the merge.

## Output

### `cleanedPV_with_PV_Stats.xlsx`

This Excel workbook contains two sheets:

| Sheet name | Contents |
|---|---|
| `Original Data` | The unmodified contents of `cleanedPV_Fractional_Increase_T0-1.xlsx` |
| `PV Stats` | The merged dataset containing the original PV data plus matching columns from `Processed_Data_Output.xlsx` |

---

# Section 2: Fluid

## What this code does

```python
# File paths
file1 = "cleanedFractional_Increase_0.xlsx"
file2 = "Processed_Data_Output.xlsx"
output_file = "cleanedFractional_Increase_Stats.xlsx"

# Read data from both Excel files
df1 = pd.read_excel(file1)
df2 = pd.read_excel(file2)

# Perform a left merge on 'Parent Folder' and 'Time Point'
merged_df = pd.merge(df1, df2, on=["Parent Folder", "Time Point"], how="left")

# Save the original data and the merged results into a new Excel file
with pd.ExcelWriter(output_file, engine="openpyxl") as writer:
    df1.to_excel(writer, index=False, sheet_name="Original Data")
    merged_df.to_excel(writer, index=False, sheet_name="PV Stats")
```

This section does the same type of merge, but for the cleaned fluid fractional increase dataset.

It reads:

- `cleanedFractional_Increase_0.xlsx`
- `Processed_Data_Output.xlsx`

Then it merges the two files by matching rows on:

```text
Parent Folder
Time Point
```

Again, because this is a **left merge**, all rows from `cleanedFractional_Increase_0.xlsx` are kept, even if no matching statistics are found in `Processed_Data_Output.xlsx`.

## Inputs

### `cleanedFractional_Increase_0.xlsx`

This is the main cleaned fluid dataset. It must contain:

```text
Parent Folder
Time Point
```

It may also contain additional fluid measurement or fractional increase columns.

### `Processed_Data_Output.xlsx`

This is the same processed statistics file used in the PV section. It must contain:

```text
Parent Folder
Time Point
```

Its additional columns are appended to the fluid dataset when matching rows are found.

## Output

### `cleanedFractional_Increase_Stats.xlsx`

This Excel workbook contains two sheets:

| Sheet name | Contents |
|---|---|
| `Original Data` | The unmodified contents of `cleanedFractional_Increase_0.xlsx` |
| `PV Stats` | The merged dataset containing the original fluid data plus matching columns from `Processed_Data_Output.xlsx` |

> Note: The second sheet is named `PV Stats` even in the fluid section. This may be intentional, but if the file is specifically for fluid data, a clearer sheet name might be `Fluid Stats`.

---

# Final cell

```python
print('Done')
```

This prints:

```text
Done
```

It is simply a completion message confirming that the notebook reached the end.

---

# Summary of files

## Input files

| File | Used in section | Purpose |
|---|---|---|
| `cleanedPV_Fractional_Increase_T0-1.xlsx` | PV | Main cleaned PV fractional increase dataset |
| `cleanedFractional_Increase_0.xlsx` | Fluid | Main cleaned fluid fractional increase dataset |
| `Processed_Data_Output.xlsx` | PV and Fluid | Processed statistics file appended to both datasets |

## Output files

| File | Created by section | Contents |
|---|---|---|
| `cleanedPV_with_PV_Stats.xlsx` | PV | Original PV data and PV data merged with processed statistics |
| `cleanedFractional_Increase_Stats.xlsx` | Fluid | Original fluid data and fluid data merged with processed statistics |

---

# Important assumptions and requirements

For the notebook to run successfully:

1. All input Excel files must be in the same working directory as the notebook, unless the file paths are changed.
2. The input files must be valid `.xlsx` Excel files.
3. Both files being merged must contain the columns `Parent Folder` and `Time Point`.
4. The `Parent Folder` and `Time Point` values must match exactly between files for rows to merge correctly.
5. `pandas` and `openpyxl` must be installed.

---

# What the notebook produces conceptually

The notebook produces two enhanced datasets:

1. A PV dataset with additional statistics attached.
2. A fluid dataset with additional statistics attached.

It does not calculate new statistics itself. Instead, it appends statistics that already exist in `Processed_Data_Output.xlsx` onto the cleaned PV and fluid datasets.
