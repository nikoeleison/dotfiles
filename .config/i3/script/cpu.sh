# @author nikoeleison
# !/bin/bash

user=`cat /proc/stat | grep 'cpu ' | awk '{print $2}'`
nice=`cat /proc/stat | grep 'cpu ' | awk '{print $3}'`
system=`cat /proc/stat | grep 'cpu ' | awk '{print $4}'`
idle=`cat /proc/stat | grep 'cpu ' | awk '{print $5}'`
iowait=`cat /proc/stat | grep 'cpu ' | awk '{print $6}'`
irq=`cat /proc/stat | grep 'cpu ' | awk '{print $7}'`
softirq=`cat /proc/stat | grep 'cpu ' | awk '{print $8}'`
steal=`cat /proc/stat | grep 'cpu ' | awk '{print $9}'`
guest=`cat /proc/stat | grep 'cpu ' | awk '{print $10}'`
guest_nice=`cat /proc/stat | grep 'cpu ' | awk '{print $11}'`

totalTime=$(($user+$nice+$system+$idle+$iowait+$irq+$softirq+$steal))
totalIdle=$(($idle+$iowait))
totalUsage=$(($totalTime-$totalIdle))
output=$(awk "BEGIN {printf \"%.2f\",($totalUsage/$totalTime)*100}")

echo " $output%"
exit 0
