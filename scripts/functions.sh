#!/bin/bash

Y='\033[1;33m'
B='\033[0;34m'
G='\033[0;32m'
P='\033[1;35m'
NC='\033[0m'

function write_super_main(){
    printf "${P}$1${NC}\n"
    echo ""
}

function write_main(){
    printf "${G}[*]${Y} $1${NC}\n"
}

function write_download(){
    printf "${B}[+]${Y} Downloading $1${NC}\n"
}

function download_git(){
    URL=$1
    FOLDER=$2
    back=`pwd`
    cd $FOLDER
    write_download $URL
    git clone $URL
    cd $back
}

function direct_download(){
    URL=$1
    FOLDER=$2
    back=`pwd`
    cd $FOLDER
    write_download $URL
    wget $URL
    unzip *.zip 2>/dev/null
    rm -rf *.zip 2>/dev/null
    cd $back
}