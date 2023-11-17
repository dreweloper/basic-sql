-- Create database
CREATE DATABASE practice
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Create "artists" table
CREATE TABLE artists (
    artist_id serial PRIMARY KEY,
    name varchar(255) NOT NULL
);

-- Create "albums" table
CREATE TABLE albums (
    album_id serial PRIMARY KEY,
    title varchar(255) NOT NULL,
    artist_id int,
    CONSTRAINT FK_artists
        FOREIGN KEY (artist_id)
            REFERENCES artists(artist_id)
                ON DELETE CASCADE
);

-- Insert default artists
INSERT INTO artists(name)
VALUES
('Turnstile'),
('Deftones'),
('Foals'),
('Bloc Party');

-- Insert default albums
INSERT INTO albums(title, artist_id)
VALUES
('Glow On', 1),
('White Pony', 2),
('What Went Wrong', 3),
('Silent Alarm', 4),
('Everything Not Saved Will Be Lost Part II', 3);