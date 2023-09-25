-- The job of this file is to reset all of our important database tables.
-- And add any data that is needed for the tests to run.
-- This is so that our tests, and application, are always operating from a fresh
-- database state, and that tests don't interfere with each other.

-- First, we must delete (drop) all our tables
DROP TABLE IF EXISTS clubs;
DROP SEQUENCE IF EXISTS clubs_id_seq;

-- Then, we recreate them
CREATE SEQUENCE IF NOT EXISTS clubs_id_seq;
CREATE TABLE clubs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(100),
    email VARCHAR(100),
    account_username VARCHAR(100),
    account_password VARCHAR(100)
);

-- Finally, we add any records that are needed for the tests to run
INSERT INTO clubs (name, address, email, account_username, account_password) VALUES 
('Academy', 'The Park, Daventry Road, Knowle, Bristol BS4 1DQ', 'academybc@gmail.com', 'academy_bc', 'test123'),
('Broadlands', 'Oasis Academy, Brislington', 'broadlands@outlook.com', 'broadlands_bc', 'example1'),
('Avon Jets', 'Thornbury', 'avon.jets@gmail.com', 'avon_jets', 'password123');


