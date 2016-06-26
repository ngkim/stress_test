#!/bin/bash

source /etc/profile
source "/root/stress/withnet/withnet.cfg"

NHR=`date '+%Y_%m%d_%H'`
NOW=`date '+%Y_%m%d_%H%M_%S'`

LOG_DIR="/var/log/stress/${BOX}/${NHR}"
mkdir -p $LOG_DIR

ip netns exec ${BOX} ab -n $TOTAL_REQ -c $NUM_THREAD http://${PUBLIC_IP}:${SVR_LOCAL_HTTP}/ &> $LOG_DIR/01_ab_to_local_${NOW}.log
#ip netns exec nsa3130 iperf -c 211.224.204.205 -i 1 -b 100M
