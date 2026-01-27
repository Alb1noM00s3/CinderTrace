Read-Host "Thank you for making use of my script. In order to ensure functionality, please ensure the requirements are satisified 1. Your file is stored in the path of C:\PlayGround\ and is in .csv format. Press Enter to proceed"

$path = "C:\PlayGround\"

#Create Path for Storage of Output

If (!(test-path $path))
    {
        md $path
    }

$csv = Read-Host -Prompt "Please enter file name ya bitch"

$ips = Import-Csv -Path "C:\PlayGround\$csv" | Select-Object -ExpandProperty IPs

foreach ($ip in $ips) {
    Write-Host "Processing $ip..."
    $output = & $pythonPath $scriptPath $ip 2>&1
    $exit   = $LASTEXITCODE
    Write-Output $output
    if ($exit -ne 0) {
        Write-Warning "Python exited with code $exit for IP $ip"
    }
}

Read-Host "Press Enter to Exit"
