#!/bin/sh
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
for f in $(pwd)/Source/* ; do sudo cp -R "${f}" $(pwd)/Products/Spotify.app/Contents/Resources/Apps/; done
#echo -e "${Cyan}Built Spotify.app with new code.${Color_Off}"
