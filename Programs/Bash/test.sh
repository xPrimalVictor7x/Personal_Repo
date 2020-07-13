#!/usr/bin/env bash

function change() {
    cd /opt/
}

function print() {
    pwd
}

function whole() {
    echo "Do you want to restart the system?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) reboot; break;;
        No ) echo "Thank you";;
    esac
done
}

#Download Preqs
apt install python3 
apt install python3-pip  
apt-get install python-elixir 
apt-get install ldap-utils rwho rsh-client x11-apps finger
apt install seclists curl enum4linux gobuster nbtscan nikto nmap onesixtyone oscanner smbclient smbmap smtp-user-enum snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf
apt-get install terminator neofetch 
apt install gnome-tweaks
apt install tor 
apt install software-center

#Making all the neccessary folders
cd /root/
mkdir PWK-OSCP Git
cd PWK-OSCP 
mkdir exam-report  lab-report  oscp-notes  oscp-scripts  oscp-work  Seclists  vpn
change
mkdir Recon Exploitation PostExploitation Scanning 

#Download all GitHub Repos and Shit
git clone https://github.com/Dionach/CMSmap.git /opt/CMSmap
git clone https://github.com/ChrisTruncer/EyeWitness-Ruby.git /opt/EyeWitness
git clone https://github.com/sqlmapproject/sqlmap.git /opt/SQLmap 
git clone https://github.com/lanmaster53/recon-ng.git /opt/Recon-ng
git clone https://github.com/SpiderLabs/Responder.git /opt/Responder 
git clone https://github.com/secretsquirrel/the-backdoor-factory.git /opt/T-B-F
git clone https://github.com/cheetz/Easy-P.git /opt/EasyP
git clone https://github.com/cheetz/Password_Plus_One /opt/Password_Plus_One
git clone https://github.com/cheetz/PowerShell_Popup /opt/PowerShell_Popup
git clone https://github.com/cheetz/icmpshock /opt/icmpshock
git clone https://github.com/cheetz/brutescrape /opt/Brutescrape
git clone https://github.com/cheetz/PowerSploit /opt/HP_PowerSploit
git clone https://github.com/cheetz/PowerTools /opt/HP_PowerTools
git clone https://github.com/samratashok/nishang /opt/Nishang
git clone https://github.com/secforce/sparta.git /opt/SPARTA
git clone https://github.com/mzet-/linux-exploit-suggester.git /opt/LinuxExploitSuggester
git clone https://github.com/tcstool/NoSQLMap.git /opt/NoSQLMap
git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists
git clone https://github.com/rebootuser/LinEnum.git /opt/LinEnum
git clone https://github.com/DanMcInerney/net-creds.git /opt/Net-Creds
git clone https://github.com/derv82/wifite /opt/Wifite 
git clone https://github.com/sophron/wifiphisher.git /opt/WifiPhisher
git clone https://github.com/maurosoria/dirsearch.git /opt/dirsearch
git clone https://github.com/SolomonSklash/htbenum.git /opt/htbenum
wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-14.0.0-6661328.x86_64.bundle

cd /opt/the-backdoor-factory && ./install.sh
change

apt-get install git gcc make libpcap-dev -Y && apt-get autoremove
git clone https://github.com/robertdavidgraham/masscan /opt/Masscan
cd /opt/masscan
make
change

git clone https://github.com/wpscanteam/wpscan.git /opt/WPScan
cd /opt/wpscan && ./wpscan.rb --update
change

git clone https://github.com/leebaird/discover.git /opt/Discover
cd /opt/Discover && ./setup.sh
change

git clone https://github.com/beefproject/beef.git /opt/BEeF
cd /opt/BEeF && ./install
change

git clone git clone https://github.com/maurosoria/dirsearch.git /opt/Dirsearch
cd /opt/Dirsearch && chmod +x dirsearch.py 
change

git clone https://github.com/21y4d/nmapAutomator.git /opt/nmapAutomator

git clone https://github.com/Tib3rius/AutoRecon.git /opt/AutoRecon
cd /opt/AutoRecon
python3 -m pip install -r requirements.txt
change

wget www.ampliasecurity.com/research/wce_v1_4beta_universal.zip
mkdir /opt/WCE && unzip wce_v1* -d /opt/WCE && rm wce_v1*.zip
change

wget http://blog.gentilkiwi.com/downloads/mimikatz_trunk.zip 
unzip -d ./mimikatz mimikatz_trunk.zip
rm mimikatz_trunk.zip
change

git clone https://github.com/xapax/oscp.git /opt/Reconscript
cd /opt/Reconscript
./setup.sh

git clone https://github.com/mattifestation/PowerSploit.git /opt/PowerSploit
cd /opt/PowerSploit && wget https://raw.githubusercontent.com/obscuresec/random/master/StartListener.py && wget https://raw.githubusercontent.com/darkoperator/powershell_scripts/master/ps_encoder.py

git clone https://github.com/Veil-Framework/Veil /opt/Veil
cd /opt/Veil/ && ./Install.sh -c
change

https://github.com/SecureAuthCorp/impacket.git /opt/1mpac3et
cd /opt/impacket
pip install
change

mv Brutescrape/ CMSmap/ Discover/ EyeWitness/ SPARTA/ WPScan/ Reconscript/ Recon/
mv AutoRecon/ Masscan /nmapAutomator/ Recon-ng/ SecLists/ dirsearch/ htbenum/ Scanning/
mv Dirsearch/ CMSmap/ NoSQLMap/ icmpshock/ EasyP/ LinuxExploitSuggester/ SQLmap/ HP_PowerSploit/ BEeF/ LinEnum/ Responder/ HP_PowerTools/ PowerShell_Popup/ Password_Plus_One/ Exploitation/ 
mv mimikatz/ Net-Creds/ Nishang/ PowerSploit/ T-B-F/ Veil/ wce/ WifiPhisher/ Wifite/ PostExploitation/

# Installing Firefox Add-ons
# Web Developer Add-on: https://addons.mozilla.org/en-US/firefox/addon/web-developer/
# Tamper Data: https://addons.mozilla.org/en-US/firefox/addon/tamper-data/
# Foxy Proxy: https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/
# User Agent Switcher: https://addons.mozilla.org/en-US/firefox/addon/user-agent-switcher


echo Primal > /etc/hostname

echo "deb http://http.kali.org/kali kali-last-snapshot main non-free contrib
deb http://http.kali.org/kali kali-rolling main non-free contrib
deb-src http://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list 

# THIS IS WHAT WAS IN KALIS /ETC/APT/SOURCES.LIST IN CASE ANYTHING GOES WRONG!
# deb http://http.kali.org/kali kali-rolling main non-free contrib
# deb cdrom:[Debian GNU/Linux 2019.2 _Kali-rolling_ - Official Snapshot amd64 LIVE/INSTALL Binary 20190508-08:43]/ kali-last-snapshot contrib main non-free
# deb cdrom:[Debian GNU/Linux 2019.2 _Kali-rolling_ - Official Snapshot amd64 LIVE/INSTALL Binary 20190508-08:43]/ kali-last-snapshot contrib main non-free
# This system was installed using small removable media
# (e.g. netinst, live or single CD). The matching "deb cdrom"
# entries were disabled at the end of the installation process.
# For information about how to configure apt package sources,
# see the sources.list(5) manual.

whole

#Extra set ups
apt-get update  
apt-get upgrade 
apt-get dist-upgrade 
apt-get clean
apt update
apt upgrade 
apt dist-upgrade 
apt clean
apt-get autoremove
apt autoremove