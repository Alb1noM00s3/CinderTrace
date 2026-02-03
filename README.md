# CinderTrace
CinderTrace is a series of scripts designed to simplify interacting with the AbuseIPDB API. On initial publication there is a Python script which performs the actual API call. I have also included a PowerShell script, which makes use of the Python script to allow for automated checks from a .csv file. 

This repository is an ongoing project, and can and will be updated and changed regularly. 

## What Does Each Script Do?
**AbuseIPDB.py** - This is the python script where you will configure your AbuseIPDB API key. If you do not have an AbuseIPDB key, create an account at the link below - and generate your own. 

**CinderTrace-BulkScan** - This powershell script allows for bulk checking of IP reputation, using a .csv file and the AbuseIPDB python script. 

**CinderAce** - A lightweight, fast powershell script designed for 1 off IP reputation checks. You will need to update the Python Path to the install directory for your machine. You can also simply copy and paste the Python executable to a easier to map location for use in the script. 

### Links

https://www.abuseipdb.com/ - **Register for free account on AbuseIPDB to generate your API Key**
