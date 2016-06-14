#!/bin/bash

ip link set eth1 up
ip link set eth2 up
ip link set eth0 up

ip addr add 10.0.6.1/24 dev eth0
ip addr add 10.0.5.1/24 dev eth1 
ip addr add 10.0.3.2/24 dev eth2

echo 1 > /proc/sys/net/ipv4/ip_forward

#ip route add 10.0.7.2 via 10.0.6.2 dev eth0
 
#route D0->E->A1
ip route add 10.0.7.2 via 10.0.6.2 dev eth0
#rooute D0->E->A2
ip route add 10.0.4.2 via 10.0.6.2 dev eth0
#route D0->E->A3
ip route add 10.0.5.2 via 10.0.6.2 dev eth0
#route D0->E->A0
ip route add 10.0.1.1 via 10.0.6.2 dev eth0

#route D0->E0
ip route add 10.0.7.1 via 10.0.6.2 dev eth0

#route D1->A->C0
ip route add 10.0.4.1 via 10.0.5.2 dev eth1
#route D1->A->C1
ip route add 10.0.2.2 via 10.0.5.2 dev eth1

#route D2->B1
ip route add 10.0.1.2 via 10.0.3.1 dev eth2
#route D2->B0
ip route add 10.0.2.1 via 10.0.3.1 dev eth2

printf "Done with the setup \n"
