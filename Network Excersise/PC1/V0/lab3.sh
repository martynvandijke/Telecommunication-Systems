#!/bin/bash

ip link set eth0 up
#ip link set eth1 up
ip addr add 10.99.11.1/24 dev eth0
#ip addr add 192.168.1.1/24 dev eth0
printf "Done with the ip setup \n"

#echo 1 > /proc/sys/net/ipv4/ip_forward

#printf "Done with the forwarding \n"
