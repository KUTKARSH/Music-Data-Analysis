SET hive.auto.convert.join=false;
USE project;

CREATE TABLE IF NOT EXISTS top_10_stations
(
station_id STRING,
total_distinct_songs_played INT,
distinct_user_count INT
)
PARTITIONED BY (batchid INT)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

INSERT OVERWRITE TABLE top_10_stations
PARTITION(batchid=${hiveconf:batchid})
SELECT 
station_id, 
COUNT(DISTINCT song_id) AS total_distinct_songs_played, 
COUNT(DISTINCT user_id) AS distinct_user_count
FROM enriched_data
WHERE status='pass'
AND batchid=${hiveconf:batchid}
AND like=1
GROUP BY station_id
ORDER BY total_distinct_songs_played DESC
LIMIT 3;


CREATE TABLE IF NOT EXISTS top_10_royalty_songs
(
song_id STRING,
duration INT
)
PARTITIONED BY (batchid INT)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

INSERT OVERWRITE TABLE top_10_royalty_songs
PARTITION(batchid=${hiveconf:batchid})
SELECT song_id,
SUM(ABS(CAST(end_ts AS DECIMAL(20,0))-CAST(start_ts AS DECIMAL(20,0)))) AS duration
FROM enriched_data
WHERE status='pass'
AND batchid=${hiveconf:batchid}
AND (like=1 OR song_end_type=0)
GROUP BY song_id
ORDER BY duration DESC
LIMIT 3;

create table top3Region
(
noOfUsers int,
geo_cd string
)
PARTITIONED BY (batchid INT)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

INSERT OVERWRITE TABLE top3Region
PARTITION(batchid=${hiveconf:batchid})
select COUNT(user_id) as num,geo_cd from enriched_data where status="pass" and batchid=${hiveconf:batchid} group by geo_cd order by num  desc limit 3;

create table top3Artists
(
noOfListeners int,
artist_id string
)
PARTITIONED BY (batchid INT)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

INSERT OVERWRITE TABLE top3Artists
PARTITION(batchid=${hiveconf:batchid})
select COUNT(user_id) as num,artist_id from enriched_data where status="pass" and batchid=${hiveconf:batchid} group by artist_id order by num desc limit 3;












