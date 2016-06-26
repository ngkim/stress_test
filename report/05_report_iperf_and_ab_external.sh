#!/bin/bash

LOGDIR="/var/log/stress/nsa3130"

echo "=========================================================================================================="
echo "       REPORT iperf           "
echo "=========================================================================================================="
printf " %36s %20s %28s\n" "Data Rates" "Latency" "Packets Lost"
echo "----------------------------------------------------------------------------------------------------------"

find ${LOGDIR} -name "05_iperf_udp*.log" | sort | xargs grep " ms\|WARNING: did not" | awk 'BEGIN { seq = 0 }{printf("%5d %s %10s %10s %10s %10s %20s %-15s\n", seq, substr($1,25,12), $7, $8, $9, $10, $11, $12); seq++}'

echo "=============================================="
echo "           REPORT ab          "
echo "=============================================="
printf "%22s %8s %12s\n" "Request" "Rate" "Time"
echo "----------------------------------------------"

LOGLIST=`find ${LOGDIR} -name "05_ab_*.log" | sort`
for LOGFILE in $LOGLIST; do
  LOGDATE=${LOGFILE:24:12}
  RPS_=`grep "Requests per second" $LOGFILE | awk '{printf("%10s", $4);}'`
  Rate=`grep "Transfer rate" $LOGFILE | awk '{printf("%10s", $3);}'`
  Time=`grep "Time taken for tests" $LOGFILE | awk '{printf("%10s", $5);}'`

  printf "%s %10s %10s %10s\n" $LOGDATE $RPS_ $Rate $Time
done


echo ""
