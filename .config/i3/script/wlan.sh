# @author nikoeleison
# !/bin/bash

status=$(cat /sys/class/net/wlp3s0/carrier)
if [ $status == "1" ]; then
	download=`ifstat wlp3s0 | grep wlp3s0 | awk '{print $2}'`
	upload=`ifstat wlp3s0 | grep wlp3s0 | awk '{print $3}'`
	output=" $download B/s  $upload B/s"
else
	output="N/A"
fi

echo " $output"
exit 0
