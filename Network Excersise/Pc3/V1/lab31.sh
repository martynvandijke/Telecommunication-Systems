#!/bin/bash
ip link set eth0 up
ip addr add 10.99.33.3/24 dev eth0 
printf "Done with the ip setup \n"

ip route add default via 10.99.33.4

printf "Done with gateway setup \n" 

#ip link set eth2 up
#udhcpc -i eth2

#printf "Done with the local eth 2 port \n"
