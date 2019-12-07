#!/bin/bash

. scripts/functions.sh

echo "ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfXyAgICAgICAgICAgLl9fICAgCl9fX19fX19fX19fX18gICBfX19fIF9fX19fXyB8ICB8IF9fX19fX18gIHwgIHwgIApcX19fXyBcXyAgX18gXF8vIF9fIFxcX19fXyBcfCAgfC8gL1xfXyAgXCB8ICB8ICAKfCAgfF8+ID4gIHwgXC9cICBfX18vfCAgfF8+ID4gICAgPCAgLyBfXyBcfCAgfF9fCnwgICBfXy98X198ICAgIFxfX18gID4gICBfXy98X198XyBcKF9fX18gIC9fX19fLwp8X198ICAgICAgICAgICAgICAgXC98X198ICAgICAgICBcLyAgICAgXC8gc2luY2UgMjAxOQo=" | base64 -d
echo ""
echo ""

help="Prepare a new Kali VM with some missing tools\nValid options:\n\tall\t\t--\tInstall all\n\ttools\t\t--\tInstall main tools\n\tbackdoors\t--\tDownload some backdoors\n\tprivesc\t\t--\tDownload privesc tools\n\twordlists\t--\tDownload some wordlists\n\tforensics\t--\tDownload some forensics tools\n\tps1\t\t--\tDownload a new PS1\n\n$0 all"

if [[ $EUID -ne 0 ]]; then
   echo -e "\e[31mThis script must be run as root\e[0m" 1>&2
   exit 1
fi

if [ "$#" -ne 1 ]; then
    echo -e "$help"
    exit 1
fi


chmod +x scripts/install_tools.sh
chmod +x scripts/backdoors_down.sh
chmod +x scripts/privesc_down.sh
chmod +x scripts/wordlists_down.sh
chmod +x scripts/forensic_down.sh
chmod +x scripts/ps1_down.sh

if [ $1 == "all" ]; then
    write_super_main "Good choice. Starting installing all the tools..."
    scripts/install_tools.sh
    scripts/backdoors_down.sh
    scripts/privesc_down.sh
    scripts/wordlists_down.sh
    scripts/forensic_down.sh
    scripts/ps1_down.sh

elif [ $1 == "tools" ]; then
    write_super_main "Good choice. Starting installing only the main tools..."
    scripts/install_tools.sh

elif [ $1 == "backdoors" ]; then
    write_super_main "Good choice. Starting installing only the backdoors..."
    scripts/backdoors_down.sh

elif [ $1 == "privesc" ]; then
    write_super_main "Good choice. Starting installing only the privesc tools..."
    scripts/privesc_down.sh

elif [ $1 == "wordlists" ]; then
    write_super_main "Good choice. Starting installing only the wordlists tools..."
    scripts/wordlists_down.sh

elif [ $1 == "forensics" ]; then
    write_super_main "Good choice. Starting installing only the forensics tools..."
    scripts/forensic_down.sh

elif [ $1 == "ps1" ]; then
    write_super_main "Good choice. Downloading PS1..."
    scripts/ps1_down.sh

else
    echo -e "$help"
    exit 1
fi

echo ""
write_super_main "All done. Bye!"
