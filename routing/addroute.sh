#!/bin/bash
GW='118.113.227.203'
CNLIST="ip.txt"
VPS="10.100.0.2"

route add -host $VPS gw $GW

route add default dev ppp1

for i in `cat $CNLIST`
do
  route add -net $i gw $GW
done
