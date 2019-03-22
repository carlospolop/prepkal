#!/bin/bash

. scripts/functions.sh

rootDir=/usr/share/wordlists/external

rm -rf $rootDir

write_main "Creating $rootDir"
mkdir $rootDir

wordlists_git=(
    "https://github.com/danielmiessler/SecLists.git"
    "https://github.com/berzerk0/Probable-Wordlists.git"
    "https://github.com/swisskyrepo/PayloadsAllTheThings.git"
    "https://github.com/1N3/BruteX.git"
)

for u in "${wordlists_git[@]}"; do download_git $u $rootDir; done

