Write-Host "This Script will check the IP you supply against AbuseIPDB"

$pythonPath = "C:\Users\parkinsonb\AppData\Local\Programs\Python\Python313\python.exe"
$ScriptPath = "C:\Python\AbuseIPdb.py"
$arg = Read-Host "Please Enter an IP to Check"
$Output = & $pythonPath $scriptpath $arg

$Output

Read-Host "Press Enter to Exit"