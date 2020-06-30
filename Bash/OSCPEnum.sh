#!/bin/bash

#######################################################################################################
#This script was made with multiple intentions such as learning Bash, creating my first script, making#
#a script for the OSCP, and making a script to transpose into Python. This script took about x days to#
#create and goes to show that when you try harder, it truly shows. I've used automated scripts before #
#such as Autorecon and nmapAutomater. But in my opinion, there wasto much "unnessessary" output for my# 
#learning style. I also wanted to understand how they were built and what it was they were doing so I #
#could further progress in my learning. So, I created this smaller and quicker program.               #
#                                                                          xPrimalVictor7x            #
#######################################################################################################


#######################################################################################################
########################################### Colors ####################################################
#######################################################################################################

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
# Usage: echo "I ${RED}love${NC} ${GREEN}to use${NC} ${CYAN}color in my${NC} ${CYAN}scripts!${NC}"

#######################################################################################################
######################################## Functions ####################################################
#######################################################################################################

function space() {
    echo ""
}

function break() {
	echo ""
    echo -e "${BLUE}###################################################################################${NC}"
	echo ""
}

#######################################################################################################
#######################################################################################################
########################################### Script ####################################################
#######################################################################################################
#######################################################################################################

if [ $1 ];then
	space
	echo -e "${CYAN}[*] Starting Recon on $2 at $1...${NC}"
	IP=$1
	Name=$2
	mkdir $Name
	cd $Name
else
	space
	echo -e "${CYAN}The OSCP Enumeration Tool will conduct specific nmap scans on any specified target.${NC}"
	echo -e "${CYAN}This tool was created with the intent to be the first Enumeration scan against a target.${NC}"
	echo -e "${CYAN}The output will not all display on screen but will be in the Host Name Directory that is created upon execution.${NC}"
	space
	echo -e "${CYAN}Usage: ./OSCPEnum.sh <IP> <Host Name>${NC}"
	space
	exit 0
fi

# Quick TCP Scan
space
echo -e "${GREEN}Conducting a Quick TCP Scan to get started.${NC}"
space
nmap -Pn $IP | tee QuickTCP.txt
space
echo -e "${CYAN}[+] Quick TCP Recon on $Name Done!! Don't forget: ENUMERATE EVERYTHING!!${NC}"

break

# Initial Scan, More thorough than quick scan
echo -e "${GREEN}Conducting an Initial Scan on $Name.${NC}"
space
nmap -sS -sC -sV -O -T4 -Pn -T4 $IP > Initial.txt
echo -e "${CYAN}[+] Initial Recon on $Name Complete!!${NC}!"

break

# In depth website crawler
echo -e "${GREEN}Conducting a Web Crawl on port 80 and 443 for $Name.${NC}"
space
nmap --script http-enum.nse,dns-brute.nse -Pn $IP > http.txt
echo -e "${CYAN}[+] Website Recon on $Name Complete!!${NC}!"

break

# All out exploits/vulnerabilities scan
echo -e "${GREEN}Do you want to scan for Exploits against $Name? (This will most certainly take awhile)${NC}"
read ans 
	if [ "$ans" = "yes" ] || [ "$ans" = "YES" ] || [ "$ans" = "y" ] || [ "$ans" = "Y" ] || [ "$ans" = "Yes" ]
	then
    space
	echo -e "${CYAN}Scanning $Name for exploits...${NC}" 
    nmap -p- --script=vuln,exploit -T4 -sC -Pn $IP > Goodies.txt
	echo -e "${CYAN}[+] Exploits scan for $Name is finally complete!!!${NC}!"
	else
	echo "Lets move on"
fi

break

# The Big ONE; scans all the things
echo -e "${GREEN}Do you want to run a Big Nmap Scan? (May take awhile)${NC}"
read ans
	if [ "$ans" = "yes" ] || [ "$ans" = "YES" ] || [ "$ans" = "y" ] || [ "$ans" = "Y" ] || [ "$ans" = "Yes" ]
	then
	space
	echo -e "${CYAN}Conducting a Big Scan on $Name... This may take awhile.${NC}" 
    nmap -sS -sC -sV -O -A -r -T4 -p- -Pn $IP > BigScan.txt
	echo -e "${CYAN}[+] Big Recon scan on $IP is complete${NC}!"
	else
	echo "Lets move on"
fi

break

# Gives the user an options to continue with other scans
echo -e ${GREEN}"Initial Scripts are done; do you wish to continue with other Scans/Scripts?"${NC}
space
read resp
    if [[ $resp = Y ]] || [[ $resp = Yes ]] || [[ $resp = YES ]] || [[ $resp = yes ]] || [[ $resp = y ]]
	then 
    space
	echo -e ${CYAN}"Okay, lets continue then!"${NC}
	else
    space
	echo -e ${CYAN}"Okay, goodbye!"${NC}
    space
    echo -e ${CYAN}"End of OSCP Enumeration Script; thanks for using!"${NC}
    space
	exit
fi

#######################################################################################################
#######################################################################################################
########################################### Extras ####################################################
#######################################################################################################
#######################################################################################################

break

# SMB scan
echo -e "${GREEN}Do you want to run an SMB Scan on $Name? (May take awhile)${NC}"
read ans  
	if [ "$ans" = "yes" ] || [ "$ans" = "YES" ] || [ "$ans" = "y" ] || [ "$ans" = "Y" ] || [ "$ans" = "Yes" ]
	then
	space
	echo -e "${CYAN}Conducting UDP Scan for $Name at $IP...${NC}" 
    nmap -p 445 -vv -Pn --script=smb-os-discovery,smb-vuln-cve2009-3103.nse,smb-vuln-ms06-025.nse,smb-vuln-ms07-029.nse,smb-vuln-ms08-067.nse,smb-vuln-ms10-054.nse,smb-vuln-ms10-061.nse,smb-vuln-ms17-010.nse $Ip > SMB.txt
	echo -e "${CYAN}[+] SMB Recon Scan for $Name is complete${NC}!"
	else
	space
	echo "Lets move on"
fi

break

echo -e "${GREEN}Do you want to run an FTP Scan against $Name? (May take awhile)${NC}"
read ans
	if [ "$ans" = "yes" ] || [ "$ans" = "YES" ] || [ "$ans" = "y" ] || [ "$ans" = "Y" ] || [ "$ans" = "Yes" ]
	then
	space
	echo -e "${CYAN}Conducting and FTP scan on $Name...${NC}" 
	nmap --script ftp* -p21 $IP > ftp.txt
	echo -e "${CYAN}[+] FTP Scan for $Name is complete${NC}!"
	else
	echo "Lets Move on"
fi

break

echo -e "${GREEN}Do you want to run all Website Scripts against $Name? (Dirb, Gobuster and Nikto)${NC}"
read ans
	if [ "$ans" = "yes" ] || [ "$ans" = "YES" ] || [ "$ans" = "y" ] || [ "$ans" = "Y" ] || [ "$ans" = "Yes" ]
	then
	space
	echo -e "${CYAN}Conducting dirb scan on $Name...${NC}" 
	dirb http://$IP/
	echo -e "${CYAN}[+] Dirb scan on $Name is complete${NC}!"
	break

	else
    space
	echo -e ${CYAN}"Okay, goodbye!"${NC}
    space
    echo -e ${CYAN}"End of OSCP Enumeration Script; thanks for using!"${NC}
    space
	exit
fi
exit