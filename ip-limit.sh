#!/bin/bash

for i in {100..244};do
  iptables -A FORWARD -s 192.168.1.$i -m limit --limit 100/s -j ACCEPT
  iptables -A FORWARD -d 192.168.1.$i -m limit --limit 100/s -j ACCEPT
done
