import requests
import json
import sys

# Replace with your actual API key and the IP address to check
API_KEY = "INSERT_YOUR_API_KEY_HERE"
IP_ADDRESS = sys.argv[1] 

# ("Please enter an IP address to check: ")

url = "https://api.abuseipdb.com/api/v2/check"
querystring = {
    "ipAddress": IP_ADDRESS,
    "maxAgeInDays": "90"  # Optional: specify max age of reports in days
}
headers = {
    "Accept": "application/json",
    "Key": API_KEY
}

try:
    response = requests.get(url, headers=headers, params=querystring)
    response.raise_for_status()  # Raise an exception for bad status codes
    decoded_response = json.loads(response.text)
    print(json.dumps(decoded_response, indent=4))
except requests.exceptions.RequestException as e:
    print(f"Error during API request: {e}")
except json.JSONDecodeError as e:
    print(f"Error decoding JSON response: {e}")
