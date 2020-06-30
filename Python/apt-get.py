#!/usr/bin/python3

import os
import subprocess

n = "\n"

print(n)

print("Running an apt-get update and upgrade on system" )

print(n)

subprocess.call(['sudo', 'apt-get', 'update'])
subprocess.call(['sudo', 'apt-get', 'upgrade'])
subprocess.call(['sudo', 'apt-get', 'dist-upgrade'])
subprocess.call(['sudo', 'apt-get', 'autoremove'])
subprocess.call(['sudo', 'apt-get', 'clean'])

subprocess.call(['sudo', 'apt', 'update'])
subprocess.call(['sudo', 'apt', 'upgrade'])
subprocess.call(['sudo', 'apt', 'dist-upgrade'])
subprocess.call(['sudo', 'apt', 'autoremove'])
subprocess.call(['sudo', 'apt', 'clean'])

resp = input(""""\nDo you want to restart?
                     1)Yes
                     2)No """)
if resp == "1":
    subprocess.call(["reboot"])
elif resp == "2":
    subprocess.call(["exit"])