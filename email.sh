email=`cat email.txt`

curl "https://api.stage.htspaces.com/devapi/v1/send/create" -H "Accept: application/json, text/plain, */*" -H "Content-Type: application/json;charset=UTF-8" -H "Authorization: 2368310ccece772d7eb9ee7671d83f1a48a88467160378a22e68de2a5a1571d4_d" -d "{ \"email\": \"voknatisto@biyac.com\", \"chunkSize\": 10485760, \"fullUrl\": true, \"files\": [ { \"filename\": \"final.zip\", \"fileSize\": 3000 } ] }" > response.txt

js-beautify response.txt | grep "spaceId" | sed 's/spaceId//' | cut -c 10- | rev | cut -c 3- | rev > s.txt
js-beautify response.txt | grep "urls" | sed 's/urls//' | cut -c 15- | rev | cut -c 3- | rev > u.txt

file1=`cat s.txt`
file2=`cat u.txt`

curl -i -X PUT "$file2" --upload-file final.zip

curl "https://api.stage.htspaces.com/devapi/v1/send/submit" -H "Accept: application/json, text/plain, */*" -H "Content-Type: application/json;charset=UTF-8" -H "Authorization: 2368310ccece772d7eb9ee7671d83f1a48a88467160378a22e68de2a5a1571d4_d" -d "{ \"spaceId\": \"$file1\", \"subject\": \"REPORT - Phishing Analysis\", \"message\": \"Here is your Analyzed Report\", \"emails\": [ \"$email\" ] }"

rm u.txt s.txt response.txt
