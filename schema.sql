/* Database schema to keep the structure of entire database. */

/* Create a database named vet_clinic */
CREATE DATABASE vet_clinic;

/* Connect to database vet_clinic */
\c vet_clinic

/* Create table animals inside the vet_clinic database */
CREATE TABLE animals(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(250),
	date_of_birth DATE,
	escape_attempts INT,
	neutered BOOLEAN,
	weight_kg DECIMAL,
	PRIMARY KEY(id)
);

/* Add a column species of type string to the animals table */
ALTER TABLE animals ADD species VARCHAR(250);

/* Create a table named owners */
CREATE TABLE owners(
	id INT GENERATED ALWAYS AS IDENTITY,
	full_name VARCHAR(250),
	age INT,
	PRIMARY KEY(id)
);

/* Create a table named species */
CREATE TABLE species(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(250),
	PRIMARY KEY(id)
);

/* Modify animals table:
- Remove column species
*/
ALTER TABLE animals DROP COLUMN species;
/*
- Add column species_id which is a foreign key referencing species table
*/
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);
/* 
- Add column owner_id which is a foreign key referencing the owners table
*/
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

/* Create a table named vets: */
CREATE TABLE vets(
	id INT GENERATED ALWAYS AS IDENTITY,
	name VARCHAR(250),
	age INT,
	date_of_graduation DATE,
	PRIMARY KEY(id)
);

/*
There is a many-to-many relationship between the tables species and vets: a vet can specialize in multiple species, and a species can have multiple vets specialized in it. Create a "join table" called specializations to handle this relationship.
*/
CREATE TABLE specializations(
	id GENERATED ALWAYS AS IDENTITY,
	vets_id INT,
	species_id INT,
	CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON DELETE CASCADE,
	CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE,
	PRIMARY KEY(id)
);

/*
There is a many-to-many relationship between the tables animals and vets: an animal can visit multiple vets and one vet can be visited by multiple animals. Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.
*/
CREATE TABLE visits(
	id INT GENERATED ALWAYS AS IDENTITY,
	visit_date DATE,
	vets_id INT,
	animals_id INT,
	CONSTRAINT fk_vets_visits FOREIGN KEY(vets_id) REFERENCES vets(id) ON DELETE CASCADE,
	CONSTRAINT fk_animals_visits FOREIGN KEY(animals_id) REFERENCES animals(id) ON DELETE CASCADE,PRIMARY KEY(id)
);
