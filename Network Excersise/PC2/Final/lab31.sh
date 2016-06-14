#!/bin/bash

ip link set eth0 up
ip addr add 10.99.22.2/24 dev eth0
printf "Done with the ip setup \n"

ip route add default via  10.99.22.4

printf "Done with the gateway \n"
