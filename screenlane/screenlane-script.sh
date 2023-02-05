#!/bin/bash
printf "Enter App Name: " 
read appname
mkdir -p "$appname"
cd $appname
curl https://screenlane.com/post/ios/$appname/ > /home/atharv/scripts/screenlane/page.html
links=$(cat /home/atharv/scripts/screenlane/page.html | pup 'img' | awk  -F'"' '{print $4}' | grep '/media.*')

for link in $links
do 
	aria2c "https://screenlane.com/$link" -o $appname

done
