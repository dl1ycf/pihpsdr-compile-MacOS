#!/bin/csh

#
# cleanup, pull and compile WDSP
#
rm -f /usr/local/include/wdsp.h
rm -f /usr/local/lib/libwdsp*

cd $HOME/wdsp
git pull
make clean
make -j 4
make install

#
# clean up, pull and compile piHPSDR
# and move the app to the Desktop
#
cd $HOME/pihpsdr
git pull
make clean
make -j 4 app
mv pihpsdr.app $HOME/Desktop
