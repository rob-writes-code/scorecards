-- clubs table

DROP TABLE IF EXISTS clubs CASCADE; 
DROP SEQUENCE IF EXISTS clubs_id_seq CASCADE;

CREATE SEQUENCE IF NOT EXISTS clubs_id_seq;
CREATE TABLE clubs (
    id SERIAL PRIMARY KEY,
    club_name VARCHAR(100),
    club_address VARCHAR(100),
    club_email VARCHAR(100),
    account_username VARCHAR(100),
    account_password VARCHAR(100)
);

INSERT INTO clubs (club_name, club_address, club_email, account_username, account_password) VALUES 
('Academy', 'The Park, Daventry Road, Knowle, Bristol BS4 1DQ', 'academybc@gmail.com', 'academy_bc', 'test123'),
('Broadlands', 'Oasis Academy, Hungerford Rd, Brislington, Bristol BS4 5EY', 'broadlands@outlook.com', 'broadlands_bc', 'example1'),
('Avon Jets', 'Bradley Stoke Community School, Fiddlers Wood Lane, Bradley Stoke, Bristol, BS32 9BS', 'avon.jets@gmail.com', 'avon_jets', 'password123');


-- divisions table

DROP TABLE IF EXISTS divisions CASCADE;
DROP SEQUENCE IF EXISTS divisions_id_seq CASCADE;

CREATE SEQUENCE IF NOT EXISTS divisions_id_seq;
CREATE TABLE divisions (
    id SERIAL PRIMARY KEY,
    league VARCHAR(50),
    division_number INTEGER
);

INSERT INTO divisions (league, division_number) VALUES 
('Open', 1),
('Open', 2),
('Open', 3),
('Open', 4),
('Open', 5),
('Open', 6),
('Open', 7),
('Women''s', 1),
('Women''s', 2),
('Women''s', 3),
('Women''s', 4),
('Mixed', 1),
('Mixed', 2),
('Mixed', 3),
('Mixed', 4),
('Mixed', 5);

-- teams table

DROP TABLE IF EXISTS teams CASCADE;
DROP SEQUENCE IF EXISTS teams_id_seq CASCADE;

CREATE SEQUENCE IF NOT EXISTS teams_id_seq;
CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(100),
    discipline VARCHAR(1),
    club_id INTEGER,
    division_id INTEGER,
    CONSTRAINT fk_teams_clubs FOREIGN KEY(club_id) 
    REFERENCES clubs(id) ON DELETE CASCADE,
    CONSTRAINT fk_teams_divisions FOREIGN KEY(division_id) 
    REFERENCES divisions(id) ON DELETE CASCADE
);

INSERT INTO teams (team_name, discipline, club_id, division_id) VALUES 
('Academy Open 1', 'O', 1, 4),
('Academy Open 2', 'O', 1, 5),
('Broadlands Open 1', 'O', 2, 3),
('Avon Jets Mixed 1', 'X', 3, 14),
('Avon Jets Women''s 1', 'W', 3, 9);



