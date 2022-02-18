#!/bin/sh

if [ $# != 3 ]; then
    echo "Usage: $0 INPUT_DIR SORTED_DIR UNSORTED_DIR"
    echo
    echo "Sort INPUT_DIR files by Exif DateTime and Copy them to SORTED_DIR."
    echo "Files missing Exif DateTime are copied to UNSORTED_DIR."
    exit 1
fi

input_dir=$(readlink -f $1)
sorted_dir=$(readlink -f $2)
unsorted_dir=$(readlink -f $3)

# NOTE: `exiftool` copy file missing Exif to current directory
[ -d $unsorted_dir ] || mkdir -p $unsorted_dir
cd $unsorted_dir

# NOTE: Option `-o .` means Copy file instead default Rename file
exiftool -o . '-FileName<CreateDate' -d "$sorted_dir/%Y/%m/%d/%Y%m%d_%H%M_%%f.%%e" -r $input_dir
