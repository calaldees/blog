Toshiba CDT320
==============

Setup guide for my P166 toshiba laptop for dos games

* Windows 98
    * Windows 98 SE OEM Product Key - `PRDDH-83JD9-G6PK4-684GF-6Y73B`
    * iso [Toshiba Satellite 320 CDT & CDS Tools & Utilities multilang](https://archive.org/details/s-320-tools-utilities)
        * Sound and graphics drivers
* DOS
    * [Guide to CONFIG.SYS & AUTOEXEC.BAT version 3.04](https://madsenworld.dk/con_auto/index-uk.htm)
    * [Useful DOS software](https://sta.c64.org/dosprg.html)
        * put in `/dos/`
            * `fx.exe`
            * `ctmouse`
    * dos [cd drivers](http://toogam.com/software/archive/drivers/drive/compactd/compactd.htm#rodriver)
        * `toshv218.sys`
        * dos [File systems for hard drives](http://toogam.com/software/archive/drivers/filesys/filesys.htm)
    * OPL3 Soundcard in DOS
        * https://www.vogons.org/viewtopic.php?t=76228
            * `Setupsa.exe` OPL3 soundcard
* Other references
    * https://superuser.com/questions/778716/install-a-cd-rom-driver-on-ms-dos
        * oak CD drivers takes memory
    * https://dos.fandom.com/wiki/BLASTER_Variable
    * http://wiki.freedos.org/wiki/index.php/Country_codes
    * https://en.wikipedia.org/wiki/Code_page



## config.sys
```sys
NUMLOCK=OFF
BREAK=ON
DOS=HIGH,UMB,NOAUTO
FILESHIGH=40
FCBSHIGH=1,0
BUFFERSHIGH=30,0
LASTDRIVEHIGH=J
STACKSHIGH=9,256
COUNTRY=044,850,C:\WINDOWS\COMMAND\COUNTRY.SYS
DEVICE=C:\WINDOWS\HIMEM.SYS /V
DEVICE=C:\WINDOWS\EMM386.EXE RAM /MIN=0 I=B000-B7FF /V
DEVICEHIGH /L:2 =C:\WINDOWS\COMMAND\DISPLAY.SYS CON=(EGA,,1)
DEVICEHIGH /L:2 =C:\DOS\TOSH218.SYS /D:MSCD000
DEVICEHIGH /L:2 =C:\WINDOWS\SETVER.EXE
DEVICEHIGH /L:1 =C:\WINDOWS\IFSHLP.SYS
SHELL=C:\WINDOWS\COMMAND.COM C:\WINDOWS\ /E:1024 /P
```

## autoexec.bat
```bat
@ECHO OFF
LH /L:2 C:\WINDOWS\COMMAND\MSCDEX /D:MSCD000 /M:15 /E /S /L:D /V
LH /L:0;2 /S C:\WINDOWS\COMMAND\SMARTDRV 2048 16 /V
C:\WINDOWS\COMMAND\MODE CON RATE=32 DELAY=2
C:\WINDOWS\COMMAND\MODE CON CP PREP=((850) C:\WINDOWS\COMMAND\EGA.CPI)
C:\WINDOWS\COMMAND\MODE CON CP SEL=850
LH /L:2 C:\WINDOWS\COMMAND\KEYB UK,850,C:\WINDOWS\COMMAND\KEYBOARD.SYS
LH /L:2 C:\WINDOWS\COMMAND\DOSKEY /INSERT
LH /L:2 C:\DOS\CTMOUSE.EXE
PROMPT $p$g
PATH C:\WINDOWS;C:\WINDOWS\COMMAND;C:\DOS
SET DIRCMD=/P /A
SET TEMP=C:\WINDOWS\TEMP
SET TMP=C:\WINDOWS\TEMP
SET BLASTER=A220 I5 D0 P330 T4
SET MIDI=SYNTH:1 MAP:G
C:\DOS\OPL3\SETUPSA.EXE /S
```
