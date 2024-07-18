#!/bin/bash

iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P INPUT ACCEPT
iptables -t nat -P OUTPUT ACCEPT

iptables -t filter -P FORWARD DROP
iptables -t filter -P INPUT DROP
iptables -t filter -P OUTPUT ACCEPT

iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i wg0 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dports 80,443 -j ACCEPT
iptables -A INPUT -p udp -m udp --dport 51820 -j ACCEPT
iptables -A FORWARD -s 10.13.13.3/32 -i wg0 -o eth0 -j ACCEPT
iptables -A FORWARD -d 10.13.13.3/32 -i eth0 -o wg0 -p tcp -m multiport --dports 80,443 -j ACCEPT
iptables -A FORWARD -d 10.13.13.3/32 -i eth0 -o wg0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT