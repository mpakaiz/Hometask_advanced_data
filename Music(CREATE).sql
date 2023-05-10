CREATE TABLE IF NOT EXISTS Genres (
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE NOT NULL 
);

CREATE TABLE IF NOT EXISTS Performers (
	performer_id SERIAL PRIMARY KEY,
	name VARCHAR(100) UNIQUE NOT NULL  
);

CREATE TABLE IF NOT EXISTS performer_genre (
	id SERIAL PRIMARY KEY,
	performer_id INTEGER NOT NULL REFERENCES Performers(performer_id),
	genre_id INTEGER NOT NULL REFERENCES Genres(genre_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	release_year INTEGER NOT NULL CHECK(release_year>1900)
);

CREATE TABLE IF NOT EXISTS Tracks (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	duration INTEGER NOT NULL CHECK(duration<1000),
	album_id INTEGER NOT NULL REFERENCES Albums(album_id)
);

CREATE TABLE IF NOT EXISTS album_performer (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES Albums(album_id),
	performer_id INTEGER NOT NULL REFERENCES Performers(performer_id)
);

CREATE TABLE IF NOT EXISTS Collections (
	collection_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	release_year INTEGER NOT NULL CHECK(release_year>1900)
);

CREATE TABLE IF NOT EXISTS tracks_collections (
	collection_id INTEGER NOT NULL REFERENCES Collections(collection_id),
	track_id INTEGER NOT NULL REFERENCES Tracks(track_id),
	CONSTRAINT pk PRIMARY KEY (collection_id, track_id)
);
