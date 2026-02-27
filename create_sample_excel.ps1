# Create a sample Excel file with student data
$excelPath = "students.xlsx"

# Create Excel COM object
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false

# Create new workbook
$workbook = $excel.Workbooks.Add()
$sheet = $workbook.Sheets.Item(1)

# Add headers
$sheet.Cells.Item(1, 1) = "Name"
$sheet.Cells.Item(1, 2) = "Score"

# Add sample data
$sheet.Cells.Item(2, 1) = "Alice Johnson"
$sheet.Cells.Item(2, 2) = 95

$sheet.Cells.Item(3, 1) = "Bob Smith"
$sheet.Cells.Item(3, 2) = 87

$sheet.Cells.Item(4, 1) = "Charlie Brown"
$sheet.Cells.Item(4, 2) = 73

$sheet.Cells.Item(5, 1) = "Diana Prince"
$sheet.Cells.Item(5, 2) = 92

$sheet.Cells.Item(6, 1) = "Eve Wilson"
$sheet.Cells.Item(6, 2) = 58

$sheet.Cells.Item(7, 1) = "Frank Miller"
$sheet.Cells.Item(7, 2) = 78

$sheet.Cells.Item(8, 1) = "Grace Lee"
$sheet.Cells.Item(8, 2) = 88

$sheet.Cells.Item(9, 1) = "Henry Davis"
$sheet.Cells.Item(9, 2) = 61

$sheet.Cells.Item(10, 1) = "Invalid Student"
$sheet.Cells.Item(10, 2) = "N/A"

$sheet.Cells.Item(11, 1) = "Over Score Student"
$sheet.Cells.Item(11, 2) = 105

$sheet.Cells.Item(12, 1) = "Negative Score"
$sheet.Cells.Item(12, 2) = -5

# Auto-fit columns
$sheet.Columns.Item(1).AutoFit()
$sheet.Columns.Item(2).AutoFit()

# Save the workbook
$workbook.SaveAs((Get-Location).Path + "\$excelPath", 51)

# Close Excel
$workbook.Close($false)
$excel.Quit()

[System.Runtime.InteropServices.Marshal]::ReleaseComObject($excel) | Out-Null

Write-Host "Sample Excel file created: $excelPath"
