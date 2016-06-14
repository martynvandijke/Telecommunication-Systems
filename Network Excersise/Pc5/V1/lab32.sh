#!/bin/bash
	
ip link set eth0 up

ip addr add 10.99.0.5/24 dev eth0

printf "Done with the ip setup \n"

#ip route add default via 10.99.0.1
route add -host 10.99.22.4 gw 10.99.0.1
route add -host 10.99.33.3 gw 10.99.22.2
