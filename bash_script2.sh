#!/bin/bash

if [ "$1" = "-help" ]; then
    echo "This script copy several biggest files from one directory to another"
fi


read -p "Enter input directory " input_dir
read -p "Enter output directory " output_dir
read -p "Enter the number of file you wamt to copy " num_files
find $input_dir -type f -exec du -b {} + | sort -nr | head -n $num_files | cut -f2 | xargs -I{} sudo cp {} $output_dir

# find command to find files in dir input_dir type f- file, execute on each found file command du -b estimate file space usage equivalent to bytes
# sort files in descending order, and cut command to select only second field
#head -n $num_files to choose several the biggest files
#xargs to work with output from find command -I {} to replace occurences of {} in arguments with names read from standart input
#sudo cp to copy file to output_dir
