#!/bin/bash
ip link set eth0 up
ip link set eth1 up

ip addr add 10.0.4.1/24 dev eth0 
ip addr add 10.0.2.2/24 dev eth1

echo 1 > /proc/sys/net/ipv4/ip_forward

printf "Done with the ip setup \n"

#route C0->A-E0
ip route add 10.0.7.0/24 via 10.0.4.2
#route C0->A->E1
ip route add 10.0.6.0/24 via 10.0.4.2 

#route C1->B2
ip route add 10.0.3.1 via 10.0.2.1 
#route C1->B1
ip route add 10.0.1.2 via 10.0.2.1 

#route C0->A0
ip route add 10.0.1.1 via 10.0.4.2
#route C0->A3
ip route add 10.0.5.0/24 via 10.0.4.2

#route C0->A->D2
ip route add 10.0.3.2 via 10.0.4.2 

printf "Done with gateway setup \n" 

