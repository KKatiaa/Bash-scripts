#!/bin/bash

if [ "$1" = "-help" ]; then
    echo "This script output the volume of files in a sub directory of a given directory DIR that has the biggest number of files"
    exit
fi
read -p "Please, enter the directory: " input_dir
subdircount=$(find $input_dir -maxdepth 1 -type d | wc -l)
if [ $subdircount -eq 1 ]; then
    echo "$1 does not have subdirectories"
    exit 1
fi

max_files=0
max_subdir=""
for subdir in $input_dir/*; do
    if [ -d "$subdir" ]; then
        num_files=$(find "$subdir" -type f | wc -l)
	echo "subdir name: $subdir number of files: $num_files"
        if [ num_files > max_files ]; then
            max_files=$num_files
            max_subdir=$subdir
        fi
    fi
done

files_size=$(du -sh "$max_subdir" | cut -f1)
echo "The directory with maximum files is $max_subdir total files size in that directory $files_size"
