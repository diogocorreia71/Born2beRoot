#!/bin/bash

#ARCH
arch=$(uname -a)

#PHYSICAL CPU
pcpu=$(grep "physical id" /proc/cpuinfo | wc -l)

#VIRTUAL CPU
vcpu=$(grep "processor" /proc/cpuinfo | wc -l)

#RAM
ram_total=$(free --mega | awk '$1 == "Mem:" {print $2}')
ram_used=$(free --mega | awk '$1 == "Mem:" {print $3}')
ram_percent=$(free --mega | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

#DISK
disk_total=$(df -Bg | grep "/dev/" | grep -v "/boot" | awk '{disk_t += $2} END {printf ("%.1fGb\n"), dis>
disk_used=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{disk_u += $3} END {print disk_u}')
disk_percent=$(df -m | grep "/dev/" | grep -v "/boot" |  awk '{disk_u += $3} {disk_t += $2} END {printf(>

#CPU LOAD
cpul=$(vmstat 1 2 | tail -1 | awk '{print $15}')
cpu_op=$(expr 100 - $cpul)
cpu_fin=$(printf "%.1f" $cpu_op)

#LAST BOOT
lb=$(who -b | awk '$1 == "system" {print $3 " " $4}')

#LVM USE
lvmu=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)

#TCP CONNECTIONS
tcpc=$(ss -ta | grep ESTAB | wc -l)

#USER LOG
ulog=$(users | wc -w)

#NETWORK
ip=$(hostname -I)
mac=$(ip link | grep "link/ether" | awk '{print $2}')

#SUDO
cmnd=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

wall "  Architecture: $arch
        CPU physical: $pcpu
        vCPU: $vcpu
        Memory Usage: $ram_used/${ram_total}MB ($ram_percent%)
        Disk Usage: $disk_used/${disk_total} ($disk_percent%)
        CPU load: $cpu_fin%
        Last boot: $lb
        LVM use: $lvmu
        Connections TCP: $tcpc ESTABLISHED
        User log: $ulog
        Network: IP $ip($mac)
        Sudo: $cmnd cmd"
