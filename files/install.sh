#!/data/data/com.termux/files/usr/bin/bash

echo -e "\n\033[32mpkg update&upgrade...\033[0m"

yes | pkg update 2> >(grep -v "WARNING: apt does not have a stable CLI interface" >&2) > /dev/null && yes | pkg upgrade 2> >(grep -v "WARNING: apt does not have a stable CLI interface" >&2) > /dev/null


echo -e "\033[32mupdate/install win installer...\033[0m"
curl -s "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/tool" -o "$PREFIX/bin/wininstall" && chmod +x "$PREFIX/bin/wininstall"


printf "\nuse command: \e[1;32mwininstall\e[0m\n\n"