#!/bin/bash

function space() {
    echo ""
}
function break() {
	echo ""
    echo -e "${RED}#################################################${NC}"
	echo ""
}

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
# echo -e "I ${RED}love${NC} ${GREEN}Stack Overflow${NC}"
# space
# echo -e "${BLUE}Hello Everyone, Did this Work Properly?${NC}"
# space
# echo -e "${CYAN}Hello Everyone, How about this one?${NC}"
# break
# echo -e "I ${RED}love${NC} ${GREEN}to use${NC} ${CYAN}color in my${NC} ${BLUE}scripts!${NC}"

# break
# echo "Do you want to scan for Exploits against $Name? (This will most certainly take awhile)"
# read ans 
# 	if [ "$ans" = "yes" ] || [ "$ans" = "YES" ] || [ "$ans" = "y" ] || [ "$ans" = "Y" ]
# 	then
#     break
# 	echo -e "${CYAN}Scanning $Name for exploits...${NC}" 
#     nmap -p 445 -vv -Pn --script=smb-nmap --script=vuln,exploit -T4 -F -sC -Pn $IP > Goodies.txt
# 	echo -e "${CYAN}[+] Exploits scan for $Name is finally complete!!!${NC}!"
# 	else
# 	echo "Moving on"
# fi

# echo " This is what will happen next "

break
echo "Initial Scripts are done; do you wish to continue with other Scans/Scripts?"
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

echo "next steps"