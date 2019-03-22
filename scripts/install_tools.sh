#!/bin/bash

. scripts/functions.sh

write_main "Updating..."
apt-get update
apt-get upgrade -y

write_main "Installing getsploit"
pip install getsploit

write_main "Installing dirb"
apt-get install dirb

write_main "Installing ltrace and strace"
apt-get install ltrace strace

write_main "Installing Snipper"
git clone https://github.com/1N3/Sn1per.git sniper
chmod +x sniper/install.sh
echo "Y" | ./sniper/install.sh

write_main "Installing Code"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list
apt update && apt install code

write_main "Installing terminator"
apt install terminator

write_main "Installing UDP-Proto-Scanner"
git clone https://github.com/portcullislabs/udp-proto-scanner.git udp-proto-scanner
cp udp-proto-scanner/udp-proto-scanner.pl udp-proto-scanner/udp-proto-scanner.conf /usr/local/bin

write_main "Installing libreoffice"
apt-get install libreoffice

write_main "Installing ftp"
apt-get install ftp

write_main "Installing pyftplib"
apt-get install python-pyftpdlib

write_main "Installing ptftpd"
pip install ptftpd

write_main "Installing snmp-mibs-downloader"
apt-get install snmp-mibs-downloader
sed -i 's/mibs :/#mibs :/g' /etc/snmp/snmp.conf

write_main "Installing dirhunt"
pip3 install dirhunt
