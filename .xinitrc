#!/bin/sh

# Start PulseAudio (if installed and used)
if command -v pulseaudio > /dev/null; then
    pulseaudio --start
fi

# Start ALSA (if PulseAudio is not used)
if command -v alsactl > /dev/null; then
    alsactl restore
fi

# Merge Xresources (if .Xresources file exists)
if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

# Start the i3 window manager
exec i3

