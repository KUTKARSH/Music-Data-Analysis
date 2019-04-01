#!/bin/bash

python generate_mob_data.py
sh populate-lookup.sh
sh dataformatting.sh
hive -f create_hive_hbase_lookup.hql
sh data_enrichment.sh
sh data_analysis.sh
