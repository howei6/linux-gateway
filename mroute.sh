#!/bin/bash

#double ADSL routing
#WAN: eth1 eth2     LAN:eth0

#WAN1_TYPE     type 'ppp'
#WAN1_IF       interface
#WAN1_IP       ip address 
#WAN1_GW       gateway
#WAN1_WEIGTH   weight

WAN1_TYPE="ppp"
WAN1_IF="ppp0"
WAN1_IP=""
WAN1_GW=""
WAN1_weight=5

WAN2_TYPE="ppp"
WAN2_IF="ppp1"
WAN2_IP=""
WAN2_GW=""
WAN2_weight=5

if ! ip route ls | grep ppp > /dev/null;then
  echo "ppp is down."
  exit 1
fi


# get the ip and gw of the two ppp interfaces
ppp0_ip=`ip route ls | awk '/ppp0.*src/ {print $9}'`
ppp0_gw=`ip route ls | awk '/ppp0.*src/ {print $1}'`

ppp1_ip=`ip route ls | awk '/ppp1.*src/ {print $9}'`
ppp1_gw=`ip route ls | awk '/ppp1.*src/ {print $1}'`


#double WAN's routing table is 100 and 200
for i in 100 200; do
  #while area change
  if [ "$i" = "100" ]; then
    type="WAN1_type"
    IP="WAN1_IP"
    GW="WAN1_GW"
  else
    type="WAN2_type"
    IP="WAN2_IP"
    GW="WAN2_GW"
  fi

  #clear route table avoid repeat doing this with errors
  if [ "$i" = "100" ]; then
    ip rule del from $ppp0_ip table $i 2>/dev/null
    ip route del table $i 2>/dev/null
  #setting rule and table about ppp line
    ip route replace default via $ppp0_gw table $i
    ip rule add from $ppp0_ip table $i
    
    [ $i == "100" ] && WAN1_GW_S="ppp0_gw"
  else
    ip rule del from $ppp1_ip table $i 2>/dev/null
    ip route del table $i 2>/dev/null

    ip route replace default via $ppp1_gw table $i
    ip rule add from $ppp1_ip table $i

    [ $i == "200" ] && WAN2_GW_S="ppp1_gw"
  fi
done


#mutipule routing methods
#it's the point
ip route replace default \
  nexthop via $WAN1_GW_S dev $WAN1_IF weight $WAN1_WEIGHT \
  nexthop via $WAN2_GW_S dev $WAN2_IF weight $WAN2_WEIGHT

#flush the cache,enable the settings right now
ip route flush cache
