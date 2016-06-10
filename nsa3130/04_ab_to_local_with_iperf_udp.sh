#!/bin/bash

source /etc/profile

NHR=`date '+%Y_%m%d_%H'`
NOW=`date '+%Y_%m%d_%H%M_%S'`

LOG_DIR="/var/log/stress/nsa3130/${NHR}"
mkdir -p $LOG_DIR

ip netns exec nsa3130 ab -n 2500000 -c 10 http://211.224.204.169:9980/ &> $LOG_DIR/04_ab_to_local_${NOW}.log &
ip netns exec nsa3130 iperf -c 211.224.204.169 -i 1 -b 100M -t 600 &> $LOG_DIR/04_iperf_udp_100M_${NOW}.log &
