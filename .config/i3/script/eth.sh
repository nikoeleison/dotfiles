# @author nikoeleison
# !/bin/bash

status=$(cat /sys/class/net/enp2s0/carrier)
if [ $status == "1" ]; then
	download=`ifstat enp2s0 | grep enp2s0 | awk '{print $2}'`
	upload=`ifstat enp2s0 | grep enp2s0 | awk '{print $3}'`
	output=" $download B/s  $upload B/s"
else
	output="N/A"
fi

echo " $output"
exit 0
