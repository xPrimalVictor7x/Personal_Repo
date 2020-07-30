#!/bin/bash

#######################################################################################################
#This script was made with multiple intentions such as learning Bash, creating my first script, making#
#a script for the OSCP, and making a script to transpose into Python. This script took about x days to#
#create and goes to show that when you try harder, it truly shows. I've used automated scripts before #
#such as Autorecon and nmapAutomater. But in my opinion, there was much "unnessessary" output for my  # 
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
	echo 
    echo -e "${GREEN}###################################################################################${NC}"
	echo 
}

#######################################################################################################
#######################################################################################################
########################################### Script ####################################################
#######################################################################################################
#######################################################################################################

if [ "$1" == "-h" ] || [ $# -eq 0 ] || [ "$1" == "-H" ] ; then
 	echo
  	echo -e "${CYAN}This is an Enumeration Tool that will conduct a variety of different scans on a specified target.${NC}"
  	echo -e "${CYAN}This tool was created with the intent to be the first Enumeration scan against a Target.${NC}"
  	echo -e "${CYAN}The output will not all display on screen but will be in the Host Name Directory that is created upon execution of the script.${NC}"
  	echo
  	echo -e "${CYAN}Usage: ./OSCPEnum.sh <IP> <Host Name>${NC}"
	echo
  	exit 0
fi

#######################################################################################################
######################################## Variables ####################################################
#######################################################################################################

if [ $1 ];then
	echo
	echo -e "${CYAN}[+] Starting Recon on $2 at $1... Don't forget: ENUMERATE EVERYTHING!!${NC}"
	IP=$1
	Name=$2
	dir_name=$Name
	mkdir $dir_name
	cd $dir_name/
	touch $IP
	touch services.txt 
fi

#######################################################################################################
########################################## Iniital Scans ##############################################
#######################################################################################################

# Quick TCP Scan
echo
nmap -Pn $IP -oX nmap_xml.txt | tee nmap_initial.txt
ports=$(cat nmap_xml.txt | grep portid | grep protocol=\"tcp\" | cut -d'"' -f4 | paste -sd ",") # Gets the open Ports from the nmap_xml.txt
echo
echo -e "${CYAN}[+] Quick Scan Complete!!! $Name has these ports open: $ports${NC}"
echo
nmap -sC -sV -O -T4 -Pn -T4 -A -p$ports $IP | tee nmap_deepscan.txt
echo
echo -e "${CYAN}[+] Deeper Scan on $Name Complete!!${NC}" 
echo
nmap $IP --script=vulners.nse,*vuln* -T4 | tee nmap_scripts_vulners.txt 
echo
echo -e "${CYAN}[+] Conducted a Vulnerability Scan on $Name!!${NC}" 

#######################################################################################################
##################################### Focused Enumeration #############################################
#######################################################################################################

break

for singleport in $(echo $ports | sed "s/,/ /g"); do #creates the variable of "singleport"
echo
if [ $singleport -eq 21 ];then
	echo -e "${CYAN}FTP was Detected conducting Further Enumeration on $singleport.${NC}"
		echo
		nmap -p$singleport -Pn -sV -T4 --script=ftp-anon.nse,ftp-libopie.nse,ftp-proftpd-backdoor.nse,ftp-syst.nse,ftp-vsftpd-backdoor.nse,ftp-vuln-cve2010-4221.nse,tftp-enum.nse $IP | tee nmap_scripts_ftp.txt
fi
echo
if [ $singleport -eq 22 ]; then
	echo -e "${CYAN}Port 22 was Detected, Conducting Further Enumeration on SSH.${NC}"
    	echo
		nmap -p$singleport -sV -A -Pn -T4 --script=ssh-auth-methods.nse,ssh-hostkey.nse,ssh-publickey-acceptance.nse $IP | tee nmap_scripts_ssh.txt
fi
echo
if [ $singleport -eq 80 ] || [ $singleport -eq 8080 ]; then
	echo -e "${CYAN}A Web Server was found on $Name, Running a Few Tools on port $singleport. This may take awhile, but input will be shown on screen.${NC}"
	echo
	echo -e "${CYAN}Conducting a CURL extration on $Name${NC}"
		echo
		curl -i http://$IP/$singleport | tee web_curl.txt
	echo
	echo -e "${CYAN}Conducting a Directory Search on $Name${NC}"
		echo
		python3 /opt/Web_Servers/dirsearch/dirsearch.py -u $IP -e php,html,js | tee web_dirsearch.txt
	echo
	echo -e "${CYAN}Conducting a Nikto Scan on $Name${NC}"
		echo
		nikto -C all -maxtime 180 -t 5 -h http://$IP:$singleport | tee web_nikto.txt
	echo
	echo -e "${CYAN}Complete with Web Server Enumeration${NC}"
fi
echo
if [ $singleport -eq 139 ]; then
	echo "SMB or NetBIOS was Detected, Conducting Further Enumeration"
	nmap -Pn -p$singleport -vv --script=smb-os-discovery,smb-vuln-cve2009-3103.nse,smb-vuln-ms06-025.nse,smb-vuln-ms07-029.nse,smb-vuln-ms08-067.nse,smb-vuln-ms10-054.nse,smb-vuln-ms10-061.nse,smb-vuln-ms17-010.nse,smb-vuln-cve2009-3103.nse,smb-vuln-regsvc-dos.nse,smb-enum-shares.nse,smb-enum-users.nse $IP -T4 | tee nmap_scripts_smb.txt
	enum4linux -a $IP | tee smb_enum4linux.txt
	nmblookup -A $IP | tee smb_nmblookup.txt
fi
echo
if [ $singleport -eq 3306 ];then
	echo "${CYAN}Enumerating MYSQL on $Name.${NC}"
	nmap -Pn -p$singleport --script=mysql-* $IP -T4 | tee nmap_scripts_mysql.txt
fi

#######################################################################################################
########################################## Deeper Scans ###############################################
#######################################################################################################

break

# # The Big ONE; scans all the things
# echo -e "${GREEN}Do you want to run a Big Nmap Scan? (May take awhile)${NC}"
# read ans
# 	if [ "$ans" = "yes" ] || [ "$ans" = "YES" ] || [ "$ans" = "y" ] || [ "$ans" = "Y" ] || [ "$ans" = "Yes" ]
# 	then
# 	space
# 	echo -e "${CYAN}Conducting a Big Scan on $Name... This may take awhile.${NC}" 
#     nmap -sS -sC -sV -O -A -r -T4 -p- -Pn $IP > BigScan.txt
# 	echo -e "${CYAN}[+] Big Recon scan on $IP is complete${NC}!"
# 	else
# 	echo -e "${CYAN}Okay, Lets Move On!${NC}"
# fi

# break

# Gives the user an options to continue with other scans
# echo -e ${GREEN}"Initial Scripts are done; do you wish to continue with other Scans/Scripts?"${NC}
# space
# read resp
#     if [[ $resp = Y ]] || [[ $resp = Yes ]] || [[ $resp = YES ]] || [[ $resp = yes ]] || [[ $resp = y ]]
# 	then 
#     space
# 	echo -e "${CYAN}Okay, Lets Move On!${NC}"
# 	else

rm nmap_xml.txt
echo -e ${CYAN}"End of OSCP Enumeration Script; thanks for using!"${NC}
echo
# fi

done
