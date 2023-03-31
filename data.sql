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


/*
Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
*/
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
/*
Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
*/
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
/*
Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
*/
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
/*
Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
*/
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

/*
Insert the following data for specialties:
- Vet William Tatcher is specialized in Pokemon.
*/
INSERT INTO specializations (vets_id, species_id) VALUES ((SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM species WHERE species.name = 'Pokemon'));
/*
- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
*/
INSERT INTO specializations (vets_id, species_id) VALUES ((SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Digimon'));
INSERT INTO specializations (vets_id, species_id) VALUES ((SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM species WHERE species.name = 'Pokemon'));
/*
- Vet Jack Harkness is specialized in Digimon.
*/
INSERT INTO specializations (vets_id, species_id) VALUES ((SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM species WHERE species.name = 'Digimon'));


/*
- Agumon visited William Tatcher on May 24th, 2020.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2020-05-24', (SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM animals WHERE animals.name = 'Agumon'));
/*
- Agumon visited Stephanie Mendez on Jul 22th, 2020.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2020-07-22', (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE animals.name = 'Agumon'));
/*
- Gabumon visited Jack Harkness on Feb 2nd, 2021.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2021-02-02', (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Gabumon'));
/*
- Pikachu visited Maisy Smith on Jan 5th, 2020.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2020-01-05', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Pikachu'));
/*
- Pikachu visited Maisy Smith on Mar 8th, 2020.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2020-03-08', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Pikachu'));
/*
- Pikachu visited Maisy Smith on May 14th, 2020.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2020-05-14', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Pikachu'));
/*
- Devimon visited Stephanie Mendez on May 4th, 2021.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2021-05-04', (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE animals.name = 'Devimon'));
/*
- Charmander visited Jack Harkness on Feb 24th, 2021.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2021-02-24', (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Charmander'));
/* 
- Plantmon visited Maisy Smith on Dec 21st, 2019.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2019-12-21', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Plantmon'));
/*
- Plantmon visited William Tatcher on Aug 10th, 2020.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2020-08-10', (SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM animals WHERE animals.name = 'Plantmon'));
/*
- Plantmon visited Maisy Smith on Apr 7th, 2021.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2021-04-07', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Plantmon'));
/*
- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2019-09-29', (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE animals.name = 'Squirtle'));
/*
- Angemon visited Jack Harkness on Oct 3rd, 2020.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2020-10-03', (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Angemon'));
/*
- Angemon visited Jack Harkness on Nov 4th, 2020.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2020-11-04', (SELECT id FROM vets WHERE vets.name = 'Jack Harkness'), (SELECT id FROM animals WHERE animals.name = 'Angemon'));
/*
- Boarmon visited Maisy Smith on Jan 24th, 2019.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2019-02-24', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon'));
/*
- Boarmon visited Maisy Smith on May 15th, 2019.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2019-05-15', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon'));
/*
- Boarmon visited Maisy Smith on Feb 27th, 2020.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2020-02-27', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon'));
/*
- Boarmon visited Maisy Smith on Aug 3rd, 2020.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2020-08-03', (SELECT id FROM vets WHERE vets.name = 'Maisy Smith'), (SELECT id FROM animals WHERE animals.name = 'Boarmon'));
/*
- Blossom visited Stephanie Mendez on May 24th, 2020.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2020-05-24', (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez'), (SELECT id FROM animals WHERE animals.name = 'Blossom'));
/*
- Blossom visited William Tatcher on Jan 11th, 2021.
*/
INSERT INTO visits (visit_date, vets_id, animals_id) VALUES ('2021-01-11', (SELECT id FROM vets WHERE vets.name = 'William Tatcher'), (SELECT id FROM animals WHERE animals.name = 'Blossom'));
