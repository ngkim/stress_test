#!/bin/bash

source /etc/profile
source "/root/stress/withnet/withnet.cfg"

NHR=`date '+%Y_%m%d_%H'`
NOW=`date '+%Y_%m%d_%H%M_%S'`

LOG_DIR="/var/log/stress/${BOX}/${NHR}"
mkdir -p $LOG_DIR

ip netns exec ${BOX} iperf -c ${PUBLIC_IP} -i 1 -b 100M -t 600 &> $LOG_DIR/02_iperf_udp_100M_${NOW}.log
