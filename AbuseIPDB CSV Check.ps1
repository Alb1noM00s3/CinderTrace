$path = "C:\PlayGround\"

#Create Path for Storage of Output

If (!(test-path $path))
    {
        md $path
    }

$csv = Read-Host -Prompt "Please enter file name containing IPs"

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
