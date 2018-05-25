#!/bin/bash
# https://github.com/OpenDroneMap/OpenDroneMap/issues/313
#IMO, very slow readout with rolling shutter like gopro @30ms sensor readout without stabilisation is problematic for photogrammetry.
#Since CMOS sensor are rolling shutter without exception at this time. 
# Like Sony A6000, Nikon D810, Canon 6D have a sensor readout of around 4ms or 1/250s, it seems not be an issue.
# Small CMOS sensor have better readout like 1" on g9x or rx100 (may be the same sensor and of course
# same as parrot sequoia or dji phantom4 pro) or Canon S100, Sony WX220 around 0.5ms or 1/2000s
# Looks like the DJI Phantom 4 has a 30 - 33 ms rolling shutter, so at 5m/s this takes 15cm along my line of flight, but at 10m/s this is 30cm
echo "************** comparing LMK vs Digital. yjmenezes@gmail.com 2016-07-27"
VVKMH=250
FOLAP=80
SDLAP=50
if [ $# -lt 3 ]; then
    echo $(basename $0) "camera forwardlap% sidelap% " 1>&2
    exit 1
fi
FOLAP=$2
SDLAP=$3
case $1 in
dji)
echo "------------------------------------------------------------------------"
F=3.61
WPIX=4000
HPIX=3000
PIX=1.56192
# mm pixel, pixel, microns  w=6.17mm x h=4.55mm
printf "DJI   focal 3.61 mm  rlong %d   rlat %d  pixel 1.56192 microns FOV=hhxvvgraus\n" $FOLAP $SDLAP 
printf "escala\thv_pes\thv_m\tgsd_cm\tfto_w_m\tfto_h_m\tbase(m)\tdist_fxfx(m)\n"
#qh=quadro qw=largura
for e in 3500 4000 5000 8000 10000 12000 15000 20000 25000 30000 35000 40000 42000 45000 50000 55000 75000; do
    echo $e | awk -v f=$F -v wi=$WPIX -v hi=$HPIX -v p=$PIX -v lo=$FOLAP -v la=$SDLAP '{ e=$1; hvm=e*f/1000.0; hvp=hvm/0.3048; qw=wi*p*e/1000000; qh=hi*p*e/1000000;
 base=qh*(100.0-lo)/100.0; fx=qw*(100.0-la)/100.0; printf "%d\t%.0f\t%.0f\t%.2f cm\t%.2f\t%.2f\t%.2f\t%.2f\n",e,hvp,hvm,e*p/10000.0,qw,qh,base,fx  } '
done
;;
canon)
echo "------------------------------------------------------------------------"
F=4.5
WPIX=4000
HPIX=3000
PIX=1.549
# mm pixel, pixel, microns  w=6.196mm x h=4.647mm
printf "Canon    focal 4.5 mm  rlong %d   rlat %d  pixel 1.549 microns FOV=69x54graus\n" $FOLAP $SDLAP 
printf "escala\thv_pes\thv_m\tgsd_cm\tfto_w_m\tfto_h_m\tbase(m)\tdist_fxfx(m)\n"
#qh=quadro qw=largura
for e in 3500 4000 5000 8000 10000 12000 15000 20000 25000 30000 35000 40000 42000 45000 50000 55000 75000; do
    echo $e | awk -v f=$F -v wi=$WPIX -v hi=$HPIX -v p=$PIX -v lo=$FOLAP -v la=$SDLAP '{ e=$1; hvm=e*f/1000.0; hvp=hvm/0.3048; qw=wi*p*e/1000000; qh=hi*p*e/1000000;
 base=qh*(100.0-lo)/100.0; fx=qw*(100.0-la)/100.0; printf "%d\t%.0f\t%.0f\t%.2f cm\t%.2f\t%.2f\t%.2f\t%.2f\n",e,hvp,hvm,e*p/10000.0,qw,qh,base,fx  } '
done
;;
sony)
echo "#------------------------------------------------------------------------"
F=16.0
WPIX=5436
HPIX=3632
PIX=4.267
# mm pixel, pixel, microns  w=23,19mm x h=15.498mm
printf "Sony alfa5000     focal 16 mm  rlong %d   rlat %d  pixel 4.267 microns FOV=71x51\n" $FOLAP $SDLAP 
#echo $F 1>&2
printf "escala\thv_pes\thv_m\tgsd_cm\tfto_w_m\tfto_h_m\tbase(m)\tdist_fxfx(m)\n"
#qh=quadro qw=largura
for e in 3500 4000 5000 8000 10000 12000 15000 20000 25000 30000 35000 40000 45000 50000 75000; do
    echo $e | awk -v f=$F -v wi=$WPIX -v hi=$HPIX -v p=$PIX -v lo=$FOLAP -v la=$SDLAP '{ e=$1; hvm=e*f/1000.0; hvp=hvm/0.3048; qw=wi*p*e/1000000; qh=hi*p*e/1000000;
 base=qh*(100.0-lo)/100.0; fx=qw*(100.0-la)/100.0; printf "%d\t%.0f\t%.0f\t%.2f cm\t%.2f\t%.2f\t%.2f\t%.2f\n",e,hvp,hvm,e*p/10000.0,qw,qh,base,fx  } '
