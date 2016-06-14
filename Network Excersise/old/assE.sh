#!/bin/bash

ip link set eth1 up
ip link set eth2 up
ip link set eth0 up

ip addr add 10.0.6.1/24 dev eth0
ip addr add 10.0.5.1/24 dev eth1 
ip addr add 10.0.3.2/24 dev eth2

echo 1 > /proc/sys/net/ipv4/ip_forward

#ip route add 10.0.7.2 via 10.0.6.2 dev eth0

#route E0->A2
ip route add 10.0.4.2 via 10.0.1.1 dev eth0
#route E0->A3
ip route add 10.0.5.2 via 10.0.1.1 dev eth0
#route E0->A0
ip route add 10.0.1.1 via 10.0.1.1 dev eth0

#route E1->D1
ip route add 10.0.5.1 via 10.0.6.1 dev eth1
#route E1->D2
ip route add 10.0.3.2 via 10.0.6.1 dev eth1

#route E0->A->C0
ip route add 10.0.4.2 via 10.0.7.2 dev eth0
#route E0->A->C1
ip route add 10.0.2.2 via 10.0.7.2 dev eth0

#route E0->A->B0
ip route add 10.0.2.1 via 10.0.7.2 dev eth0
#route E0->A->B1
ip route add 10.0.1.2 via 10.0.7.2 dev eth0
#route E0->A->B2
ip route add 10.0.3.1 via 10.0.7.2 dev eth0

printf "Done with the setup \n"
