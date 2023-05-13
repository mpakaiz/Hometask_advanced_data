-- TASK 2

--Название и продолжительность самого длительного трека.
SELECT name, duration FROM tracks
WHERE duration = (SELECT MAX(duration) FROM tracks);

--Название треков, продолжительность которых не менее 3,5 минут.
SELECT name, duration FROM tracks
WHERE duration >= 210;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT name FROM collections 
WHERE release_year BETWEEN 2018 AND 2020;

--Исполнители, чьё имя состоит из одного слова.
SELECT name FROM performers
WHERE name NOT LIKE '% %';

--Название треков, которые содержат слово «мой» или «my» (var_1).
SELECT name FROM tracks
WHERE string_to_array(lower(name), ' ') && ARRAY['my', 'мой'];

--Название треков, которые содержат слово «мой» или «my» (var_2).
SELECT name FROM tracks
WHERE name ~* '.*my\M.*' OR name ~* '.*мой\M.*'

-- TASK 3

--Количество исполнителей в каждом жанре.
SELECT name, COUNT(name) FROM genres g
LEFT JOIN performer_genre pg ON g.genre_id = pg.genre_id
GROUP BY name;

--Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT COUNT(release_year) FROM tracks t 
JOIN albums a ON t.album_id = a.album_id
WHERE release_year BETWEEN 2019 AND 2020;

--Средняя продолжительность треков по каждому альбому.
SELECT a.name, AVG(duration) FROM albums a 
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.name;

--Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT p.name
FROM performers p
WHERE p.name NOT IN (
	SELECT p.name
	FROM performers p
	JOIN album_performer ap ON p.performer_id = ap.performer_id
	JOIN albums ON ap.album_id = albums.album_id  
	WHERE albums.release_year = 2020);
	
--Названия сборников, в которых присутствует конкретный исполнитель (Michael Jackson).
SELECT c.name FROM collections c
JOIN tracks_collections tc ON c.collection_id = tc.collection_id
JOIN tracks ON tc.track_id = tracks.track_id
JOIN albums ON tracks.album_id = albums.album_id
JOIN album_performer ON albums.album_id = album_performer.album_id
JOIN performers ON album_performer.performer_id = performers.performer_id
WHERE performers.name LIKE 'Michael Jackson';

-- TASK 4

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT performers.name FROM albums a
JOIN album_performer ap ON a.album_id = ap.album_id
JOIN performers ON ap.performer_id = performers.performer_id
JOIN performer_genre ON performers.performer_id = performer_genre.performer_id
JOIN genres ON performer_genre.genre_id = genres.genre_id
GROUP BY performers.name
HAVING COUNT(*) > 1;

--Наименования треков, которые не входят в сборники.
SELECT t.name FROM tracks t
LEFT JOIN tracks_collections tc ON t.track_id = tc.track_id
LEFT JOIN collections ON tc.collection_id = collections.collection_id
WHERE collections.name IS NULL;

--Исполнитель или исполнители, написавшие самый короткий по продолжительности трек.
SELECT tracks.name FROM performers p
JOIN album_performer ap ON p.performer_id = ap.performer_id
JOIN albums ON ap.album_id = albums.album_id
JOIN tracks ON albums.album_id = tracks.album_id
WHERE tracks.duration = (SELECT MIN(tracks.duration) FROM tracks);

--Названия альбомов, содержащих наименьшее количество треков.
SELECT a.name FROM albums a
JOIN tracks t ON a.album_id = t.album_id
GROUP BY a.album_id
HAVING COUNT(t.track_id) = (
	SELECT COUNT(track_id) FROM tracks
	GROUP BY album_id
	ORDER BY 1
	LIMIT 1
);