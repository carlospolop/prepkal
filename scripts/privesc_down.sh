#!/bin/bash

. scripts/functions.sh

rootDir=/opt/privesc
linuxDir=$rootDir/linux
winDir=$rootDir/windows

rm -rf $rootDir

write_main "Creating $rootDir"
mkdir $rootDir
write_main "Creating $linuxDir"
mkdir $linuxDir
write_main "Creating $winDir"
mkdir $winDir


### LINUX
echo ""
write_main "Starting download of Scripts for Linux/Unix Privesc"
linux_privesc=(
    "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh"
    "https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh"
    "http://pentestmonkey.net/tools/unix-privesc-check/unix-privesc-check-1.4.tar.gz"
    "http://www.securitysift.com/download/linuxprivchecker.py"
    "https://github.com/AlessandroZ/BeRoot/archive/master.zip"
)
linux_git_prives=(
    "https://github.com/carlospolop/linPE.git"
    "https://github.com/spencerdodd/kernelpop.git"
    "https://github.com/jondonas/linux-exploit-suggester-2.git"
)

for link in "${linux_privesc[@]}"; do direct_download $link $linuxDir; done
for link in "${linux_privesc[@]}"; do download_git $link $linuxDir; done

write_main "Decompressing tar files..."
cd $linuxDir
tar xvzf *.tar.gz
rm -f *.tar.gz


### WINDOWS
echo ""
write_main "Starting download Windows Privesc"

windows_ps_folder="$winDir/powershell"
mkdir $windows_ps_folder
windows_git_ps=(
    "https://github.com/PowerShellMafia/PowerSploit.git --branch dev"
    "https://github.com/411Hall/JAWS.git"
    "https://github.com/Arvanaghi/SessionGopher.git"
    "https://github.com/peewpw/Invoke-WCMDump.git"
    "https://github.com/dafthack/DomainPasswordSpray.git"
    "https://github.com/Kevin-Robertson/Inveigh.git"
    "https://github.com/rasta-mouse/Sherlock.git"
)
for u in "${windows_git_ps[@]}"; do download_git $u $windows_ps_folder; done


windows_exe_folder="$winDir/exe"
mkdir $windows_exe_folder
windows_exe=(
    "https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.2/lazagne.exe"
    "https://github.com/AlessandroZ/BeRoot/releases/download/1.0.1/beRoot.zip"
    "https://github.com/pentestmonkey/windows-privesc-check/raw/master/windows-privesc-check2.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/accesschk/accesschk-2003-xp.exe"
    "https://github.com/ohpe/juicy-potato/releases/download/v0.1/JuicyPotato.exe"
)
windows_exe_git=(
    "https://github.com/ohpe/juicy-potato.git"
)
for u in "${windows_exe[@]}"; do direct_download $u $windows_exe_folder; done
for u in "${windows_exe_git[@]}"; do download_git $u $windows_exe_folder; done


windows_watson="$windows_exe_folder/watson"
mkdir $windows_watson
windows_exe_watson=(
    "https://github.com/carlospolop/winPE/raw/master/binaries/watson/WatsonNet3.5AnyCPU.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/watson/WatsonNet3.5x64.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/watson/WatsonNet3.5x86.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/watson/WatsonNet3AnyCPU.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/watson/WatsonNet3x64.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/watson/WatsonNet3x86.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/watson/WatsonNet4AnyCPU.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/watson/WatsonNet4x64.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/watson/WatsonNet4x86.exe"
)
for u in "${windows_exe_watson[@]}"; do direct_download $u $windows_watson; done


windows_seatbelt="$windows_exe_folder/seatbelt"
mkdir $windows_seatbelt
windows_exe_seatbelt=(
    "https://github.com/carlospolop/winPE/raw/master/binaries/seatbelt/SeatbeltNet3.5AnyCPU.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/seatbelt/SeatbeltNet3.5x64.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/seatbelt/SeatbeltNet3.5x86.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/seatbelt/SeatbeltNet4AnyCPU.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/seatbelt/SeatbeltNet4x64.exe"
    "https://github.com/carlospolop/winPE/raw/master/binaries/seatbelt/SeatbeltNet4x86.exe"
)
for u in "${windows_exe_seatbelt[@]}"; do direct_download $u $windows_seatbelt; done


windows_local_folder="$winDir/local"
mkdir $windows_local_folder
windows_local=(
    "https://github.com/GDSSecurity/Windows-Exploit-Suggester.git"
    "https://github.com/bitsadmin/wesng.git"
)
for u in "${windows_local[@]}"; do download_git $u $windows_local_folder; done


pip install xlrd --upgrade #Needed for Windows-Exploit-Suggester
