#!/bin/bash
#flush iptables
iptables -F

#activate routing:
sysctl -w net/ipv4/ip_forward=1   
#activate nat:
iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -o eth0 -s 10.6.0.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.6.0.0/24 -j SNAT --to-source 158.255.213.118

