#!/data/data/com.termux/files/usr/bin/bash

# Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Switching to root..."
    exec su -c "$0 $*"
else
    # Your script URL or path
    SCRIPT_URL="https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/tool"
    
    # Download the script
    curl -o /data/data/com.termux/files/home/tool.sh "$SCRIPT_URL"
    
    # Make the script executable
    chmod +x /data/data/com.termux/files/home/tool.sh
    
    # Execute the script
    /data/data/com.termux/files/home/tool.sh
fi
