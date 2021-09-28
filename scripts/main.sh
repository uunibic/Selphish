#!/bin/bash

echo -e "\n\033[1m[+]\033[0m \e[40;38;5;82m SELPHISH \e[30;48;5;82m -By ACKO \e[0m"
echo -e "\n                                              "

site=$1

python3 dmarc.py $site

echo -e "\n\033[1m\e[95m-------------------------------------------------------\033[0m"
echo -e "\n\033[1m\e[93m[+]\033[31m Taking ScreenShot of the URL.....\033[1m"

./scan.sh $site >/dev/null 2>&1

./vt.sh $site
