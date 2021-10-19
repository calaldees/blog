#!/bin/bash

# curl https://raw.githubusercontent.com/calaldees/blog/master/arcadeCabinet/gasetup.sh -O && chmod 755 gasetup.sh && ./gasetup.sh

set -e

# Disble waiting for network on boot - no network locks docker for 120 seconds on startup
sudo systemctl disable systemd-networkd-wait-online.service

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


# TODO!!! the `${1}` in the EOL below get replaced ... fuck I had to manually put the ${1} back :(

cat >>~/.bashrc <<EOL


function rr { 
    xrandr --output VGA-0 --mode 640x480i
}

function aur-install {
    # https://aur.archlinux.org/
    mkdir -p ~/apps/
    cd ~/apps/
    git clone https://aur.archlinux.org/${1}.git
    cd ${1}
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
PATH_MAME="$(find ~/ -iwholename *config*/mame)" &&\
curl "https://raw.githubusercontent.com/calaldees/blog/master/arcadeCabinet/allan4p.cfg.xml" -o ${PATH_MAME}/ctrlr/allan4p.cfg &&\
sed -i.  's/crtlr\s.*/crtlr      allan4p/g' ${PATH_MAME}/mame.ini
# TODO check that crtlr'''\s''' works! - do we need to escap the `\`  ?

# joystick_deadzone         0.03
# joystick_saturation       0.95
# mouse                     1


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



# https://askubuntu.com/questions/50067/howto-save-alsamixer-settings
alsamixer
sudo alsactl store

Set default capture device (FUCKING HELL!)

# https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture/Troubleshooting#Setting_the_default_microphone/capture_device
#  see also https://stackoverflow.com/questions/36239212/how-to-configure-different-alsa-defaults-for-capture-through-one-device-and-play
nano ~/.asoundrc
```
pcm.mic {
    # From `arecord -l`
    type hw
    card 2
    device 0
}

pcm.!default
{
    type asym
    playback.pcm
    {
        type plug
        slave.pcm "dmix"
    }
    capture.pcm
    {
        type plug
        slave.pcm "usb"
    }
}
```

# https://bbs.archlinux.org/viewtopic.php?id=196525
test-microphone() {
    arecord -vvv -f dat /dev/null
    # arecord -l
    # identify card number and device number  - http://www.voxforge.org/home/docs/faq/faq/linux-how-to-determine-your-audio-cards-or-usb-mics-maximum-sampling-rate
    # arecord -vvv -f S16_LE -D hw:2,0 /dev/null
    # if default device setup
    # arecord -vvv -f S16_LE /dev/null
}