#!/bin/bash

echo -e  "[+] Chose whether you wnat to just extract the IP or IP with specific destination address / domain, or string"
echo -e  "[-] 1. Only IP"
echo -e  "[-] 2. With destination domain or address"
echo -en "[=] : "
read choice
echo -e ""

echo -e  "[+] Enter squid proxy log file"
echo -en "[=] : "
read filename

if [ $choice -eq 1 ]; then
  spf_str=
elif [ $choice -eq 2 ]; then
  read spf_str
fi

awk "/$spf_str/ {print \$3} $filename" | sort -u
