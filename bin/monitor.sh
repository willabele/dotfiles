#!/bin/bash

for output in $(find $(readlink -f /sys/class/drm/card0) -name status); do
    if [[ "${output}" == *"eDP-1"* ]];
    then
        continue
    fi
    status=$(<${output})

    output_name=$(echo "${output}" | sed -e 's/.*card0-\(.*\)\/.*/\1/')
    output_name=$(echo "${output_name}" | sed -e 's/HDMI-A/HDMI/')

    if [[ "${status}" == "connected" ]]
    then
        /usr/bin/notify-send --urgency=low -t 1000 "Graphics Update" "${output_name} active"
        /usr/bin/xrandr --output ${output_name} --auto --right-of eDP-1
    else
        /usr/bin/xrandr --output ${output_name} --off
    fi
done
