#!/bin/sh

sudo apt install -y libsndfile1-dev libmagic-dev libreadline-dev libxml2-dev cmake bison flex libucommon-dev libccrtp-dev libasound2-dev

# bcg729

# cd ..
# git clone https://github.com/BelledonneCommunications/bcg729
# cd bcg729
# cmake .
# make
# sudo make install
# cd ../twinkle



# Create a subdirectory for the build an enter it
mkdir -p build && cd build

# All possible options are:

# Qt 5 GUI: -DWITH_QT5=On (on by default)
# ALSA support: -DWITH_ALSA=On (on by default)
# ZRTP support: -DWITH_ZRTP=On
# G.729A codec support: -DWITH_G729=On
# Speex codec support: -DWITH_SPEEX=On
# iLBC codec support: -DWITH_ILBC=On
# Diamondcard support: -DWITH_DIAMONDCARD=On

# Run cmake with a list of build options
cmake .. -DWITH_QT5=Off -DWITH_ZRTP=Off -DWITH_G729=On -DWITH_SPEEX=Off -DWITH_ILBC=On -DWITH_DIAMONDCARD=Off


# Build Twinkle
make

# Installation will create the following directory for shared user data on your system:

# ${CMAKE_INSTALL_PREFIX}/share/twinkle
# The typical default value for CMAKE_INSTALL_PREFIX is /usr/local.

# Install Twinkle
# make install
