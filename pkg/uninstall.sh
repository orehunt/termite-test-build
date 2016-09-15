#!/bin/bash

DIR=`dirname "$(readlink -f "$0")"`

rm /usr/share/applications/termite.desktop
rm /usr/share/terminfo/x/xterm-termite
rm /usr/share/man/man*/termite.*
rm /usr/local/bin/termite
