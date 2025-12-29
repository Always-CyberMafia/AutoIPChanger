#!/bin/bash
# -------------------------------
# 🔁 IPHopper - IP Changing Tool
# Created by Shahariar Zaman 
# -------------------------------

clear
echo -e "            \e[31m  A   U   U TTTTT  OOO        III PPPP  "
echo -e "            \e[32m A A  U   U   T   O   O        I  P   P "
echo -e "            \e[33mAAAAA U   U   T   O   O        I  PPPP  "
echo -e "            \e[34mA   A U   U   T   O   O        I  P     "
echo -e "            \e[35mA   A  UUU    T    OOO        III P     "
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "\e[1;33m         🔁 IPHopper - IP Changing Tool 🔁\e[0m"
echo -e "\e[1;32m         👨‍💻 Created by Shahariar Zaman| Facebook: @i.am.shahariarzaman\e[0m"
echo -e "\e[1;36m         👉 Follow my Profile on Facebook for amazing tips & tricks 💡\e[0m"
echo -e "\e[37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Kill old services and cleanup
pkill tor
pkill privoxy
rm -rf ~/.tor_multi ~/.privoxy
mkdir -p ~/.tor_multi ~/.privoxy

# Generate random 4-digit ports
PORTS=()
CONTROL_PORTS=()

for i in {0..4}; do
    # Generate random 4-digit ports between 1000-9999
    SOCKS_PORT=$((RANDOM % 9000 + 1000))
    CTRL_PORT=$((RANDOM % 9000 + 1000))
    
    # Ensure ports are unique
    while [[ " ${PORTS[@]} " =~ " ${SOCKS_PORT} " ]] || [[ " ${CONTROL_PORTS[@]} " =~ " ${CTRL_PORT} " ]] || [[ $SOCKS_PORT -eq $CTRL_PORT ]]; do
        SOCKS_PORT=$((RANDOM % 9000 + 1000))
        CTRL_PORT=$((RANDOM % 9000 + 1000))
    done
    
    PORTS+=($SOCKS_PORT)
    CONTROL_PORTS+=($CTRL_PORT)
done

# Display generated ports
echo -e "\e[1;32m[+] Generated Working Ports:\e[0m"
echo -e "\e[1;36mTOR SOCKS Ports: ${PORTS[@]}\e[0m"
echo -e "\e[1;33mControl Ports: ${CONTROL_PORTS[@]}\e[0m"

# Launch multiple TOR instances
echo -e "\n\e[1;32m[+] Starting Tor Nodes & Proxy Server...\e[0m"

for i in {0..4}; do
    TOR_DIR="$HOME/.tor_multi/tor$i"
    mkdir -p "$TOR_DIR"
    cat <<EOF > "$TOR_DIR/torrc"
SocksPort ${PORTS[$i]}
ControlPort ${CONTROL_PORTS[$i]}
DataDirectory $TOR_DIR
CookieAuthentication 0
EOF
    tor -f "$TOR_DIR/torrc" > /dev/null 2>&1 &
    sleep 2
done

# Generate random 4-digit proxy port
PROXY_PORT=$((RANDOM % 9000 + 1000))

# Setup Privoxy with TOR SOCKS ports
cat <<EOF > "$HOME/.privoxy/config"
listen-address 127.0.0.1:$PROXY_PORT
EOF
for port in "${PORTS[@]}"; do
    echo "forward-socks5 / 127.0.0.1:$port ." >> "$HOME/.privoxy/config"
done

privoxy "$HOME/.privoxy/config" > /dev/null 2>&1 &

# Ask user for IP rotation interval
echo -ne "\n\e[1;36mEnter IP rotation interval (in seconds, min 5s): \e[0m"
read -r ROTATION_TIME

if [[ ! "$ROTATION_TIME" =~ ^[0-9]+$ ]] || [[ "$ROTATION_TIME" -lt 5 ]]; then
    echo -e "\e[1;31mInvalid input! Using default 10 seconds.\e[0m"
    ROTATION_TIME=10
fi

echo -e "\n\e[1;32m✅ Proxy Server Started Successfully!\e[0m"
echo -e "\e[1;33m[Proxy Address]: \e[1;36m127.0.0.1:$PROXY_PORT 🛰️\e[0m"
echo -e "\e[1;37m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"

# Infinite IP rotation loop
while true; do
    for ctrl_port in "${CONTROL_PORTS[@]}"; do
        echo -e "AUTHENTICATE \"\"\r\nSIGNAL NEWNYM\r\nQUIT" | nc 127.0.0.1 $ctrl_port > /dev/null 2>&1
    done
    NEW_IP=$(curl --proxy http://127.0.0.1:$PROXY_PORT -s https://api64.ipify.org)
    echo -e "\e[1;32m🌐 New IP: \e[1;37m$NEW_IP ✅\e[0m"
    echo -e "\e[1;33m[Proxy]: \e[1;36m127.0.0.1:$PROXY_PORT 🛰️\e[0m"
    sleep "$ROTATION_TIME"
done