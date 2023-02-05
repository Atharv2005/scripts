#!/bin/bash
printf "Enter the name: " 
read searchfor

curl " https://nlist.inflibnet.ac.in/search/Search/Results?lookfor=$searchfor&type=AllFields&limit=20"> /home/atharv/scripts/nlist/nlist.html 

link=cat /home/atharv/scripts/nlist/nlist.html | pup "a.getFull " | awk -F '"' '{print $2}' | grep '/search.*' > /home/atharv/scripts/nlist/nlist-searchlist.txt

for i in $nlistlink
do 
	 curl https://nlist.inflibnet.ac.in/$i | pup "h3" > /home/atharv/scripts/nlist/nlist-books.txt
 done

cat /home/atharv/scripts/nlist/nlist-books.txt
