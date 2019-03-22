#!/bin/bash

. scripts/functions.sh

rootDir=/opt/backdoors
phpDir=$rootDir/php

rm -rf $rootDir

write_main "Creating $rootDir"
mkdir $rootDir

back_git_tools=(
    "https://github.com/EmpireProject/Empire.git"
    "https://github.com/trustedsec/unicorn.git"
    "https://github.com/n1nj4sec/pupy.git"
    "https://github.com/samratashok/nishang.git"
    "https://github.com/Ne0nd0g/merlin.git"
    "https://github.com/Hackplayers/Salsa-tools.git"
    "https://github.com/inquisb/icmpsh"
)
back_tools=(
    "https://eternallybored.org/misc/netcat/netcat-win32-1.11.zip"
)

for u in "${back_git_tools[@]}"; do download_git $u $rootDir; done
for u in "${back_tools[@]}"; do direct_download $u $rootDir; done
