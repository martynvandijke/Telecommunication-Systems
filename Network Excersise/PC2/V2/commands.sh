#!/bin/bash

ip link set eth0 up
ip addr add 192.168.0.2/24 dev eth0
printf "Done with the ip setup \n"

ip route add default via 192.168.0.1

printf "Done with the gateway \n"
