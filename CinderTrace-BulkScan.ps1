Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

#Read-Host "Thank you for making use of my script. In order to ensure functionality, please ensure the requirements are satisfied: 1. Your file must be stored in the path of C:\PlayGround\ (The script checks for this path and creates it if it's not found.) Your file must be in .csv format, and the column name containing the IPs to check must be named 'IPs'. Press Enter to proceed."

Write-Host "Thank you for choosing my script. Please ensure the following requirements are satisifed."

Start-Sleep -Seconds 2.0

Write-Host "Your File must be stored in C:\PlayGround. If this directory does not exist, the script will try to create it for you"

Start-Sleep -Seconds 2.1

Write-Host "The file type must be .csv, and the column containing the IPs must be named 'IPs' "

$path = "C:\PlayGround\"

# Create Path for Storage of Output
If (!(Test-Path $path)) {
    md $path
}

$pythonPath = "python"
$scriptPath = "C:\Python\AbuseIPdb.py"

$csv = Read-Host -Prompt "Please enter the name of the .csv file containing the IPs to check"

$ips = Import-Csv -Path "C:\PlayGround\$csv" | Select-Object -ExpandProperty IPs

foreach ($ip in $ips) {
    Write-Host "Processing $ip..."
    # FIX: unescape operators and actually invoke Python
    $output = & $pythonPath $scriptPath $ip 2>&1
    $exit   = $LASTEXITCODE
    Write-Output $output
## TO WRITE OUTPUT TO .TXT FILE, COMMENT OUT LINE 34 (Write-Output $output) AND REMOVE COMMENT OUT OF LINE BELOW.
## Write-Output $output | Out-File -FilePath "C:\Playground\IpResults.txt" -Append
    if ($exit -ne 0) {
        Write-Warning "Python exited with code $exit for IP $ip"
    }
}

Read-Host "Press Enter to Exit"
