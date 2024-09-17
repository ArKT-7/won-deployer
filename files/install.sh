#!/data/data/com.termux/files/usr/bin/bash

# Define the tool URL and installation path
TOOL_URL="https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/tool"
INSTALL_PATH="$PREFIX/bin/wininstall"

# Print message to indicate the update/install process
echo -e "\033[32mUpdating/installing win installer...\033[0m"

# Remove old version if it exists
if [ -f "$INSTALL_PATH" ]; then
    echo "Removing old version..."
    rm -f "$INSTALL_PATH"
fi

# Download the new version
curl -s "$TOOL_URL" -o "$INSTALL_PATH"

# Set execute permissions
chmod +x "$INSTALL_PATH"

# Print success message and usage instructions
printf "\nTool installed successfully. Use the command: \e[1;32mwininstall\e[0m\n\n"
