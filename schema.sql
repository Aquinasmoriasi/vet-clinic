/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    species varchar(100),
    PRIMARY KEY(id)
);

CREATE TABLE owners (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(100) NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id) ON DELETE CASCADE;
ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id) ON DELETE CASCADE;

CREATE TABLE vets (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(100) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    species_id INTEGER REFERENCES species (id), 
    vet_id INTEGER REFERENCES vets (id)
);

CREATE TABLE visits (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    animals_id INTEGER REFERENCES animals (id), 
    vet_id INTEGER REFERENCES vets (id),
    date_of_visit DATE NOT NULL 
);
