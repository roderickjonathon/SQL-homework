DROP TABLE lightsabers;
DROP TABLE characters;
  -- the order of drops is important as lightsabers relies on characters



CREATE TABLE characters (
  id SERIAL8 PRIMARY KEY, -- primary key will stoop the ID number being changed
  name VARCHAR(255),
  age  INT,
  darkside boolean
);

CREATE TABLE lightsabers (
 id SERIAL8 PRIMARY KEY,
 hilt_metal VARCHAR(255) NOT NULL,
 colour VARCHAR(255) NOT NULL,
 character_id INT8 REFERENCES characters(id) -- try to keep similar/same name when referencing another table.

);

INSERT INTO characters (name, age, darkside) VALUES ('Obi-Wan', 27, false);
INSERT INTO characters (name, age, darkside) VALUES ('Anakin', 19, false);
INSERT INTO characters (name, age, darkside) VALUES ('Darth Maul', 32, true);
INSERT INTO characters (name, age, darkside) VALUES ('Luke Skywalker', 17, false);
INSERT INTO characters (name, age, darkside) VALUES ('Stormtrooper', 25, true);
INSERT INTO characters (name, age, darkside) VALUES ('Stormtrooper', 25, true);
INSERT INTO characters (name, age, darkside) VALUES ('Stormtrooper', 25, true);
INSERT INTO characters (name, age, darkside) VALUES ('Stormtrooper', 25, true);
INSERT INTO characters (name, age, darkside) VALUES ('Stormtrooper', 25, true);

INSERT INTO lightsabers (hilt_metal, colour, character_id) VALUES ('palladium', 'green', 1);
INSERT INTO lightsabers (hilt_metal, colour, character_id) VALUES ('gold', 'red', 2);
INSERT INTO lightsabers (hilt_metal, colour, character_id) VALUES ('gold', 'cyan', 2);

UPDATE characters SET darkside = true WHERE name = 'Anakin';
-- changing 1 value
UPDATE characters SET age = 65 WHERE name = 'Obi-Wan';
-- changing data by name
UPDATE characters SET age = 65 WHERE id = 7;
-- changing data by ID number.

UPDATE characters SET (name, darkside) = ('Darth Vader', true) WHERE name = 'Anakin';
-- changing multiple values at the same time, WHERE specifies the target to be updated

DELETE FROM characters WHERE name = 'Darth Maul';
-- removes entry WHERE you set target, without target it removes all entries.

-- SELECT * FROM characters ORDER BY id;
SELECT * FROM lightsabers WHERE character_id = 2
-- give table back in terminal
-- SELECT * FROM characters ORDER by name, age;
--  used to select the order of how it sorts
-- SELECT name * FROM characters;
--        ^ will just return names
--
-- SELECT COUNT(*) FROM characters;
--           ^ will return number of items in table
