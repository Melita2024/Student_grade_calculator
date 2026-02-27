# Student Grade Calculator

A Kotlin application that reads student names and scores from an Excel file, assigns letter grades based on a standard grading scale, and outputs the results to a new Excel file with a console summary.

## Features

- **Read Excel Files**: Uses Apache POI to read .xlsx files with student data
- **Assign Letter Grades**: Automatically grades students based on:
  - A: 90–100
  - B: 80–89
  - C: 70–79
  - D: 60–69
  - F: Below 60
- **Write Excel Output**: Creates a new Excel file with Name, Score, and Grade columns
- **Console Summary**: Displays a formatted table with all student grades and averages
- **Error Handling**: 
  - Detects missing values
  - Validates scores (must be 0–100)
  - Flags non-numeric scores
  - Marks invalid entries as "Invalid"
- **Gradle Build**: Complete Gradle setup with all necessary dependencies

## Prerequisites

- Java 21 or later
- Gradle (included via Gradle Wrapper)

## Build Instructions

### Option 1: Using Gradle Wrapper (Recommended)

```bash
cd student_grade_calculator
./gradlew build
```

### Option 2: Using Installed Gradle

If you have Gradle installed globally:

```bash
gradle build
```

## Running the Application

### Basic Usage

Provide the input Excel file as a command-line argument. Use the full absolute path:

```bash
./gradlew run --args="C:\path\to\students.xlsx"
```

Or on Linux/Mac:

```bash
./gradlew run --args="/path/to/students.xlsx"
```

### Example

```bash
./gradlew run --args="c:\Users\DELL\Desktop\student_grade_calculator\students.xlsx"
```

## Input File Format

The input Excel file must have exactly 2 columns in the first row:

1. **Column A: Name** - Student names (string values)
2. **Column B: Score** - Numerical scores (0-100)

### Example Input:

| Name              | Score |
|------------------|-------|
| Alice Johnson    | 95    |
| Bob Smith        | 87    |
| Charlie Brown    | 73    |
| Diana Prince     | 92    |
| Eve Wilson       | 58    |

## Output

### 1. Console Output

A formatted table displaying:
- Student names
- Scores (or "N/A" for invalid entries)
- Assigned letter grades
- Total count and average score

Example:

```
============================================================
STUDENT GRADE SUMMARY
============================================================
Name                      | Score      | Grade
------------------------------------------------------------
Alice Johnson             | 95.00      | A
Bob Smith                 | 87.00      | B
Charlie Brown             | 73.00      | C
Diana Prince              | 92.00      | A
Eve Wilson                | 58.00      | F
============================================================
Total Students: 5 | Average Score: 81.00
============================================================
```

### 2. Excel Output File

An Excel file named **`grades_output.xlsx`** is created in the same directory as the input file, containing:
- Column A: Student Name
- Column B: Score
- Column C: Grade

Invalid entries will have blank Score and "Invalid" in the Grade column.

## Edge Cases Handled

1. **Missing Names**: Flagged as "Invalid"
2. **Missing Scores**: Flagged as "Invalid"
3. **Non-numeric Scores**: Flagged as "Invalid"
4. **Scores < 0 or > 100**: Flagged as "Invalid"
5. **Empty Cells**: Flagged as "Invalid"

## Project Structure

```
student_grade_calculator/
├── app/
│   ├── build.gradle.kts
│   └── src/
│       ├── main/
│       │   ├── kotlin/
│       │   │   └── org/example/
│       │   │       └── App.kt
│       │   └── resources/
│       └── test/
│           └── kotlin/
│               └── org/example/
│                   └── AppTest.kt
├── gradle/
│   ├── libs.versions.toml
│   └── wrapper/
│       └── gradle-wrapper.properties
├── build.gradle.kts
├── settings.gradle.kts
├── gradlew
├── gradlew.bat
└── README.md
```

## Dependencies

- **Kotlin**: 2.2.21
- **Apache POI**: 5.2.3 (For reading/writing .xlsx files)

The dependencies are defined in `app/build.gradle.kts`:

```kotlin
implementation("org.apache.poi:poi:5.2.3")
implementation("org.apache.poi:poi-ooxml:5.2.3")
```

## Testing

To run tests:

```bash
./gradlew test
```

## Current Implementation Details

### Data Validation

- Empty name cells → Invalid
- Empty score cells → Invalid
- Non-numeric score values → Invalid
- Scores outside 0-100 range → Invalid

### Grade Assignment

Invalid entries receive an "Invalid" grade and are excluded from average calculations.

### Output File Location

The output Excel file (`grades_output.xlsx`) is created in the same directory as the input file for convenience.

## Common Issues

### Issue: "File not found" error

**Solution**: Use the **full absolute path** to the input file. Relative paths won't work with Gradle's run task. 

Example (Windows):
```bash
./gradlew run --args="c:\Users\YourName\Desktop\students.xlsx"
```

### Issue: Log4j2 warning in console output

This is a harmless warning about logging framework configuration. It doesn't affect the program's functionality.

## License

This project is provided as-is for educational purposes.

## Sample Data

A sample `students.xlsx` file is included in the project root directory for testing purposes. It demonstrates:
- Valid student records
- Invalid entries (non-numeric scores)
- Out-of-range scores
- Missing data

Run the program with this sample to see how edge cases are handled.

## Future Enhancements (Optional)

- Support for custom grading scales
- Support for .csv format input
- Batch processing multiple files
- Grade statistics (median, mode, distribution)
- Support for weighted grades (homework, midterm, final, etc.)
