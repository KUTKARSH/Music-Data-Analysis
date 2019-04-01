from random import randint
from random import choice

#open file W(where log is written) in write mode  
file = open("/home/cloudera/utkarsh/project/data/mob/file.txt", "w")
count = 20

while (count > 0):
	geo_cd_list=["A", "E", "AU", "AP", "U"]
	song_end_type_list=["0","1","2","3"]
	timestamp_list=["1465230523", "1465130523", "1475130523", "1495130523"]#When record was generated
	start_ts_list=["1465230523", "1465130523", "1475130523", "1485130523"]#When the song started to play
	end_ts_list=["1465230523", "1465130523", "1475130523", "1485130523"]#When the song stopped
 
	if (count%15 == 0):#for every 15th element userid will be ignored
		user_id = ""
	else:
		user_id = "U" + str(randint(100,120))#any number will be added with "U" from 100 to 120

	song_id = "S" + str(randint(200,210))

	if (count%11 == 0):#for every 11th element artist id will be ignored
		artist_id = ""
	else:
		artist_id = "A" + str(randint(300,305))

	timestamp = choice(timestamp_list)
	start_ts = choice(start_ts_list)
	end_ts = choice(end_ts_list)

	if (count%12 == 0):#for every 12th element artist id will be ignored
		geo_cd = ""
	else:
		geo_cd = choice(geo_cd_list)

	station_id = "ST" + str(randint(400,415))
	song_end_type = choice(song_end_type_list)
	like = str(randint(0,1))
	dislike = str(randint(0,1))

	file.write("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n" % (user_id, song_id, artist_id, timestamp, start_ts, end_ts, geo_cd, station_id, song_end_type, like, dislike))

	count = count-1

file.close()

