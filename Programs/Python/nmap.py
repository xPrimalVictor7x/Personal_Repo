#!/usr/bin/env python3

import os 
import subprocess

n = "\n"

print(n) 
ip_addr = input("Please Enter Web IP to Enumerate: ")
print(n)
Line = print("<--------------------------------------------------------------------------------------------------->")

print(n)
print("Starting Recon Script for:", ip_addr, "Good Luck!(:")
print(n)

print(Line)

print(n)
print("Creating Recon folder")
os.system("mkdir recon")
os.system("mkdir recon/nmap | mkdir recon/web")
print(n)

print(Line)

print(n)
print("Writing file as nmap.txt in Recon/Nmap folder")
print(n)
subprocess.call(['nmap', ip_addr, '-T4', '-oN', 'recon/nmap/nmap.txt'])
print(n)

print(Line)

print(n)
print("Writing file as tcp.txt in Recon/Nmap folder")
print(n)
subprocess.call(['nmap', ip_addr, '-p-', '-sT', '-T4', '-oN', 'recon/nmap/tcp.txt'])
print(n)

print(Line)

print("Writing file as script.txt in Recon/Nmap folder")
print(n)
subprocess.call(['nmap', ip_addr, '-p-', '-sC', '-T4', '-oN', 'recon/nmap/script.txt'])
print(n)

print(Line)

print("Writing file as web.txt in Recon/Nmap folder")
print(n)
subprocess.call(['nmap', ip_addr, '-p80,443', '-sC', '-sV', '-T4', '-oN', 'recon/nmap/web.txt'])
print(n)

print(Line)
print(n)
print("Done with NMAP scan")