#!/bin/bash

source /etc/profile

NHR=`date '+%Y_%m%d_%H'`
NOW=`date '+%Y_%m%d_%H%M_%S'`

BOX="nsa3130"
SVR="211.224.204.206"
THR="20"
MSS=256

LOG_DIR="/var/log/stress/${BOX}/${NHR}"
mkdir -p $LOG_DIR

#iperf -c ${SVR} -i 1 -P $THR -M $MSS -t 600 &> $LOG_DIR/01_iperf_tcp_full_${NOW}.log
iperf -c ${SVR} -M $MSS -i 1 -t 600 &> $LOG_DIR/01_iperf_tcp_full_${NOW}.log
