# @author nikoeleison
# !/bin/bash

download=`ifstat enp2s0 | grep enp2s0 | awk '{print $2}'`
upload=`ifstat enp2s0 | grep enp2s0 | awk '{print $3}'`
output=": $download : $upload"

echo " $output"
exit 0
