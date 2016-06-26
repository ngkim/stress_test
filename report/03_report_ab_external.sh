#!/bin/bash

LOGDIR="/var/log/stress/nsa3130"

#echo "=============================================="
#echo "       REPORT ab - Requests per second          "
#echo "=============================================="
#
#find ${LOGDIR} -name "03_ab_*.log" | sort | xargs grep "Requests per second" | awk 'BEGIN { seq = 0 }{printf("%5d %s %10s\n", seq, substr($1,25,12), $4); seq++}'
#
#echo ""
#echo "=============================================="
#echo "  REPORT ab - Transfer rate (KBytes/sec)   "
#echo "=============================================="
#
#find ${LOGDIR} -name "03_ab_*.log" | sort | xargs grep "Transfer rate" | awk 'BEGIN { seq = 0 }{printf("%5d %s %10s\n", seq, substr($1,25,12), $3); seq++}'
#
#echo ""
#echo "=============================================="
#echo "  REPORT ab - Time taken for tests (sec)   "
#echo "=============================================="
#
#find ${LOGDIR} -name "03_ab_*.log" | sort | xargs grep "Time taken for tests" | awk 'BEGIN { seq = 0 }{printf("%5d %s %10s\n", seq, substr($1,25,12), $5); seq++}'


echo "=============================================="
echo "           REPORT ab to external         "
echo "=============================================="
printf "%22s %8s %12s\n" "Request" "Rate" "Time"
echo "----------------------------------------------"

LOGLIST=`find ${LOGDIR} -name "03_ab_*.log" | sort`
for LOGFILE in $LOGLIST; do
  LOGDATE=${LOGFILE:24:12}
  RPS_=`grep "Requests per second" $LOGFILE | awk '{printf("%10s", $4);}'`
  Rate=`grep "Transfer rate" $LOGFILE | awk '{printf("%10s", $3);}'`
  Time=`grep "Time taken for tests" $LOGFILE | awk '{printf("%10s", $5);}'`

  printf "%s %10s %10s %10s\n" $LOGDATE $RPS_ $Rate $Time
done


echo ""
