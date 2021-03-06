#!/bin/sh
# Reset
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
cd "`dirname "$0"`"
if [ ! -d Products/Spotify.app ]; then
  mkdir $(pwd)/Products
  echo -e "${Cyan}Downloading Spotify.app Binary...${Color_Off}"
  curl -O https://download.spotify.com/Spotify.dmg
  hdiutil mount Spotify.dmg &> /dev/null
  sudo cp -R "/Volumes/Spotify/Spotify.app" $(pwd)/Products
  sudo chmod -R 755 $(pwd)/Products/Spotify.app
  for f in $(pwd)/Source/* ; do sudo cp -R "${f}" $(pwd)/Products/Spotify.app/Contents/Resources/Apps/; done
  for f in $(pwd)/Products/Spotify.app/Contents/Resources/Apps/*.spa ; do rm -rf $(pwd)/Products/Spotify.app/Contents/Resources/Apps/${f##*/} &> /dev/null; done
  echo -e "${Cyan}Installed Spotify.app Binary to${Color_Off} ${Green}$(pwd)/Products/Spotify.app${Color_Off}"
  echo -e "${Cyan}Spotify.app source code is at${Color_Off} ${Green}$(pwd)/Source${Color_Off}"
  hdiutil detach Spotify.dmg -force &> /dev/null
  hdiutil unmount Spotify.dmg -force
  rm -rf $(pwd)/Spotify.dmg &> /dev/null
fi
