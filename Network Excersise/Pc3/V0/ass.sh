#!/bin/bash
ip link set eth0 up
ip link set eth1 up

ip addr add 10.0.4.1/24 dev eth0 
ip addr add 10.0.2.2/24 dev eth1

echo 1 > /proc/sys/net/ipv4/ip_forward

printf "Done with the ip setup \n"

#route C0->A-E0
ip route add 10.0.7.1 via 10.0.4.2 dev eth0
#route C0->A->E1
ip route add 10.0.6.2 via 10.0.4.2 dev eth0

#route C1->B2
ip route add 10.0.3.1 via 10.0.2.1 dev eth1
#route C1->B1
ip route add 10.0.1.2 via 10.0.2.1 dev eth1

#route C0->A0
ip route add 10.0.1.1 via 10.0.4.2 dev eth0
#route C0->A1
ip route add 10.0.7.2 via 10.0.4.2 dev eth0
#route C0->A3
ip route add 10.0.5.2 via 10.0.4.2 dev eth0

#route C0->A->D1
ip route add 10.0.6.1 via 10.0.4.2 dev eth0
#route C0->A->D2
ip route add 10.0.3.2 via 10.0.4.2 dev eth0
#route C0->A->D0
ip route add 10.0.6.1 via 10.0.4.2 dev eth0 

#ip route add default via 10.99.33.4

printf "Done with gateway setup \n" 

#ip link set eth2 up
#udhcpc -i eth2

#printf "Done with the local eth 2 port \n"
