#!/bin/bash

. scripts/functions.sh

write_main "Downloading a new PS1"

curl https://gist.githubusercontent.com/carlospolop/43f7cd50f3deea972439af3222b68808/raw/d3a62d61e5feb6a61426d67ed9b75c85d75f84b5/ps1.bash >> /etc/bash.bashrc
