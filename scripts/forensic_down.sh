#!/bin/bash

. scripts/functions.sh

write_main "Start installing some forensic tools"

write_main "Installing yara"
apt-get install -y yara

write_main "Installing clamAV"
apt-get install -y clamav

write_main "Installing suricata"
apt-get install suricata
apt-get install oinkmaster
echo "url = http://rules.emergingthreats.net/open/suricata/emerging.rules.tar.gz" >> /etc/oinkmaster.conf
oinkmaster -C /etc/oinkmaster.conf -o /etc/suricata/rules