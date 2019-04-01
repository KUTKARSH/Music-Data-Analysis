#!/bin/bash

batchid=`cat /home/cloudera/utkarsh/project/logs/current-batch.txt`
LOGFILE=/home/cloudera/utkarsh/project/logs/log_batch_$batchid

echo "Running hive script for data analysis..." >> $LOGFILE

hive -hiveconf batchid=$batchid -f /home/cloudera/utkarsh/project/scripts/data_analysis2.hql


echo "Incrementing batchid..." >> $LOGFILE

batchid=`expr $batchid + 1`
echo -n $batchid > /home/cloudera/utkarsh/project/logs/current-batch.txt
