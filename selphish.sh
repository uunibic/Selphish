#!/bin/bash

mkdir final

cd scripts/

site=$1

./main.sh $site

python3 dmarc.py $site > report.txt

./vt1.sh $site >> report.txt

mv report.txt ../final/

cd ..

zip -r final.zip final >/dev/null 2>&1

sudo rm -r final

echo -e "\n\033[1m\e[95m-------------------------------------------------------\033[0m"
echo -e "\n                          "

read -p '[+] Enter email: ' email
echo -e "\n\033[1m\e[93m[+] Sending report to $email...\033[1m"
echo -e "\n                          "
echo "$email" > email.txt

./email.sh >/dev/null 2>&1

rm email.txt
