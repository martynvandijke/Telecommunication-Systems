#!/bin/bash
	
ip link set eth0 up
ip link set eth1 up

ip addr add 10.0.7.1/24 dev eth0
ip addr add 10.0.6.2/24 dev eth1 

echo 1 > /proc/sys/net/ipv4/ip_forward

printf "Done with the ip setup \n"
 
#route E0->A3
ip route add 10.0.5.2 via 10.0.7.2 
#route E0->A0
ip route add 10.0.1.0/24 via 10.0.7.2 

#route E1->D1
ip route add 10.0.5.1 via 10.0.6.1 
#route E0->A->C0
ip route add 10.0.4.0/24 via 10.0.7.2 
#route E0->A->C1
ip route add 10.0.2.0/24 via 10.0.7.2 
 
#route E0->A->B2
ip route add 10.0.3.1 via 10.0.7.2
#route E->D2
ip route add 10.0.3.2 via 10.0.6.1 

printf "Done with the static ip routing \n" 
