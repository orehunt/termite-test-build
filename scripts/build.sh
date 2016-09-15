#!/bin/bash

apt update 
apt install -y -q git
git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git
apt install -y -q g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac
apt install -y -q libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev 
apt install -y -q libxml2-utils gperf gobject-introspection gnutls-dev
cd vte-ng && ./autogen.sh && make &&  make install
cd ../termite && make &&  make install