# 🎵 Spotify Music Analytics — SQL Project

## 📌 Overview

This project analyzes Spotify music data using SQL to explore **track performance, artist popularity, album characteristics, streaming behavior, and audience engagement**.

The project focuses on solving real-world analytical questions using SQL concepts ranging from basic filtering and aggregation to more advanced techniques such as **subqueries, conditional aggregation, CTEs, and window functions**.

---

## 🎯 Project Objectives

The main objectives of this project are to:

- Analyze music streaming performance.
- Identify highly streamed tracks.
- Compare Spotify and YouTube streaming behavior.
- Analyze artist and album performance.
- Examine track characteristics such as energy, danceability, and liveness.
- Analyze views, likes, and comments.
- Practice advanced SQL techniques used in data analytics.

---

## 🗂️ Dataset

The dataset contains information about Spotify tracks and their performance across streaming platforms.

### Main Columns

| Column | Description |
|---|---|
| `artist` | Name of the artist |
| `track` | Track name |
| `album` | Album name |
| `album_type` | Album, single, etc. |
| `danceability` | Danceability score of the track |
| `energy` | Energy score of the track |
| `loudness` | Loudness of the track |
| `speechiness` | Speechiness score |
| `acousticness` | Acousticness score |
| `instrumentalness` | Instrumentalness score |
| `liveness` | Liveness score |
| `valence` | Musical positivity score |
| `tempo` | Track tempo |
| `duration_min` | Track duration in minutes |
| `views` | Number of views |
| `likes` | Number of likes |
| `comments` | Number of comments |
| `licensed` | Whether the track is licensed |
| `official_video` | Whether the video is an official video |
| `stream` | Number of streams |
| `most_played_on` | Platform where the track was most played |

---

## 🛠️ Technologies Used

- **SQL**
- **PostgreSQL**
- **Git & GitHub**

---

## 📚 SQL Concepts Used

This project covers a range of SQL concepts:

### Basic SQL

- `SELECT`
- `WHERE`
- `DISTINCT`
- `ORDER BY`
- `LIMIT`

### Aggregations

- `COUNT()`
- `SUM()`
- `AVG()`
- `MAX()`
- `MIN()`

### Grouping

- `GROUP BY`

### Conditional Logic

- `CASE WHEN`
- `COALESCE()`

### Intermediate / Advanced SQL

- Subqueries
- Common Table Expressions (`WITH`)
- Window Functions
- `DENSE_RANK()`
- `PARTITION BY`

---

## 🔍 Analysis Performed

### 1. High-Streaming Tracks

Identified tracks with more than **1 billion streams**.

### 2. Artist & Album Analysis

Analyzed the relationship between artists and their albums and calculated the number of tracks associated with each artist.

### 3. Engagement Analysis

Analyzed:

- Views
- Likes
- Comments
- Streaming counts

to understand track engagement.

### 4. Album Analysis

Calculated average danceability and energy ranges across albums.

### 5. Platform Comparison

Compared streaming performance between **Spotify and YouTube** using conditional aggregation.

### 6. Artist Ranking

Used SQL window functions to rank tracks based on views within each artist.

### 7. Audio Characteristics

Analyzed characteristics such as:

- Energy
- Danceability
- Liveness

and compared tracks against dataset-level averages.

---

## 💻 Example SQL Queries

### Find tracks with more than 1 billion streams

```sql
SELECT *
FROM spotify
WHERE stream > 1000000000;
