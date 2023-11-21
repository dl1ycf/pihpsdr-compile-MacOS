# How to compile piHPSDR on MacOS

A much improved installation procedure is now available in the
repo github.com/dl1ycf/pihpdsr. It is explained in the new
manual which can be found there in the release/LatexManual 
directory.  No further updates will be done HERE.

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
