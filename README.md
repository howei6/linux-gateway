
mroute.sh            double ADSL line routing balance


#####*****#####################
use ubuntu server as a gateway#
###############################
                       
                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#######ADSL#######      @******                     @
                 #----- @*eth1*               ******@
                        @****** linux server  *eth0*@-------------switch                   
                        @******               ******@
                 #----- @*eth2*                     @
#######ADSL#######      @******                     @
                        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@

1,for ADSL(pppoe) access
    sudo ifconfig eth0 up
    sudo pppoeconf

    sudo pon dsl-provider
    sudo poff
    plog
    ifconfig ppp0

2,isc-dhcp-server - ISC DHCP server for automatic IP address assignment

3,for ubuntu source, just change "http://hk" to "http://uk." instead,.In this way, it would be faster.

