#!/bin/bash
# yjmenezes@gmail.com 2016-07-27"
# Shutter speed setting: one half GSD(cm) / aircraft ground speed (m/s)
# (faster is better to be safe) to minimise image dragging
if [ $# -lt 2 ]; then
    echo $(basename $0) "GSD_cm   FlightSpeed_m/s " 1>&2
    exit 1
fi
echo $1 $2 | awk '{ printf "GSD %.2f cm; FlightSpeed= %.2f m/s; min_shutter=1/%.0f sec or faster\n",$1,$2, ($2*200.0/$1)+0.5 }'
exit 0
