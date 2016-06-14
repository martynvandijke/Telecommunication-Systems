#!/bin/bash

ip link set eth0 up
ip link set eth1 up
ip link set eth2 up

ip addr add 10.0.2.1/24 dev eth0
ip addr add 10.0.1.2/24 dev eth1
ip addr add 10.0.3.1/24 dev eth2

echo 1 > /proc/sys/net/ipv4/ip_forward

printf "Done with the ip setup \n"

#route B0->C->A2 +B->C0
ip route add 10.0.4.0/24 via 10.0.2.2 
#route B0->C->A1 +B0->C->A->E
ip route add 10.0.7.0/24 via 10.0.2.2 
#route B0->C->A3  + B->C->A->E->D
ip route add 10.0.5.0/24 via 10.0.2.2 
#route B0->C->A0
ip route add 10.0.1.1 via 10.0.2.2

#route B->C->A->E->D
ip route add 10.0.3.2 via 10.0.2.2

#route B0->C->A0->E1 + B->C->A->E->D
ip route add 10.0.6.0/24 via 10.0.2.2

printf "Done with the route setup \n"
