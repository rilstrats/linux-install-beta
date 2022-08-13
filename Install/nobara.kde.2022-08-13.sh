# Coding
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
echo "[gitlab.com_paulcarroty_vscodium_repo]
name=download.vscodium.com
baseurl=https://download.vscodium.com/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
metadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium neovim

# Follow primagens steps to set up neovim


# Git Credential Manager
cd ~/Git
wget https://raw.githubusercontent.com/GitCredentialManager/git-credential-manager/main/src/linux/Packaging.Linux/install-from-source.sh
cat install-from-source.sh | sed "s/case \"\$distribution\" in/case \"fedora\" in/g" > install-from-source.fedora.sh
chmod +x install-from-source.fedora.sh
./install-from-source.fedora.sh
git-credential-manager-core configure

# Git Configure
git config --global credential.credentialStore secretservice
git config --global user.email "riley.s.stratton@outlook.com"
git config --global user.name "Riley Stratton"
git config --global color.ui auto

# Git Clone (should open browser to authenticate)
cd ~/Git
git clone https://github.com/rilstrats/gcm-check.git

# Git Push (should automatically authenticate)
cd ~/Git/gcm-check
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
# sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-36.noarch.rpm
sudo dnf install discord


# Flatpak items
sudo flatpak install slack bitwarden spotify zoom signal


# Terminal
cd ~
sudo dnf install zsh terminator tmux wget
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

# Install powerlevel10k zsh-vi-mode zsh-syntax-highlighting zsh-autosuggestions
mkdir ~/.fonts
cd ~/.fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf 
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
# Configure terminal (and any other desired apps) to use MesloLGS NF

cd ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

cd ~
cat .zshrc | sed 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' |\
sed 's/plugins=(git)/plugins=(git sudo zsh-vi-mode zsh-syntax-highlighting zsh-autosuggestions)/g' > .zshrc.new
mv .zshrc .zshrc.omz
mv .zshrc.new .zshrc
# source .zshrc


# Drives
sudo dnf install ntfs-3g
echo "UUID=29071D3603B7A859   /mnt/VM/      ntfs-3g    uid=1000,gid=1000,rw,user,exec,umask=000 0 0
UUID=5A42FF7E42FF5D67   /mnt/Games/     ntfs-3g uid=1000,gid=1000,rw,user,exec,umask=000 0 0" | sudo tee -a /etc/fstab

