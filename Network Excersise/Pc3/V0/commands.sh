#!/bin/bash
ip link set eth1 up
ip addr add 192.168.1.3/24 dev eth1 
printf "Done with the ip setup \n"

ip route add default via 192.168.1.1

printf "Done with gateway setup \n" 

ip link set eth2 up
udhcpc -i eth2

printf "Done with the local eth 2 port \n"
