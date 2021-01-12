#!/bin/bash

sudo ufw disable
sudo ufw reset
sudo ufw default deny outgoing

sudo ufw allow out on <interface>
sudo ufw allow in on <vpn-interface> from any to any port 53 proto tcp comment 'dns traffic' #dns traffic
sudo ufw allow out on <interface> to any port 80 comment "http traffic" #http traffic
sudo ufw allow out on <interface> to any port 443 comment "https traffic" #https traffic
sudo ufw allow out to <vpn-ip> port <vpn-port> proto udp

sudo ufw enable
sudo ufw reload
sudo systemctl restart network-manager
sudo openvpn --auth-nocache --mssfix 1450 --config /home/hakdog/Documents/vpn-openvpn/internet-vpn.ovpn
