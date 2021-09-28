#!/bin/bash

url=$1

curl https://urlscan.io/api/v1/search/?q=domain:$url | grep -m 1 screenshot | sed 's/screenshot//' | cut -c 12- | rev | cut -c 2- | rev > result.txt

wget -i result.txt

rm result.txt

mv *.png 1.png

mv 1.png ../final/
