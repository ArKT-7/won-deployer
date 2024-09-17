#!/data/data/com.termux/files/usr/bin/bash

# Check if the script is running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script with root permissions (su)."
    echo "type - su"
    echo "then grant root if asked then the command"
    exit 1
fi

curl -sSL https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/tool -o /data/local/tmp/tool && chmod +x /data/local/tmp/tool && su -c "/data/local/tmp/tool"
