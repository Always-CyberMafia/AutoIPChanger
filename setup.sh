#!/bin/bash
# 🔧 IPHopper Setup Script
# Created by Shahariar Zaman 

echo -e "\e[1;33m[+] Updating & Upgrading Termux Packages...\e[0m"
apt update -y && apt upgrade -y

echo -e "\e[1;33m[+] Installing tor-repo & Required Packages...\e[0m"
pkg install python -y
pkg install git -y
pkg install curl -y
apt install tor
apt install tur-repo
apt install privoxy -y 
apt install netcat-openbsd -y
pip install requests rich bs4 lolcate mechanize httpx pycurl
echo -e "\e[1;32m[✓] All dependencies installed successfully!\e[0m"
