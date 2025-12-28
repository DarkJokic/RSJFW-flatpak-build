#!/bin/bash

# RSJFW Build Fixer & Protocol Handler Setup
# This script fixes the 'Waiting for Wine' hang and Browser Login issues.

echo "Starting RSJFW Build Fixer..."

# 1. Kill any hung Wine/Roblox processes to unblock the Flatpak
echo " Clearing background Wine processes..."
flatpak kill com.github.nunya.RSJFW > /dev/null 2>&1

# 2. Create the Local Applications directory if it doesn't exist
mkdir -p ~/.local/share/applications

# 3. Create the Desktop Entry for the Auth Protocol
# This tells Ubuntu: "Send roblox-studio-auth:// links to the Flatpak"
echo " Registering Protocol Handler..."
cat > ~/.local/share/applications/roblox-studio-auth.desktop <<EOF
[Desktop Entry]
Name=RSJFW Roblox Studio Auth
Exec=flatpak run com.github.nunya.RSJFW %u
Type=Application
NoDisplay=true
Categories=Development;
MimeType=x-scheme-handler/roblox-studio-auth;x-scheme-handler/roblox-studio;
EOF

# 4. Associate the MIME type and refresh the system database
xdg-mime default roblox-studio-auth.desktop x-scheme-handler/roblox-studio-auth
xdg-mime default roblox-studio-auth.desktop x-scheme-handler/roblox-studio
update-desktop-database ~/.local/share/applications

# 5. Fix common Flatpak portal issue (helps the app 'see' the browser)
echo "🌐 Configuring sandbox portals..."
flatpak --user override --env=XDG_DESKTOP_PORTAL_BACKEND=gtk com.github.nunya.RSJFW

echo "System Fixes Applied!"
echo "You can now launch RSJFW and use 'Login via Browser'."
