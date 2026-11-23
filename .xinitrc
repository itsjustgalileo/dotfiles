#!/bin/sh

# Make X11 environment available to systemd/D-Bus services
systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

# Turning off that pesky screen timeout
xset -dpms

# Start PulseAudio (if installed and used)
if command -v pulseaudio > /dev/null; then
    pulseaudio --start
fi

# Set wallpaper
if command -v feh > /dev/null; then
    if [ -f $HOME/code/dotfiles/Space.png ]; then
        feh --bg-scale $HOME/code/dotfiles/Space.png
    fi
fi

# Merge Xresources
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

# Start clipmenu
if command -v clipmenud > /dev/null; then
    clipmenud &
fi

# Start picom
if command -v picom > /dev/null; then
    picom -b &
fi

# Starting i3..2..1 ba*dum*tss
exec i3
