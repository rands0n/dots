# Needed for all installers
sudo apt update -y
sudo apt install -y git curl unzip

gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

echo "$(pwd)/pkgs"

for pkg in "$(pwd)/pkgs/*.sh"; do source $pkg; done

sudo apt upgrade -y

gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 300

gum confirm "Ready to logout for all the settings to take effect?" && gnome-session-quit --logout --no-prompt
