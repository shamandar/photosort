#!/bin/sh

if [ $# != 2 ]; then
    echo "Usage: photosort.sh INPUT_DIR SORTED_DIR"
    echo
    echo "Rename media files from INPUT_DIR to SORTED_DIR based on CreateDate."
    echo "Non-media and media files missing CreateDate remain unchanged in INPUT_DIR."
    exit 1
fi

input_dir=$(readlink -f $1)
sorted_dir=$(readlink -f $2)

exiftool '-FileName<CreateDate' -d "$sorted_dir/%Y/%m/%d/%Y%m%d_%H%M_%%f.%%e" -r $input_dir
