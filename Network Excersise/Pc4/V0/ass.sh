#!/bin/bash

ip link set eth1 up
ip link set eth2 up
ip link set eth0 up

ip addr add 10.0.6.1/24 dev eth0
ip addr add 10.0.5.1/24 dev eth1 
ip addr add 10.0.3.2/24 dev eth2

echo 1 > /proc/sys/net/ipv4/ip_forward

#ip route add 10.0.7.2 via 10.0.6.2 dev eth0


printf "Done with the setup \n"
