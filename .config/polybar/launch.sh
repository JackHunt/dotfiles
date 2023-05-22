#!/usr/bin/env zsh

killall -q polybar

polybar --config=$HOME/.config/polybar/config.ini example 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
