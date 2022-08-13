# Terminal
sudo dnf install zsh terminator tmux git wget
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Install powerlevel10k zsh-vi-mode zsh-syntax-highlighting zsh-autosuggestions

# ZSH_THEME="powerlevel10k/powerlevel10k"
# plugins=(git sudo zsh-vi-mode zsh-syntax-highlighting zsh-autosuggestions)


# Coding
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
sudo echo "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" > /etc/yum.repos.d/vscodium.repo
sudo dnf install codium neovim

# Follow primagens steps to set up neovim


# Git Credential Manager
mkdir ~/Git
cd ~/Git
sh -c "$(wget https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh -O -)"
git-credential-manager-core configure

# Git Configure
git config --global credential.credentialStore secretservice
git config --global user.email "riley.s.stratton@outlook.com"
git config --global user.name "Riley Stratton"
git config --global color.ui auto

# Git Clone (should open browser to authenticate)
git clone https://github.com/RileyStratton/LinuxScripts.git

# Git Push (should automatically authenticate)
cd LinuxScripts
date >> setup.txt
git add .
git commit -m "setup"
git push


# Brave
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

# Open brave and set up settings sync


# Mega
cd ~/Downloads
wget https://mega.nz/linux/repo/Fedora_36/x86_64/megasync-Fedora_36.x86_64.rpm
sudo dnf install ./megasync-Fedora_36.x86_64.rpm
mv ~/MEGA ~/Mega

# The following lines are for a GNOME install
wget https://mega.nz/linux/repo/Fedora_36/x86_64/nautilus-megasync-Fedora_36.x86_64.rpm
sudo dnf install ./nautilus-megasync-Fedora_36.x86_64.rpm

# The following lines are for a KDE install
# wget https://mega.nz/linux/repo/Fedora_36/x86_64/dolphin-megasync-Fedora_36.x86_64.rpm
# sudo dnf install ./dolphin-megasync-Fedora_36.x86_64.rpm

# Open mega and sign in


# Virualbox
cd ~/Downloads
wget https://www.virtualbox.org/download/oracle_vbox.asc
sudo rpm --import oracle_vbox.asc
sudo wget https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo -O /etc/yum.repos.d/virtualbox.repo
sudo dnf install VirtualBox-6.1


# Discord
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-36.noarch.rpm
sudo dnf install discord


# Flatpak items
sudo flatpak install slack bitwarden spotify zoom signal