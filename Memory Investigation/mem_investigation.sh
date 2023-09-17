#!/bin/bash

echo -e "\n[+] Enter the memory dump operating system: "
echo -e "[-] 1. windows"
echo -e "[-] 2. linux"
echo -e "[-] 3. macos"
echo -n "[=] : "
read choice

if [ $choice -eq 1 ]; then
  dmp_os=windows
elif [ $choice -eq 2 ]; then
  dmp_os=linux
elif [ $choice -eq 3 ]; then
  dmp_os=mac
fi

echo -en "Enter the filename : "
read filename

mkdir "mem_investigation_result"

for plugin in $dmp_os.netscan.NetScan $dmp_os.pstree.PsTree $dmp_os.pslist.PsList $dmp_os.cmdline.CmdLine $dmp_os.filescan.FileScan $dmp_os.dlllist.DllList
do
  echo "[+] Extracting $plugin from the mem dump"
  vol -q -f $filename $plugin > ./mem_investigation_result/$filename.$plugin.txt
done

echo -e "[+] Extracting the strings"
strings $filename > $filename.strings-asc.txt
strings -e -l $filename > $filename.strings-unile.txt
strings -e -b $filename > $filename.strings-unibe.txt

