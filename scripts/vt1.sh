#!/bin/bash

echo -e "                                                  "
echo -e "-------------------------------------------------------------------------"
echo -e "                                                  "
echo -e "[+] VirusTotal Results :"
echo -e "                                                  "

url=$1

curl -X POST \
  https://www.virustotal.com/vtapi/v2/url/scan \
  -F apikey=25135adea71646f2dce42c0e289e962ed76e75ea41aa9af16508f7a49e479ee8 \
  -F url=$url >/dev/null 2>&1

curl -X POST \
  https://www.virustotal.com/vtapi/v2/url/report \
  -F apikey=25135adea71646f2dce42c0e289e962ed76e75ea41aa9af16508f7a49e479ee8 \
  -F resource=$url \
  -O "phish.txt" >/dev/null 2>&1

js-beautify report | grep -m 2 -E 'positives|phishing site'

rm report

echo -e "\n                                                "
