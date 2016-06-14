#!/bin/bash

ip link set eth0 up
ip link set eth1 up
ip link set eth2 up

ip addr add 10.99.11.4/24 dev eth0
ip addr add 10.99.22.4/24 dev eth1 
ip addr add 10.99.33.4/24 dev eth2

echo 1 > /proc/sys/net/ipv4/ip_forward

printf "Done with the setup \n"
