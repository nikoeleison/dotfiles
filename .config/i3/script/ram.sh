# @author nikoeleison
# !/bin/bash

total=`free | grep Mem | awk '{print $2}'`
used=`free | grep Mem | awk '{print $3}'`
output=$(awk "BEGIN {printf \"%.2f\",($used/$total)*100}")

echo " $output%"
exit 0
