#!/bin/bash

source /etc/profile

NHR=`date '+%Y_%m%d_%H'`
NOW=`date '+%Y_%m%d_%H%M_%S'`

BOX="nsa3130"
SVR="211.224.204.206"
THR="20"
# MSS 256 ==> about 600Mbps
MSS=256

LOG_DIR="/var/log/stress/${BOX}/${NHR}"
mkdir -p $LOG_DIR

#iperf -c ${SVR} -i 1 -P $THR -M $MSS -t 600 &> $LOG_DIR/01_iperf_tcp_full_${NOW}.log
#ip netns exec nsa3130 iperf -c 211.224.204.206 -M 256 -P 20 -i 1 -t 60
ip netns exec nsa3130 iperf -c ${SVR} -M $MSS -P $THR -i 1 -t 300 &> $LOG_DIR/01_iperf_tcp_full_${NOW}.log
