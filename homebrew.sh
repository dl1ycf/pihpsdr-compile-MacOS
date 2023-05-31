#!/bin/sh

#
# This installs the "command line tools", these are necessary to install the
# homebrew universe
#
xcode-select --install

#
# This installes the core of the homebrew universe
#
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

#
# All needed for pihpsdr
#
brew install gtk+3
brew install pkg-config
brew install portaudio
brew install fftw

#
# This is for the SoapySDR universe
# There are even more radios supported for which you need
# additional modules, for a list, goto the web page
# https://formulae.brew.sh
# and insert the search string "pothosware". In the long
# list produced, search for the same string using the
# "search" facility of your internet browser
#
brew install cmake
brew install libusb
brew install pothosware/pothos/soapysdr
brew install pothosware/pothos/soapyplutosdr
brew install pothosware/pothos/limesuite
brew install pothosware/pothos/soapyrtlsdr
brew install pothosware/pothos/soapyairspy
brew install pothosware/pothos/soapyairspyhf
brew install pothosware/pothos/soapyhackrf
brew install pothosware/pothos/soapyredpitaya

#
# This is for PrivacyProtection
#
brew analytics off 

