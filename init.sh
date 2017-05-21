#!/bin/bash

image=kalilinux/kali-linux-docker
docker images $image:latest | awk -v image="$image" -F " " '$3 !~ /IMAGE/ { 
if (length($5) == 0)
printf "Required" image "is missing. Installation will take place"
system("docker pull "image":latest");
if ( $5 != "days" )
printf $1" "$2" might be outdated. Created "$4" "$5" "$6".\n"
printf "Do you want to check & update to latest available image if possible? [Y/N]"
getline choice < "/dev/tty"
if ( choice == "Y" || choice == "y" )
system("docker pull "image":latest")
}'
docker build -t "kali_full:1.0" .
