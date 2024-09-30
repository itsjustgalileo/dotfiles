#!/bin/sh

# Start PulseAudio (if installed and used)
if command -v pulseaudio > /dev/null; then
    pulseaudio --start
fi

# Merge Xresources (if .Xresources file exists)
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

# Set wallpaper using xwallpaper (if the image exists)
if command -v feh > /dev/null; then
    if [ -f ~/code/dotfiles/bg.png ]; then
        feh --bg-scale ~/code/dotfiles/bg.webp
    fi
fi

# Start clipmenu
if command -v clipmenud > /dev/null; then
    clipmenud&
fi

# Start picom
if command -v picom > /dev/null; then
    picom -b &
fi

# Start the i3 window manager
exec i3
