CREATE DATABASE csci12db;

USE csci12db;

CREATE TABLE genres (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    imageUrl VARCHAR(200) NOT NULL,
    description VARCHAR(300) NOT NULL, 
    PRIMARY KEY (Id)
);

CREATE TABLE games(
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    genreId INT NOT NULL,
    imageUrl VARCHAR(200) NOT NULL,
    detailUrl VARCHAR(200) NOT NULL,
    PRIMARY KEY (Id)
);

ALTER TABLE games
ADD FOREIGN KEY (genreId) REFERENCES genres(id);

INSERT INTO genres(id, name, imageUrl, description) VALUES (1, 'First Person Shooter', '/photos/fps_background_image_3.jpg', '');
INSERT INTO genres(id, name, imageUrl, description) VALUES (2, 'Action / Adventure', '/photos/action_adventure_background_image.jpg', '');
INSERT INTO genres(id, name, imageUrl, description) VALUES (3, 'Sports', '/photos/sports_background_image.jpg', '');
INSERT INTO genres(id, name, imageUrl, description) VALUES (4, 'Puzzle', '/photos/puzzle_background_image.jpg', '');
INSERT INTO genres(id, name, imageUrl, description) VALUES (5, 'Survival', '/photos/survival_background_image.jpeg', '');
INSERT INTO genres(id, name, imageUrl, description) VALUES (6, 'MMO', '/photos/mmo_background_image.webp', '');

INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (1, 'Black Ops', 1, '/photos/black_ops_background_image.jpg', '');
INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (2, 'Halo 3', 1, '/photos/halo3_background_image.jpg', '');
INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (3, 'Halo 3: ODST', 1, '/photos/halo_odst_background_image.jpg', '');
INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (4, 'Modern Warfare', 1, '/photos/cod4_background_image.jpg', '');

INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (5, 'Batman: Arkham', 2, '/photos/arkham_knight_background_image.jpg', '');
INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (6, 'Uncharted 3', 2, '/photos/uncharted3_background_image.jpg', '');

INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (7, 'FIFA 15', 3, '/photos/fifa15_background_image.jpg', '');
INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (8, 'NBA 2K16', 3, '/photos/nba2k16_background_image.jpg', '');
INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (9, 'Super Mario Strikers', 3, '/photos/supermariostrikers_background_image.png', '');

INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (10, 'Portal 2', 4, '/photos/portal2_background_image.jpeg', '');
INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (11, 'Call of the Sea', 4, '/photos/call_of_the_sea_background_image.png', '');
INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (12, 'LittleBigPlanet3', 4, '/photos/littlebigplanet_3_background_image.avif', '');

INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (13, 'Minecraft', 5, '/photos/minecraft_background_image.webp', '');
INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (14, 'DayZ', 5, '/photos/dayz_background_image.jpg', '');

INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (15, 'World of Warcraft', 6, '/photos/wow_background_image.jpg', '');
INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (16, 'Dungeons and Dragons Online', 6, '/photos/ddo_background_image.jpg', '');
INSERT INTO games(id, name, genreId, imageUrl, detailUrl) VALUES (17, 'Elder Scrolls Online', 6, '/photos/eso_background_image.avif', '');