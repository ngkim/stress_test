#!/bin/bash

source /etc/profile
source "/root/stress/withnet/withnet.cfg"

NHR=`date '+%Y_%m%d_%H'`
NOW=`date '+%Y_%m%d_%H%M_%S'`

LOG_DIR="/var/log/stress/${BOX}"
mkdir -p $LOG_DIR

iperf -s -i 1 &> $LOG_DIR/11_iperf_server_tcp_${NOW}.log &


