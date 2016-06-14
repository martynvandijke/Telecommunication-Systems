#!/bin/bash

ip link set eth0 up
ip link set eth1 up
ip link set eth2 up
ip link set eth3 up

ip addr add 10.0.1.1/24 dev eth0
ip addr add 10.0.7.2/24 dev eth1  
ip addr add 10.0.4.2/24 dev eth2
ip addr add 10.0.5.2/24 dev eth3

printf "Done with the ip setup \n"

echo 1 > /proc/sys/net/ipv4/ip_forward

#route A->C->B0
ip route add 10.0.2.0/24 via 10.0.4.1

#route A->B2
ip route add 10.0.3.1 via 10.0.4.1

#route A->B3
ip route add 10.0.1.2 via 10.0.4.1 

#route A->E->D0 + A->E1
ip route add 10.0.6.0/24 via 10.0.7.1 
#route A->E->D2
ip route add 10.0.5.1 via 10.0.7.1 
#route A->E->D2
ip route add 10.0.3.2 via 10.0.7.1


printf "Done with the forwarding \n"
