#!/bin/sh

# Make X11 environment available to systemd/D-Bus services
systemctl --user import-environment DISPLAY XAUTHORITY
dbus-update-activation-environment --systemd DISPLAY XAUTHORITY

# Start PulseAudio (if installed and used)
if command -v pulseaudio > /dev/null; then
    pulseaudio --start
fi

# Set wallpaper
if command -v feh > /dev/null; then
    if [ -f ~/code/dotfiles/bg.png ]; then
        feh --bg-scale ~/code/dotfiles/bg.png
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

exec i3
