#! /bin/bash
# Quick script that will changes the background to a random
# image from a given folder.
# At this moment it does not filter out files that are not images.
# Dependencies:
#   - feh

if [[ -d "$1" ]]
then 
    DIR=$1
else
    DIR=$(pwd)
fi

files=$(ls -l ${DIR} | grep ^- | awk '{print $9}' | sed 's/\ /\\\ /g')
rand=$(shuf -e ${files} -n1)
feh --bg-scale "${DIR}/${rand}"

exit 0
