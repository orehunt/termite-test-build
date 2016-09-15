#!/bin/bash

DIR=`dirname "$(readlink -f "$0")"`

mkdir -p /lib/terminfo/x
ln -s $DIR/data/termite.desktop /usr/share/applications/termite.desktop
ln -s $DIR/data/xterm-termite /usr/share/terminfo/x/xterm-termite
ln -s $DIR/data/config $HOME/.config/termite &>/dev/null
ln -s $DIR/data/man/termite.1 /usr/share/man/man1
ln -s $DIR/data/man/termite.config.5 /usr/share/man/man5
printf "#!/bin/bash\nexport LD_LIBRARY_PATH=$DIR/data\nexec $DIR/data/termite" > /usr/local/bin/termite
chmod +x /usr/local/bin/termite

