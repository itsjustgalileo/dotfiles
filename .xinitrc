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
if command -v xwallpaper > /dev/null; then
    if [ -f ~/dotfiles/bg.png ]; then
        xwallpaper --zoom ~/code/dotfiles/bg.png
    fi
fi

# Start Clipmenu (Clipboard manager)
if command -v clipmenud > /dev/null; then
    clipmenud &
fi

# Start Picom (Compositor for transparency and effects)
if command -v picom > /dev/null; then
    picom --experimental-backends &
fi

# Start libvirtd (Virtual machine service)
if command -v libvirtd > /dev/null; then
    sudo systemctl start libvirtd &
fi

# Start NetworkManager (if not already running)
if command -v nm-applet > /dev/null; then
    nm-applet &
fi

# Start the i3 window manager
exec i3
