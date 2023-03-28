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