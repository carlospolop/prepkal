#!/bin/bash

. scripts/functions.sh

write_main "Updating..."
apt-get update
apt-get upgrade -y

write_main "Installing getsploit"
pip install getsploit

write_main "Installing dirb"
apt-get install dirb -y

write_main "Installing ltrace and strace"
apt-get install ltrace strace -y

write_main "Installing Snipper"
git clone https://github.com/1N3/Sn1per.git sniper
chmod +x sniper/install.sh
echo "Y" | ./sniper/install.sh

write_main "Installing Code"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list
apt update && apt install code -y

write_main "Installing terminator"
apt install terminator -y

write_main "Installing libreoffice"
apt-get install libreoffice -y

write_main "Installing ftp"
apt-get install ftp -y

write_main "Installing powershell"
apt-get install -y powershell

write_main "Installing mingw-w64"
apt-get -y install mingw-w64

write_main "Installing 7z2john.pl"
wget https://raw.githubusercontent.com/magnumripper/JohnTheRipper/bleeding-jumbo/run/7z2john.pl -P /usr/bin
chmod +x /usr/bin/7z2john.pl

write_main "Installing pyftplib"
apt-get install python-pyftpdlib -y

write_main "Installing ptftpd"
pip install ptftpd

write_main "Installing peda"
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit

write_main "Enabling postgresql"
systemctl enable postgresql

write_main "Intalling mingw-w64"
apt-get install mingw-w64 -y

write_main "Installing Docker"
#https://medium.com/@airman604/installing-docker-in-kali-linux-2017-1-fbaa4d1447fe
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get remove docker docker-engine docker.io -y
apt-get install docker-ce -y

write_main "Installing oracle dependencies for patator"
pip3 install cx_Oracle --upgrade

write_main "Installing grc"
apt-get install -y grc

write_main "Installing rlwrap"
apt-get install -y rlwrap

write_main "Installing gdbserver"
apt-get install -y gdbserver

write_main "Installing libcompress-raw for 7z2john-pl"
apt-get install libcompress-raw-lzma-perl -y

#Here are the dependencies for Legion
write_main "Installing odat"
git clone https://github.com/quentinhardy/odat.git odat
ln -s "$(pwd)/odat/odat.py" /usr/bin/odat.py

write_main "Installing ikeforce"
git clone https://github.com/SpiderLabs/ikeforce.git ikeforce
ln -s "$(pwd)/ikeforce/ikeforce.py" /usr/bin/ikeforce
pip2 install pyip pycrypto pyopenssl || pip install pyip pycrypto pyopenssl 

write_main "Installing rpcbind"
apt-get install -y rpcbind

write_main "Installing evil-winrm"
gem install evil-winrm

write_main "Installing UDP-Proto-Scanner"
git clone https://github.com/portcullislabs/udp-proto-scanner.git udp-proto-scanner
cp udp-proto-scanner/udp-proto-scanner.pl udp-proto-scanner/udp-proto-scanner.conf /usr/local/bin

write_main "Installing snmp-mibs-downloader"
apt-get install snmp-mibs-downloader -y
sed -i 's/mibs :/#mibs :/g' /etc/snmp/snmp.conf

write_main "Creating symlink of /usr/share/doc/python-impacket/examples/samrdump.py"
ln -s /usr/share/doc/python-impacket/examples/samrdump.py /usr/bin/samrdump.py

write_main "Creating symlink of /usr/share/doc/python-impacket/examples/rpcdump.py"
ln -s /usr/share/doc/python-impacket/examples/rpcdump.py /usr/bin/rpcdump.py

write_main "Installing dirhunt"
pip3 install dirhunt
