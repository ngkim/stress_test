#!/bin/bash

source /etc/profile

NHR=`date '+%Y_%m%d_%H'`
NOW=`date '+%Y_%m%d_%H%M_%S'`

LOG_DIR="/var/log/stress/nsa3130/${NHR}"
mkdir -p $LOG_DIR

ip netns exec nsa3130 ab -n 20000 -c 6 http://www.etnews.com/20160609000328?mc=ns_001_00001 &> $LOG_DIR/05_ab_to_external_${NOW}.log
ip netns exec nsa3130 iperf -c 211.224.204.169 -i 1 -b 100M -t 600 &> $LOG_DIR/05_iperf_udp_100M_${NOW}.log &
