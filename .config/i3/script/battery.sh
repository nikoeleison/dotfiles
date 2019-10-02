# @author nikoeleison
# !/bin/bash

status=$(cat /sys/class/power_supply/BAT0/status)
capacity=$(cat /sys/class/power_supply/BAT0/capacity)
if [ $status == "Discharging" ]; then
	if [ $capacity -gt 80 ]; then
		status=''
	elif [ $capacity -gt 60 ]; then
		status=''
	elif [ $capacity -gt 40 ]; then
		status=''
	elif [ $capacity -gt 20 ]; then
		status=''
	else
		notify-send "Low Battery" "$capacity% of battery remaining." -u critical
		status=''
	fi
else
	status=''
fi
output="$status $capacity%"

echo $output
exit 0
