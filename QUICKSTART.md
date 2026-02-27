# Quick Start Guide

## Building the Application

```bash
cd student_grade_calculator
./gradlew build
```

## Running the Application

```bash
./gradlew run --args="<path_to_excel_file>"
```

### Example:

```bash
# Windows
./gradlew run --args="c:\Users\YourName\Desktop\students.xlsx"

# Linux/Mac
./gradlew run --args="/Users/yourname/Desktop/students.xlsx"
```

## Input File Requirements

Your Excel file must have 2 columns:
1. **Name** - Student names
2. **Score** - Numerical scores (0-100)

## Output

You will get:
1. **Console Output**: A formatted table showing student names, scores, and grades
2. **Excel File**: `grades_output.xlsx` created in the same directory as your input file

## Grading Scale

- A: 90–100
- B: 80–89
- C: 70–79
- D: 60–69
- F: Below 60
- Invalid: Missing data, non-numeric scores, or scores outside 0–100

## Testing with Sample Data

A sample `students.xlsx` file is provided in the project root. Test it with:

```bash
./gradlew run --args="c:\Users\DELL\Desktop\student_grade_calculator\students.xlsx"
```

(Adjust the path to match your system)

## Troubleshooting

**Q: "File not found" error?**
A: Use the full absolute path to your file, not relative paths.

**Q: See a Log4j2 warning?**
A: This is normal and doesn't affect the program. It's just a logging notification.

**Q: The program runs but no output file appears?**
A: Check the same directory as your input file for `grades_output.xlsx`.

## Next Steps

See README.md for detailed documentation on all features and options.
