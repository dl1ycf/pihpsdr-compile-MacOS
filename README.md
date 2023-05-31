# How to compile piHPSDR on MacOS

May 31, 2023
------------

piHPSDR has been successfully compiled on MacOS from 10.15 "Catalina"
through 13.3 "Ventura". It runs natively both on Intel and M1/M2 Macs,
however the compilation produces a binary that only runs on computers
with the same processor (no universal binary).

Please note: the compilation produces an "app" bundle ready to
be double-clicked. This "app" however still depends on external
libraries and therefore is not meant to be transferred to another
Mac. It is strongly recommended to use an "app" that has been
compiled on the very same Mac computer.

Before compilation starts, you need to make your Mac ready to compile
and run Linux-style programs. This is achieved through the "homebrew"
universe. In addition, you need the MacOS X-Windows system (XQuartz),

Installing XQuartz, the MacOS X-Window system
---------------------------------------------

Simply go to the page

https://www.xquartz.org/

and install the package file found there (at the time of this writing,
the file is called XQuarte-2.8.5.pkg which can be down-loaded and
double-clicked).


Install the homebrew system
---------------------------

I have prepeared a shell script named "homebrew.sh" that installs
the homebrew core and all packages that are required to compile piHPSDR.
In addition, some code from Apple is loaded using the "xcode-select" 
program.

NOTE M1/M2 Macs:

While homebrew installs in /usr/local for Intel Macintosh computers, it
installs in /opt/homebrew on M1/M2 computers. This leads to different
locations of include files and libraries. On M1/M2 Macs, /usr/local
may be empty (or even non-existing), but it should not contain sub-folders
with name include or lib. In this case, we simply can redirect
using the commands

sudo ln -s /opt/homebrew/include /usr/local/include

sudo ln -s /opt/homebrew/lib     /usr/local/lib

and the WDSP libraries and include files that our compilation produces
will end up in the right place.

Obtaining the piHPSDR sources
-----------------------------

Alongside with piHPSDR, you need the WDSP library which does most of
the signal processing. Both can be obtained from my github account,
to facilitate things, a shell script "getit.sh" is provided.

Select features compiled into the program
-----------------------------------------

There are some optional capabilities that can or cannot be
included in the piHPSDR program. These feature are selected by
locating a string of the form

FEATURE_INCLUDE=FEATURE

in $HOME/pihpsdr/Makefile. If the line is as shown above, the feature
is activated. To de-activate such a feature, insert a '#' character
in the first column of that line. The main reasons to make these features
"user selectable" is that they might depend on external libraries e.g.
which are or are not available on a given target system.

GPIO

This feature is meant for RaspberryPi computers. There is support to 
connect push-buttons/encoders to the GPIO. On MacOS, there is no GPIO
so this feature is no active no matter what you do with this line, so
simply don't care.

STEMLAB

The program can detect a RedPitaya, start the SDR application through the web
interface, and then start the radio. You need to type in the IP address of the
RedPitaya once (it is remembered), so the best is to give the RedPitaya a
fixed IP address.

MIDI  

The program can be controlled by a MIDI console attached to the Macintosh.
I use the Behringer PL-1 and this makes much fun. Meanwhile this has also
been tested with a Behringer Studio2a and with a Hercules DJcompact console.
The MIDI documentation can be found in the github.com/dl1ycf/piHPSDR repository
with the sub-directory release/pihpsdr.

SOAPYSDR

Ability to use SDR hardware connected via the SoapySDR lib. I have tested this
with the Adalm Pluto connected via an USB cable to the Macintosh, the only
SoapySDR-supported hardware that I have. Other SoapySDR hardware
such as LimeSDR, RTL sticks, AirSpy, AirSpyHF, HackRF may work but I cannot
test this. (Volunteers are welcome to test
this, please report your findings to dl1ycf@darc.de).


If freshly downloaded, MIDI is selected but not STEMLAB and SOAPYSDR.


Compiling the program
---------------------

After adjusting the Makefile, the program (together with the WDSP library) can be
compiled using the script "compile.sh". This script will clean up things and
down-load the latest updates from the internet. As a result, the piHPSDR app 
should occur on your Desktop.


A note on the shell scripts
---------------------------

This repo contains the shell scripts, namely 

homebrew.sh
getit.sh
compile.sh

The first one installs the "homebrew universe", the second one downloads
the pihpsdr and WDSP code from the internet, and the last one does
the compilation.

You can down-load them to your Desktop, then open a terminal window and
execute the commands

cd $HOME/Desktop
chmod 755 homebrew.sh getit.sh compile.sh

After that, you can execute e.g. the first script using (still in the terminal window)
the commands

cd $HOME/Desktop
./homebrew.sh


