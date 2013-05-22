linux-gateway
=============


#####*****######
#hardware info:#
#eth0,eth1,eth2#
#####*****#####################
use ubuntu server as a gateway#
###############################

1,for ADSL(pppoe) access
    sudo ifconfig eth0 up
    sudo pppoeconf

    sudo pon dsl-provider
    sudo poff
    plog
    ifconfig ppp0

2,isc-dhcp-server - ISC DHCP server for automatic IP address assignment

