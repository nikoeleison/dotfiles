# @author nikoeleison
# !/bin/bash

#--- pywal
echo ".:. reconfigure pywal"
wal -a 85 -i $1

#--- rofi
echo ".:. reconfigure rofi"
mkdir -p  "${HOME}/.config/rofi"
ln -sf "${HOME}/.cache/wal/rofi.rasi" "${HOME}/.config/rofi/rofi.rasi"

#--- dunst
echo ".:. reconfigure dunst"
killall dunst; notify-send 'Pywal' 'Successfully reconfigure pywal. :D' -u low
