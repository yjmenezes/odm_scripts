#!/bin/bash
# GPL2 yjmenezes cartognu.org ver 1.0 2017-03-18
if [ $# -lt 3 ]; then
    echo $(basename $0)" basepath   src_ext  pattern" 1>&2
    echo $(basename $0)"  ~/OpenDroneMap  cpp  exiv2" 1>&2 
    echo $(basename $0)"  ~/OpenDroneMap  py   exiv2  > /tmp/here.txt" 1>&2 
    exit 1
fi
BASE=$1
EXT=$2
PAT=$3
find $BASE/ -type f -name "*$EXT" -exec ls {} \; | \
 while read lin; do
     echo "--------" $lin; 
     grep $PAT $lin;
done
exit 0
