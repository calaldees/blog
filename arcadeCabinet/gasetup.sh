#!/bin/bash

# curl https://raw.githubusercontent.com/calaldees/blog/master/arcadeCabinet/gasetup.sh -O && chmod 755 gasetup.sh && ./gasetup.sh

set -e

# if you get "archive currupt" message from pacman - you may have downloed html files for the first world mirror
# reorder your /etc/pacman.d/mirrorlist file by cutting your own country mirror to the top of the file

# --noconfirm  does not work because pacman is rubbish and cant confirm 'all' for base-devel
# --sysupgrade   # dont do this .. it breaks lxde
sudo pacman --sync --refresh \
    base-devel \
    chromium \
    docker \
    python-pip \
    make \
    git \
    p7zip \
    dosbox \
&& true


cat >>~/.bashrc <<EOL

function rr { 
    xrandr --output VGA-0 --mode 640x480i
}

function aur-install {
    # https://aur.archlinux.org/
    mkdir -p ~/apps/
    cd ~/apps/
    git clone https://aur.archlinux.org/${1}.git
    cd ${1}.git
    makepkg -si
}
# Example use:
# aur-install <name>
# <name> could be
#  dosbox-x
#  flycast-git
#  commander-genius-git
#  opentyrian


# https://arachnoid.com/modelines/
function s320x200 {
    xrandr --delmode VGA-0 "320x200x60.00"
    xrandr --rmmode VGA-0 "320x200x60.00"

    # switchres 320 200 60 -> creates the modeline below (that I copy/pasted)
    # xrandr --newmode "320x200x60.00" 6.639840 320 336 368 424 200 222 225 261 -HSync -Vsync
    # My tweaked modeline based on my B&O-MX7000 arachnoid.com/modelines/
    xrandr --newmode 6.639840 320 324 352 400 200 214 217 245 -HSync -Vsync
    xrandr --addmode VGA-0 "320x200x60.00"
    xrandr --output VGA-0 --mode "320x200x60.00"
}
function s320x240 {
    xrandr --delmode VGA-0 "320x240x60.00"
    xrandr --rmmode VGA-0 "320x240x60.00"

    # My tweaked modeline based on my B&O-MX7000 arachnoid.com/modelines/
    xrandr --newmode 6.639840 320 320 352 398 240 242 245 290 -HSync -Vsync
    xrandr --addmode VGA-0 "320x240x60.00"
    xrandr --output VGA-0 --mode "320x240x60.00"

}

EOL

# install controller config file
PATH_MAME="$(find ~/ -d -iwholename *config*/mame/)" &&\
curl "https://raw.githubusercontent.com/calaldees/blog/master/arcadeCabinet/allan4p.cfg.xml" -o ${PATH_MAME}/ctrlr/allan4p.cfg &&\
sed -i .  's/crtlr.*/crtlr      allan4p/g' ${PATH_MAME}/mame.ini


# docker

# Sadly I cant jsut use sudo for these ...
#sudo su root
#   systemctl start docker.service
#   systemctl enable docker.service
#   gpasswd -a arcade docker



# rhasspy-load-mame

mkdir -p ~/code/
cd ~/code/
git clone https://github.com/calaldees/rhasspy-load-mame.git
cd rhasspy-load-mame
make build

pip install websockets

