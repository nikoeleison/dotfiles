# @author nikoeleison
# !/bin/bash

temperature=`cat /sys/class/thermal/thermal_zone0/temp`
output=$(awk "BEGIN {printf \"%.0f\",$temperature/1000}")

echo " $output *c"
exit 0
