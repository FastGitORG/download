#!/bin/bash
#ghproxy deployer
#by KevinZonda

echo "[-] Remove old ghproxy"
if [ ! -f "/bin/ghproxy" ]
then
    sudo rm -f "/bin/ghproxy"
fi

echo "[+] Detective ghproxy file"
if [ ! -f "ghproxy"]
then
    if [ ! -f "ghproxy.go" ]
    then
        echo "[!] No file to install!"
        exit 1
    else
        echo "[+] Buid ghproxy"
        go build ghproxy.go
    fi
else

echo "[+] Copy to /bin"
sudo cp ghproxy /bin/ghproxy

echo "[x] Everything finished, enjoy!"