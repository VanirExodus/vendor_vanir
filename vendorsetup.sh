#!/bin/bash
COMBOS()
{
cat<<EOF
bacon
codinalte
deb
d2att
d2spr
d2vzw
d800
d801
d802
d803
d850
d851
dlx
e980
evita
falcon
find5
find7
flo
geeb
gee
golden
grouper
hammerhead
hltespr
hltetmo
honami
huashan
i605
i9300
i9305
janice
jewel
jflteatt
jfltespr
jfltetmo
jflteusc
jfltevzw
jfltexx
klte
kltedv
kltespr
kltevzw
ls980
ls990
m4
m7spr
m7
m7vzw
m8
maguro
manta
mako
maserati
mondrianwifi
moto_msm8960
moto_msm8960_jbbl
n1
n5100
n5110
n5120
n7100
nicki
p880
pollux
pollux_windy
shamu
sirius
skomer
t0lte
taoshan
tf700t
tf701t
tilapia
toro
toroplus
tsubasa
v500
ville
vs980
vs985
xt926
yuga
EOF
}

for x in `COMBOS | sort -h`; do 
  add_lunch_combo vanir_$x-userdebug
  add_lunch_combo vanir_$x-eng
done
