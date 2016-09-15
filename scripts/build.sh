#!/bin/bash

cd /
apt update 
apt install -y -q software-properties-common
add-apt-repository -y ppa:gnome3-team/gnome3
apt update
apt install -y -q git
git clone --recursive https://github.com/thestinger/termite.git
git clone https://github.com/thestinger/vte-ng.git
apt install -y -q g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac
apt install -y -q libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev 
apt install -y -q libxml2-utils gperf gobject-introspection gnutls-dev
cd vte-ng && ./autogen.sh && make &&  make install
cd ../termite && make &&  make install

mkdir -p /pkg/data
cp -rp \
/usr/local/lib/libvte* \
/usr/local/bin/termite \
/usr/local/share/terminfo/x/xterm-termite \
/usr/local/share/applications/termite.desktop \
/pkg/data

mkdir -p /pkg/data/man
cp -rp \
/usr/local/share/man/man1/termite.1 \
/usr/local/share/man/man5/termite.config.5 \
/pkg/data/man

strip -s /pkg/data/* &>/dev/null

echo "gtk: `dpkg -l | grep libgtk-3-dev | awk '{print $3}' | grep -o "[0-9]*\.[0-8]*\.[0-9]*"`" > /pkg/README
echo "vte-ng: `git --git-dir=/vte-ng/.git describe --tags | head -1`" >> /pkg/README
echo "termite: `git --git-dir=/termite/.git describe --tags | head -1`" >> /pkg/README