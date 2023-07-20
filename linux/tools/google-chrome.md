# How to install google chrome in Arch linux

## Install Google Chrome on Arch Linux
```
$ sudo pacman -S git.
$ cd ~/Downloads.
$ git clone https://aur.archlinux.org/google-chrome.git
$ ls
$ cd google-chrome/
$ makepkg -s
$ sudo pacman -U google-chrome-63.0.3239.108-1-x86_64.pkg.tar.xz
```

## Update google chrome
If want to update, then run the command inside the folder
```
./update_version.sh
makepkg -s
sudo pacman -U google-chrome-<version>.pkg.tar.xz
```
