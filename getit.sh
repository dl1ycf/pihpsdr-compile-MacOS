#!/bin/csh

#
# Put the pihpsdr and wdsp directories in the home dir
#
cd $HOME
#
# Obtain WDSP and piHPSDR source code
# CLEAN UP before
#
rm -rf $HOME/pihpsdr
rm -rf $HOME/wdsp
#
git clone https://github.com/dl1ycf/wdsp
git clone https://github.com/dl1ycf/pihpsdr

