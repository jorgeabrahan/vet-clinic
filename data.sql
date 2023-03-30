/* Populate database with sample data. */

/* Insert animal Agumon */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, TRUE, 10.23);

/* Insert animal Gabumon */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, TRUE, 8);

/* Insert animal Pikachu */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, FALSE, 15.04);

/* Insert animal Devimon */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, TRUE, 11);

/* Insert animals */
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, FALSE, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, TRUE, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, TRUE, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, TRUE, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, TRUE, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, TRUE, 22);


/* Insert data into the owners table */
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);

INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);

INSERT INTO owners (full_name, age) VALUES ('Bob', 45);

INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);

INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);

INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

/* Insert data into the species table */
INSERT INTO species (name) VALUES ('Pokemon');

INSERT INTO species (name) VALUES ('Digimon');


/* 
Modify your inserted animals so it includes the species_id value:
- If the name ends in "mon" it will be Digimon
- All other animals are Pokemon
*/
UPDATE animals SET species_id = CASE WHEN animals.name LIKE '%mon'
THEN (SELECT id FROM species WHERE species.name = 'Digimon')
ELSE (SELECT id FROM species WHERE species.name = 'Pokemon')
END;

/*
Modify your inserted animals to include owner information (owner_id):
- Sam Smith owns Agumon.
*/
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Sam Smith')
WHERE animals.name = 'Agumon';
/* 
- Jennifer Orwell owns Gabumon and Pikachu.
*/
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Jennifer Orwell')
WHERE animals.name = 'Gabumon' OR animals.name = 'Pikachu';
/* 
- Bob owns Devimon and Plantmon.
*/
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Bob')
WHERE animals.name = 'Devimon' OR animals.name = 'Plantmon';
/*
- Melody Pond owns Charmander, Squirtle, and Blossom.
*/
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Melody Pond')
WHERE animals.name = 'Charmander' OR animals.name = 'Squirtle' OR animals.name = 'Blossom';
/*
- Dean Winchester owns Angemon and Boarmon.
*/
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Dean Winchester')
WHERE animals.name = 'Angemon' OR animals.name = 'Boarmon';
