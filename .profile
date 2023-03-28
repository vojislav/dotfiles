#!/bin/sh

# Profile file. Runs on login.

export PATH="$PATH:$HOME/.scripts:$HOME/.local/bin:/usr/local/bin/i3-persist/bin:/usr/local/jvm/jdk-11.0.9:/usr/local/go/bin"
export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="firefox"
export READER="zathura"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export SCFOLDER="$HOME/Pictures/screenshots"

export SPOTIFY_CLIENT_ID=edcef2e9a0974bb59cc6fc18342a605a
export SPOTIFY_SECRET=21a01edf74974c17ac6065d845378132

export QT_QPA_PLATFORMTHEME=qt5ct

export JAVA_HOME="/usr/local/jvm/jdk-11.0.9"

[ ! -s ~/.config/mpd/pid ] && mpd
yams -d

setxkbmap -layout us,rs,rs -variant ,latinunicodeyz, -option grp:alt_shift_toggle &

[[ -f ~/.scripts/shortcuts.sh ]] && ~/.scripts/shortcuts.sh

[[ -f ~/.bashrc ]] && . ~/.bashrc

#Start graphical server if i3 not already running.
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep -x i3 || exec startx -- vt1 &> /dev/null
fi

# The following three lines have been added by IBM DB2 instance utilities.
if [ -f /home/db2inst1/sqllib/db2profile ]; then
    . /home/db2inst1/sqllib/db2profile
fi
