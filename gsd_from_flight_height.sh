#!/bin/bash
# yjmenezes@gmail.com 2016-07-27"
# compute FH= from flight height
if [ $# -lt 2 ]; then
    echo $(basename $0) "camera FlightHight_m " 1>&2
    exit 1
fi
FH=$2
case $1 in
dji)
echo "------------------------------------------------------------------------"
F=3.61
WPIX=4000
HPIX=3000
PIX=1.56192
# mm pixel, pixel, microns  w=6.17mm x h=4.55mm
echo $F $PIX $FH | awk '{ printf "DJI: focal= %.2f mm   pixel= %.5f microns FlightHeight %.2f m  GSD= %.2f cm\n", $1,$2,$3, $2*$3/$1/10.0  }'
;;
canon)
echo "------------------------------------------------------------------------"
F=4.5
WPIX=4000
HPIX=3000
PIX=1.549
echo $F $PIX $FH | awk '{ printf "Canon: focal= %.2f mm   pixel= %.5f microns  FlightHeight %.2f m  GSD= %.2f cm\n", $1,$2,$3, $2*$3/$1/10.0   }'
;;
sony)
echo "#------------------------------------------------------------------------"
F=16.0
WPIX=5436
HPIX=3632
PIX=4.267
# mm pixel, pixel, microns  w=23,19mm x h=15.498mm
echo $F $PIX $FH | awk '{ printf "Sony alfa5000: focal= %.2f mm   pixel= %.5f microns  FlightHeight %.2f m  GSD= %.2f cm\n", $1,$2,$3, $2*$3/$1/10.0  }'
;;
nikon)
echo "------------------------------------------------------------------------"
F=50.0
WPIX=7360
HPIX=4912
PIX=4.878
# mm pixel, pixel, microns  w=35.90mm x h=24.0mm
#NIKON D810 24mm~120mm    
echo $F $PIX $FH | awk '{ printf "NIKON D810: focal= %.2f mm   pixel= %.5f microns  FlightHeight %.2f m  GSD= %.2f cm\n", $1,$2,$3, $2*$3/$1/10.0  }'

;;
ixa)
echo "------------------------------------------------------------------------"
#53.7056mm  = 10.328x5.2 x 40.352mm
F=55
WPIX=10328
HPIX=7760
PIX=5.2
# mm pixel, pixel, microns 53.705mm x 40.352mm
echo $F $PIX $FH | awk '{ printf "iXa180: focal= %.2f mm   pixel= %.5f microns  FlightHeight %.2f m  GSD= %.2f cm\n", $1,$2,$3, $2*$3/$1/10.0  }'
;;
vexel)
echo "#------------------------------------------------------------------------"
F=70
WPIX=11704
HPIX=7920
PIX=6
# mm pixel, pixel, microns 70.22mm x 47.52mm
echo $F $PIX $FH | awk '{ printf "Vexel: focal= %.2f mm   pixel= %.5f microns  FlightHeight %.2f m\n", $1,$2,$3, $3*10*$1/$2  }'
;;
lmk)
echo "#------------------------------------------------------------------------"
F=152.274
WPIX=9728
HPIX=9984
PIX=24
# mm pixel, pixel, microns  w=23,338mm x h=23,953mm
echo $F $PIX $FH | awk '{ printf "ZeissLMK: focal= %.2f mm   pixel= %.5f microns  FlightHeight %.2f m\n", $1,$2,$3, $3*10*$1/$2  }'
;;
soda)
echo "------------------------------------------------------------------------"
F=10.5771
WPIX=5472
HPIX=3648
PIX=2.4
# PARROT S.O.D.A mm pixel, pixel, microns  w=13.1328mm x h=8.7552mm
echo $F $PIX $FH | awk '{ printf "SODA: focal= %.2f mm   pixel= %.5f microns FlightHeight %.2f m  GSD= %.2f cm\n", $1,$2,$3, $2*$3/$1/10.0  }'
;;

*)
echo "dji | canon | sony | nikon | ixa | vexel | lmk | soda "
;;
esac
exit 0
