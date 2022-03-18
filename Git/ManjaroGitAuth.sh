sudo pacman -S libgnome-keyring

# The below line should work. If it doesn't, comment it out and uncomment the two lines below it.
sudo make /usr/share/git/credential/gnome-keyring
# cd /usr/share/git/credential/gnome-keyring
# sudo make

git config --global credential.helper /usr/share/git/credential/gnome-keyring/git-credential-gnome-keyring
