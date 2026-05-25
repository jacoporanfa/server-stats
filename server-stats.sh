#!/bin/bash

echo "===CPU USAGE==="
top -bn1 | grep "Cpu(s)" | awk '{print "CPU usage:" 100 - $8, "%"}'

echo "===MEMORY==="
free -m | grep "Mem" | awk '{print "Free Ram: " (100 * $NF)/$2,"%"}'
free -m | grep "Mem" | awk '{print "Used Ram: " (100 * $3)/$2,"%"}'

echo "===DISK USAGE==="
df -h / | awk 'NR==2 {print "Total: " $2 " Usato: " $3 " Libero: " $4 " full: " $5}'
echo "===TOP 5 PROCESS BY CPU USAGE==="
ps -eo pid,user,%cpu,%mem --sort=-%cpu | head -6
echo "===TOP 5 PROCESS BY MEMORY USAGE==="
ps -eo pid,user,%cpu,%mem --sort=-%mem | head -6
echo "===OTHER INFO==="
echo "OS: $(cat /etc/os-release | grep "PRETTY_NAME")"


echo "UPTIME: $(uptime -p)"

echo "LOAD AVERAGE: $(cat /proc/loadavg | awk '{print $1, $2, $3}')"


echo "LOGGED USERS: $(who | wc -l)"
