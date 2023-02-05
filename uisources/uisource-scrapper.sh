#!/bin/bash
printf "Enter App Name: "
read appname
mkdir -p "$appname"
cd $appname

curl https://www.uisources.com/app/$appname > /home/atharv/scripts/uisources/page.html
cat /home/atharv/scripts/uisources/page.html | pup "img" | awk -F '"' '{print $4}' | grep "https://.*"  > /home/atharv/scripts/uisources/image-link.txt

images=/home/atharv/scripts/uisources/image-link.txt

aria2c  -i$images -o $appname
