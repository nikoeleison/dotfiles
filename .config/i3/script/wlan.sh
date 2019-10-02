# @author nikoeleison
# !/bin/bash

download=`ifstat wlp3s0 | grep wlp3s0 | awk '{print $2}'`
upload=`ifstat wlp3s0 | grep wlp3s0 | awk '{print $3}'`
output=": $download : $upload"

echo " $output"
exit 0
