#!/bin/bash

ip link set eth0 up
ip link set eth1 up
ip addr add 10.99.11.1/24 dev eth0
ip addr add 10.99.0.1/24 dev eth1  


#ip link set eth0 up
#ip link set eth1 up
#ip addr add 10.99.11.1/24 dev eth0
#ip addr add 192.168.1.1/24 dev eth0
printf "Done with the ip setup \n"

#ip route add default via 10.99.11.4

#printf "Done with gateway setup\n"


echo 1 > /proc/sys/net/ipv4/ip_forward

ip route add 10.0.2.1 via 10.0.4.1 dev eth2


printf "Done with the forwarding \n"
