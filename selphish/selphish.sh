#!/bin/bash

site=$1

cd scripts/

python3 dmarc.py $site

echo -e "\n \e[95m-------------------------------------------------------"
echo -e "\n \033[31m[+] Taking ScreenShot of the URL....."

./scan.sh $site >/dev/null 2>&1

./vt.sh $site
