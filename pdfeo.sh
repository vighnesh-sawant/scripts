#!/bin/bash
if [ "$1" ]; then
s=$1
ua="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36"
wget -N https://www.cbse.gov.in/cbsenew/question-paper/2024/XII/$s.zip --user-agent="$ua"
unzip $s.zip
wget -N "https://www.cbse.gov.in/cbsenew/Marking-Scheme/2024/XII/$s.zip" --user-agent="$ua"
mkdir -p OUTPUT-$s/MS/
unzip $s.zip -d OUTPUT-$s/MS/
for f in /root/$s/*.pdf; do
    echo "Processing $f "
    pdftk "$f" cat odd output "/root/OUTPUT-$s/$(basename "$f" .pdf).pdf"
done
echo "CLEANING"
rm -rf $s
rm -rf $s.zip
else
  echo "PLEASE DEFINE SUBJECT???"
fi 
