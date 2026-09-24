-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);


SELECT DISTINCT artist FROM spotify;
/*
Retrieve the names of all tracks that have more than 1 billion streams.
List all albums along with their respective artists.
Get the total number of comments for tracks where licensed = TRUE.
Find all tracks that belong to the album type single.
Count the total number of tracks by each artist.
*/


-- Q1) Retrieve the names of all tracks that have more than 1 billion streams.
SELECT * FROM spotify 
WHERE stream > 1000000000;

-- Q2) List all albums along with their respective artists.
SELECT DISTINCT album,artist FROM spotify 
ORDER BY 1;

-- Q3) Get the total number of comments for tracks where licensed = TRUE.
SELECT sum(comments) as total_comments FROM spotify
WHERE licensed = 'true';

-- Q4) Find all tracks that belong to the album type single.
SELECT * FROM spotify
WHERE album_type ILIKE 'single';

-- Q5) Count the total number of tracks by each artist.
SELECT artist , COUNT(*) as total_tracks FROM spotify
GROUP BY artist
ORDER BY 2 ASC; 

/*
Calculate the average danceability of tracks in each album.
Find the top 5 tracks with the highest energy values.
List all tracks along with their views and likes where official_video = TRUE.
For each album, calculate the total views of all associated tracks.
Retrieve the track names that have been streamed on Spotify more than YouTube.
*/


-- Q6)Calculate the average danceability of tracks in each album.
SELECT album,avg(danceability) as avg_danceability FROM spotify
GROUP BY 1
ORDER BY 2 DESC;

-- Q7)Find the top 5 tracks with the highest energy values.
SELECT track,MAX(energy) FROM spotify
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- Q8)List all tracks along with their views and likes where official_video = TRUE.
SELECT track, sum(views) as total_views, SUM(likes) as total_likes FROM spotify
WHERE official_video = 'true'
GROUP BY 1
ORDER BY 2 DESC;

-- Q9)For each album, calculate the total views of all associated tracks.
SELECT album ,track, sum(views) as total_views FROM spotify
GROUP BY 1,2
ORDER BY 3 DESC;

-- Q10)Retrieve the track names that have been streamed on Spotify more than YouTube.
SELECT * FROM
(
    SELECT
        track,
        -- most_played_on,
        COALESCE(SUM(CASE WHEN most_played_on = 'Youtube' THEN stream END),0) AS streamed_on_youtube,
        COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream END),0) AS streamed_on_spotify
    FROM spotify
    GROUP BY 1
) AS t1
WHERE
    streamed_on_spotify > streamed_on_youtube
    AND
    streamed_on_youtube <> 0;







-- Q11) Find the top 3 most-viewed tracks for each artist using window functions.
-- Q12) Write a query to find tracks where the liveness score is above the average.
-- Q13) Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
-- Q14) Find tracks where the energy-to-liveness ratio is greater than 1.2.
-- Q15) Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.












