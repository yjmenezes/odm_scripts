#!/bin/bash
#GPL2 jmenezes ODM gcp_list.txt from lon/lat to utm wgs with proj4; 2017-05-28
# example zone=43  north;  lon/lat decimal degree with algebraic signal
#EPSG:4326
#73.218063 0.225385 0 1726 2916 R0011006.jpg A
if [ $# -lt 2 ]; then
    echo $(basename $0)" zone  [S|N] < gcp_lonlat.txt > gcp_utm.txt"
    exit 1
fi
Z=$1
case $2 in
s|S)
grep \- | proj  -f "%.3f" +proj=utm +zone=$Z +south +ellps=WGS84 | \
awk -v z=$Z 'BEGIN { print "EPSG:" z+32700 } { print $0 }'
;;
n|N)
grep ^[0-9] | proj  -f "%.3f" +proj=utm +zone=$Z +north +ellps=WGS84 | \
awk -v z=$Z 'BEGIN { print "EPSG:" z+32600 } { print $0 }'
;;
*)
;;
esac
exit 0
