INSERT INTO genres(genre_id, name) VALUES
(1, 'rock'),
(2, 'pop'),
(3, 'country'),
(4, 'folk'),
(5, 'blues'),
(6, 'latina'),
(7, 'jazz'),
(8, 'electronic'),
(9, 'rnb'),
(10, 'disco');

INSERT INTO performers(performer_id, name) VALUES
(1, 'Mick Jagger'),
(2, 'Michael Jackson'),
(3, 'Jay-Z'),
(4, 'Taylor Swift'),
(5, 'Johny Cash'),
(6, 'Bob Dylan'),
(7, 'Bon Iver'),
(8, 'Tom Waits'),
(9, 'Eric Clapton'),
(10, 'Ricky Martin'),
(11, 'Natti Natasha'),
(12, 'Ray Charles'),
(13, 'Frank Sinatra'),
(14, 'Daft Punk'),
(15, 'Depeche Mode'),
(16, 'The Weeknd'),
(17, 'Beyonce'),
(18, 'Boney M'),
(19,'Bee Gees')
;

INSERT INTO performer_genre (performer_id, genre_id) VALUES
(1, 1),
(2, 2),
(3, 9),
(4, 3),
(5, 3),
(6, 3),
(6, 4),
(7, 4),
(8, 5),
(9, 5),
(10, 6),
(11, 6),
(11, 2),
(12, 7),
(13, 7),
(14, 8),
(15, 8),
(16, 9),
(17, 9),
(18, 10),
(19, 10)
;

INSERT INTO albums(album_id, name, release_year) VALUES
(1, 'Wandering spirit', 1993),
(2, 'Bad 25', 2012),
(3, 'Kingdom Come', 2006),
(4, 'Speak Now', 2010),
(5, 'Folklore', 2020)
;

INSERT INTO album_performer(id, album_id, performer_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 4)
;

INSERT INTO tracks(track_id, name, duration, album_id) VALUES
(1, 'Use me', 268, 1),
(2, 'Wired All Night', 245, 1),
(3, 'Smooth Criminal', 258, 2),
(4, 'Dirty Diana', 281, 2),
(5, 'Lost one', 224, 3),
(6, 'Mine', 263, 4),
(7, 'Mean', 239, 4),
(8, 'Exile', 298, 5),
(9, 'Oh My God', 258, 3)
;

INSERT INTO collections(collection_id, name, release_year) VALUES
(1, 'Hits', 2013),
(2, 'Best pop', 2021),
(3, 'Only country', 2020),
(4, 'Best from Michael Jackson', 2015)

INSERT INTO tracks_collections(collection_id, track_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 2),
(2, 3),
(2, 6),
(2, 7),
(3, 6),
(3, 7),
(4, 3),
(4, 4)
;