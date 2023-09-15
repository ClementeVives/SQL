/*For this project, I downloaded Spotify data from Kaggle: https://www.kaggle.com/datasets/equinxx/spotify-top-50-songs-in-2021?select=spotify_top50_2021.csv.
Then I created a table to insert Spotify data into.
Finally, I performed analytics on the data using SQL*/

#Creating the table: 
CREATE TABLE BIT_DB.Spotifydata (
id integer PRIMARY KEY,
artist_name varchar NOT NULL,
track_name varchar NOT NULL,
track_id varchar NOT NULL,
popularity integer NOT NULL,
danceability decimal(4,3) NOT NULL,
energy decimal(4,3) NOT NULL,
key integer NOT NULL,
loudness decimal(5,3) NOT NULL,
mode integer NOT NULL,
speechiness decimal(5,4) NOT NULL,
acousticness decimal(6,5) NOT NULL,
instrumentalness text NOT NULL,
liveness decimal(5,4) NOT NULL,
valence decimal(4,3) NOT NULL,
tempo decimal(6,3) NOT NULL,
duration_ms integer NOT NULL,
time_signature integer NOT NULL 
);

/*Then I inserted the Spotify Data .csv into the table
Next, I explored the data using the following SQL*/

/*RETURN top 5 most popular songs*/
  
SELECT artist_name, track_name, popularity
FROM BIT_DB.Spotifydata
GROUP BY track_name
ORDER BY popularity desc
LIMIT 5;

/*RETURN AVG popularity, danceability, and energy by artist and track*/

SELECT artist_name ,track_name ,AVG(popularity) ,AVG(danceability) ,AVG(energy)
FROM BIT_DB.spotifydata
GROUP BY artist_name, track_name;

/*RETURN COUNT number of songs of each artist*/

SELECT artist_name, COUNT(artist_name) AS total_songs
FROM BIT_DB.Spotifydata
GROUP BY artist_name
ORDER BY total_songs desc;

/*RETURN type of melodic scale depending on the song mode*/

SELECT track_name,
CASE 
WHEN song_mode = 1 THEN "Major"
ELSE "Minor"
END AS "type_of_scale"
FROM BIT_DB.Spotifydata
GROUP BY track_name;

/*RETURN duration of each song in minutes*/

SELECT track_name, ROUND(duration_ms*0.001/60,2) AS duration_min
FROM BIT_DB.Spotifydata;

/*RETURN SUM of the duration of all songs in minutes*/

SELECT ROUND(SUM((duration_ms)*0.001)/60,2) AS Total_min
FROM BIT_DB.Spotifydata;
