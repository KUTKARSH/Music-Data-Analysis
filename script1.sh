#!/bin/bash

#echo running generate_web_data.py >> /home/cloudera/utkarsh/project/scripts/logs.txt
#python /home/cloudera/utkarsh/project/scripts/generate_mob_data.py
echo running populate-lookup.sh >> /home/cloudera/utkarsh/project/scripts/logs.txt
sh /home/cloudera/utkarsh/project/scripts/populate-lookup.sh
#echo running dataformatting.sh >> /home/cloudera/utkarsh/project/scripts/logs.txt
#sh /home/cloudera/utkarsh/project/scripts/dataformatting.sh
#echo running create_hive_hbase_lookup.hql >> /home/cloudera/utkarsh/project/scripts/logs.txt
#hive -f /home/cloudera/utkarsh/project/scripts/create_hive_hbase_lookup.hql
#echo running data_enrichment.sh >> /home/cloudera/utkarsh/project/scripts/logs.txt
#sh /home/cloudera/utkarsh/project/scripts/data_enrichment.sh
#echo running data_analysis.sh >> /home/cloudera/utkarsh/project/scripts/logs.txt
#sh /home/cloudera/utkarsh/project/scripts/data_analysis.sh

