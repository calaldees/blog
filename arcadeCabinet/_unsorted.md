Unsorted Notes
==============

Audio?
https://www.arcadeworlduk.com/pages/JPAC-FAQ.html
http://forum.arcadecontrols.com/index.php/topic,39106.0.html
https://www.amazon.com/PM2038-2X5W-Stereo-Audio-Amplifier/dp/B01NABJTDJ


[Old PC and DOS games on the Sony BVM](https://imgur.com/r/crtgaming/8Q1vf)
> Dosbox SVN Daum to force games to run in a 640x200
[Dosbox, CRT 17", 320x200... please.](https://www.vogons.org/viewtopic.php?f=31&t=38868&start=20)
[About DOSBOX and native MSDOS resolutions...](https://www.vogons.org/viewtopic.php?t=15220)
https://forums.libretro.com/t/dosbox-70hz-w-doublescan-640x400-crt-switchres/22631


mame64 ibm5150 -isa1 ega -flop1 monkey
https://forums.bannister.org/ubbthreads.php?ubb=showflat&Number=86865#Post86865

* [7z support problem in Mame](https://forums.bannister.org/ubbthreads.php?ubb=showflat&Number=91921)
    * Some games can't be loaded directly from a 7zip file and need to be referenced by MameXML romname


System pauses at startup without dns - solution
```bash
sudo systemctl disable systemd-networkd-wait-online.service
```


```bash
pacman -Sy dosbox
nano ~/.dosbox/dosbox???.conf
  aspect=true
  # autoexec
  mount c: /home/arcade/dosbox
  c:

# to extract mame .img files
pacman -Sy p7zip
# 7z x ~/Downloads/thing.zip -o~/dosbox/install

sudo mount -o loop file.img /folder/mnt


# the usb microphone was device 0 and this was preventing dosbox from enabling audio
# set the device number of pcm and crtl to the alsa device number for default sound
nano ~/.asoundrc
# WARNING! This seems fine ... but MAME drops audio after 5min with this?! WTF?
# so I need to set `pcm` to my sound output device `1` for dosbox/opentyrian and `0` usb-microphone for MAME WTF
```

`~/.bashrc`
```bash
# `640x480i` is already setup in GroovyArcade
function rr { 
    xrandr --output VGA-0 --mode 640x480i
}

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

function aur-install {
    # https://aur.archlinux.org/
    # cd ~/apps/?
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

```



```bash
# Install dosbox-x
# https://aur.archlinux.org/packages/dosbox-x/
# https://dev.to/nabbisen/installing-aur-packages-bdf
# https://classicforum.manjaro.org/index.php?topic=3216.0
sudo pacman -S base-devel
git clone https://aur.archlinux.org/dosbox-x.git
cd dosbox-x
makepkg -si
# I had to start dosbox-x in windowed mode and manually use the commandline to switch res, then pop in and out of fullscreen with F12+F a few times for it to center correctly.
dosbox-x 
# nano ./config/dosbox-x/??.conf  - settings: Use `surface` and no-doublescan for video
```

https://www.vogons.org/viewtopic.php?p=405253#p405253
I may be able to add the following modes to xrandr and use `fullresolution=original`
(the 320? resolutions may not be needed if doubling is enabled)
640x400
640x350
640x200
320x200
320x240
320x400


```dosbox
# https://dosbox-x.com/wiki/
# -> Managing images files
imgmount a :disk1.ima :disk2.ima :disk3.ima
# `:` is read-only mount
# swap disk in dosbox-x menu
```

```bash
# https://aur.archlinux.org/packages/opentyrian/
git clone https://aur.archlinux.org/opentyrian.git
cd opentyrian
makepkg -si
# s320 && opentyrian
```




### Hardware

Single thread performance for MAME
https://www.cpubenchmark.net/singleThread.html

AMD FX-6300 Six-Core
Single Thread Score 1482
Some stuttering on Sega System 18 (Moonwalker) - No 3D games run - Outrunners not playable

Search for "MAME Benchmarks" for more guidence