done
;;
nikon)
echo "------------------------------------------------------------------------"
F=50.0
WPIX=7360
HPIX=4912
PIX=4.878
# mm pixel, pixel, microns  w=35.90mm x h=24.0mm
printf "NIKON D810 24mm~120mm   focal 50 mm  rlong %d   rlat %d  pixel 4.878 microns FOV=39x27\n" $FOLAP $SDLAP 
#echo $F 1>&2
printf "escala\thv_pes\thv_m\tgsd_cm\tfto_w_m\tfto_h_m\tbase(m)\tdist_fxfx(m)\n"
#qh=quadro qw=largura
for e in 3500 4000 5000 8000 10000 12000 15000 20000 25000 30000 35000 40000 45000 50000 75000; do
    echo $e | awk -v f=$F -v wi=$WPIX -v hi=$HPIX -v p=$PIX -v lo=$FOLAP -v la=$SDLAP '{ e=$1; hvm=e*f/1000.0; hvp=hvm/0.3048; qw=wi*p*e/1000000; qh=hi*p*e/1000000;
 base=qh*(100.0-lo)/100.0; fx=qw*(100.0-la)/100.0; printf "%d\t%.0f\t%.0f\t%.2f cm\t%.2f\t%.2f\t%.2f\t%.2f\n",e,hvp,hvm,e*p/10000.0,qw,qh,base,fx  } '
done
;;
ixa)
echo "------------------------------------------------------------------------"
#53.7056mm  = 10.328x5.2 x 40.352mm
F=55
WPIX=10328
HPIX=7760
PIX=5.2
# mm pixel, pixel, microns 53.705mm x 40.352mm
printf "iXa180 focal %.3f mm  rlong %d   rlat %d  pixel 5.2 microns  FOV=52x40graus\n" $F $FOLAP $SDLAP
printf "escala\thv_pes\thv_m\tgsd_cm\tfto_w_m\tfto_h_m\tbase(m)\tdist_fxfx(m)\n"
#qh=quadro qw=largura 5000 8000 10000 
for e in 10000 11000 12000 14000 14320 15000 17000 19233 20000 25000 30000 35000 40000 45000 50000 60000 70000 80000 90000 100000 150000 200000; do
    echo $e | awk -v f=$F -v wi=$WPIX -v hi=$HPIX -v p=$PIX -v lo=$FOLAP -v la=$SDLAP '{ e=$1; hvm=e*f/1000.0; hvp=hvm/0.3048; qw=wi*p*e/1000000; qh=hi*p*e/1000000;
 base=qh*(100.0-lo)/100.0; fx=qw*(100.0-la)/100.0; printf "%d\t%.0f\t%.0f\t%.2f cm\t%.2f\t%.2f\t%.2f\t%.2f\n",e,hvp,hvm,e*p/10000.0,qw,qh,base,fx  } '
done 
;;
vexel)
echo "#------------------------------------------------------------------------"
F=70
WPIX=11704
HPIX=7920
PIX=6
# mm pixel, pixel, microns 70.22mm x 47.52mm
printf "Vexcel focal %.3f mm  rlong %d   rlat %d  pixel 6 microns FOV=53x37graus\n" $F $FOLAP $SDLAP
printf "escala\thv_pes\thv_m\tgsd_cm\tfto_w_m\tfto_h_m\tbase(m)\tdist_fxfx(m)\n"
#qh=quadro qw=largura 5000 8000 10000 
for e in 10000 12000 15000 17000 20000 25000 30000 35000 40000 45000 50000 60000 70000 80000 90000 100000 150000 200000; do
    echo $e | awk -v f=$F -v wi=$WPIX -v hi=$HPIX -v p=$PIX -v lo=$FOLAP -v la=$SDLAP '{ e=$1; hvm=e*f/1000.0; hvp=hvm/0.3048; qw=wi*p*e/1000000; qh=hi*p*e/1000000;
 base=qh*(100.0-lo)/100.0; fx=qw*(100.0-la)/100.0; printf "%d\t%.0f\t%.0f\t%.2f cm\t%.2f\t%.2f\t%.2f\t%.2f\n",e,hvp,hvm,e*p/10000.0,qw,qh,base,fx  } '
done
;;
lmk)
echo "#------------------------------------------------------------------------"
F=152.274
WPIX=9728
HPIX=9984
PIX=24
# mm pixel, pixel, microns  w=23,338mm x h=23,953mm
printf "LMK    focal 152.274 mm  rlong %d   rlat %d  pixel 24 microns FOV=74x75\n" $FOLAP $SDLAP 
#echo $F 1>&2
printf "escala\thv_pes\thv_m\tgsd_cm\tfto_w_m\tfto_h_m\tbase(m)\tdist_fxfx(m)\n"
#qh=quadro qw=largura
for e in 3500 4000 5000 8000 10000 15000 20000 25000 30000 35000 40000 45000 50000 75000; do
    echo $e | awk -v f=$F -v wi=$WPIX -v hi=$HPIX -v p=$PIX -v lo=$FOLAP -v la=$SDLAP '{ e=$1; hvm=e*f/1000.0; hvp=hvm/0.3048; qw=wi*p*e/1000000; qh=hi*p*e/1000000;
 base=qh*(100.0-lo)/100.0; fx=qw*(100.0-la)/100.0; printf "%d\t%.0f\t%.0f\t%.2f cm\t%.2f\t%.2f\t%.2f\t%.2f\n",e,hvp,hvm,e*p/10000.0,qw,qh,base,fx  } '
done
;;
*)
echo "dji | canon | sony | nikon | ixa | vexel | lmk "
;;
esac
exit 0
