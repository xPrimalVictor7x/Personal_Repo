#!/usr/bin/env python3

import os 
import subprocess 
from nmap import ip_addr

n = "\n"

print("<--------------------------------------------------------------------------------------------------->")

print("Writing file as nikto.txt in Recon/Web folder")
print(n)
subprocess.call(['nikto', '-h', ip_addr, "-t", "7", " -o", "recon/web/nikto.txt"])
print(n)

print("<--------------------------------------------------------------------------------------------------->")

# print("Writing file as gobuster.txt in Recon/Web folder")
# print(n)
# subprocess.call(['gobuster dir', '-u', 'http://', ip_addr, '-w', /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt -t 40 | tee recon/nmap/gobuster.txt")
# print(n)

print("<--------------------------------------------------------------------------------------------------->")
print(n)
print("Done with Web scan")