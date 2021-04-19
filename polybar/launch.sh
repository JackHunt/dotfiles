#!/bin/bash

killall -q polybar


while pgrep -u $UID -x polybar >/dev/null
do
    sleep 1
done

echo "Launching top bar..."
polybar top &
