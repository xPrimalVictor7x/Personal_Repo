#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Usage: ./destroy.sh <IP>"
	exit
fi

touch $1 \

chmod +x $1 \

mkdir nmap loot \

cp -r /home/kali/Pentesting/Reporting_Template report

autorecon $1 -v --single-target --only-scans-dir --no-port-dirs --dirbuster.tool dirsearch --dirbuster.wordlist /usr/share/seclists/Discovery/Web-Content/raft-small-words.txt -o scans
