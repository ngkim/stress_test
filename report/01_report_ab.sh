#!/bin/bash

LOGDIR="/var/log/stress/nsa3130"

echo ""
echo "=============================================="
echo "           REPORT ab to local          "
echo "=============================================="
printf "%22s %8s %12s\n" "Request" "Rate" "Time"
echo "----------------------------------------------"

LOGLIST=`find ${LOGDIR} -name "01_ab_to_local*.log" | sort`
for LOGFILE in $LOGLIST; do
  LOGDATE=${LOGFILE:24:12}
  RPS_=`grep "Requests per second" $LOGFILE | awk '{printf("%10s", $4);}'`
  Rate=`grep "Transfer rate" $LOGFILE | awk '{printf("%10s", $3);}'`
  Time=`grep "Time taken for tests" $LOGFILE | awk '{printf("%10s", $5);}'`

  printf "%s %10s %10s %10s\n" $LOGDATE $RPS_ $Rate $Time
done


