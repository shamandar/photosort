#!/bin/sh

if [ $# != 2 ]; then
    echo "Usage: $0 INPUT_DIR SORTED_DIR"
    echo
    echo "Copy files from INPUT_DIR to SORTED_DIR by Exif Date/Time"
    exit 1
fi

input_dir=$1
sorted_dir=$2

# NOTE: Option `-o .` means Copy file instead default Rename file
exiftool -o . '-FileName<CreateDate' -d "$sorted_dir/%Y/%m/%d/%Y%m%d_%H%M_%%f.%%e" -r $input_dir
