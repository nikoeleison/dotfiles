# @author nikoeleison
# !/bin/bash

isEth=$(cat /sys/class/net/enp2s0/carrier)
isWlan=$(cat /sys/class/net/wlp3s0/carrier)

if [ $isEth == "1" ]; then
	download=`ifstat enp2s0 | grep enp2s0 | awk '{print $2}'`
	upload=`ifstat enp2s0 | grep enp2s0 | awk '{print $3}'`
	echo "  $download B/s  $upload B/s"
elif [ $isWlan == "1" ]; then
	download=`ifstat wlp3s0 | grep wlp3s0 | awk '{print $2}'`
	upload=`ifstat wlp3s0 | grep wlp3s0 | awk '{print $3}'`
	echo "  $download B/s  $upload B/s"
else
	echo "N/A"
fi

exit 0
