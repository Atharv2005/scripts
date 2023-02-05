#!/bin/bash

echo "Enter magnet link: " ; read magnetlink
echo "Enter the Movie/Show name" ; read name
mkdir -p "$name"
cd $name
exec peerflix "$magnetlink" -l 
