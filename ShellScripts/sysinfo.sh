#!/bin/bash

echo "================================"
echo "SYSTEM INFORMATION REPORT"
echo "Name: Chaitanya"
echo "Roll Number: 2601730362"
echo "Date: $(date)"
echo "================================"

echo ""
echo "CPU INFORMATION:"
powershell.exe -NoProfile -Command "(Get-CimInstance Win32_Processor | Select-Object -First 1).Name"
echo "CPU Cores:"
powershell.exe -NoProfile -Command "(Get-CimInstance Win32_Processor | Measure-Object -Property NumberOfCores -Sum).Sum"

echo ""
echo "MEMORY INFORMATION:"
powershell.exe -NoProfile -Command '$os = Get-CimInstance Win32_OperatingSystem; "Total RAM: {0:N2} GB" -f ($os.TotalVisibleMemorySize / 1MB); "Available RAM: {0:N2} GB" -f ($os.FreePhysicalMemory / 1MB); "Used RAM: {0:N2} GB" -f (($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / 1MB)'

echo ""
echo "TOP 3 CPU PROCESSES:"
powershell.exe -NoProfile -Command "Get-Process | Sort-Object CPU -Descending | Select-Object -First 3 ProcessName, Id, CPU | Format-Table -AutoSize"

echo ""
echo "Report generated successfully."

