#!/bin/bash

if [ $1 ];then
	ports=$(cat $1 | grep open | cut -d" " -f1 | tr -d "/tcp" | paste -sd ",")
	echo $ports
	else
	echo "Script Usage: ./Extract_NMAP_PORTS <nmap.txt>"
	echo
	echo "The nmap scan must be in a .txt file; use tee"
fi



