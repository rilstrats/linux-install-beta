sudo pacman -S libgnome-keyring
# cd /usr/share/git/credential/gnome-keyring
# sudo make
sudo make /usr/share/git/credential/gnome-keyring
git config --global credential.helper /usr/share/git/credential/gnome-keyring/git-credential-gnome-keyring
