#!/bin/bash

source /etc/profile
source "/root/stress/withnet/withnet.cfg"

NHR=`date '+%Y_%m%d_%H'`
NOW=`date '+%Y_%m%d_%H%M_%S'`

LOG_DIR="/var/log/stress/${BOX}/${NHR}"
mkdir -p $LOG_DIR

ip netns exec ${BOX} ab -n ${EXT_TOTAL_REQ} -c ${EXT_NUM_THREAD} http://www.etnews.com/20160609000328?mc=ns_001_00001 &> $LOG_DIR/03_ab_to_external_${NOW}.log
