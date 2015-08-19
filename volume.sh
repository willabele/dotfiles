#!/bin/bash

case "$1" in
    +)
        if ps -C pulseaudio > /dev/null 2>&1; then
            pactl set-sink-volume 1 -- +3%
        else
            amixer -q set Master 2%+ unmute || amixer -q set PCM 2%+ unmute
        fi
        ;;

    -)
        if ps -C pulseaudio > /dev/null 2>&1; then
            pactl set-sink-volume 1 -- -3%
        else
            amixer -q set Master 2%- unmute || amixer -q set PCM 2%- unmute
        fi
        ;;

    mute)
        if ps -C pulseaudio > /dev/null 2>&1; then
            pactl set-sink-mute 1 -- toggle
        else
            amixer -q set Master toggle || amixer -q set PCM toggle
        fi
        echo mute
        ;;

    *)
        echo "Invalid usage!"
        exit 1
esac
