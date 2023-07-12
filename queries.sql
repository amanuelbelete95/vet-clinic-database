/*Queries name end-char */ 
SELECT * FROM animal WHERE animal_name LIKE '%mon';

/*Queries animal by date of birth*/
SELECT * FROM animal WHERE EXTRACT (YEAR FROM date_of_birth) BETWEEN 2016 AND 2019 ORDER BY date_of_birth;

/*Queries animal by neutered and escape attempts*/
SELECT * FROM animal WHERE neutered = true AND escape_attempts < 3;

/*Queries animal by specific name*/
SELECT * FROM animal WHERE animal_name = 'Agumon' OR animal_name = 'Pikachu' ORDER BY animal_name;
/*Queries animal by neutered and weigth*/

SELECT * FROM animal WHERE neutered = true AND weigth_kg > 10.5;
/*Queries animal that neutered*/

SELECT * FROM animal WHERE neutered = true;
/* Queries animal specific animal name*/
SELECT * FROM animal WHERE animal_name = 'Gabumon';
/*Queries animal  by weigth*/
SELECT * FROM animal WHERE weight >= 10.4 AND weight <= 17.3;

/*transaction */
BEGIN;
UPDATE animal SET species = 'digimon'
WHERE animal_name LIKE '%mon';

UPDATE animal SET species = 'pokemon'
WHERE species IS NULL;

/*transaction delete all table data*/

BEGIN;
DELETE FROM animal;
ROLLBACK;

/*delete specified date*/

BEGIN;
DELETE FROM animal WHERE date_of_birth > DATE '2022-01-01';

/*CREATE SAVEPOINT*/
SAVEPOINT SP1;
UPDATE animal SET weigth_kg = weigth_kg * -1 ORDER BY id;
ROLLBACK SP1;

/*Count */
SELECT COUNT(*) FROM animal;

SELECT COUNT(animal_name)
FROM animal
WHERE escape_attempts = 0;

SELECT AVG(weigth_kg) FROM animal;

SELECT AVG(escape_attempts)
FROM animal
WHERE date_of_birth BETWEEN DATE '1990-01-01' AND DATE '2000-01-01';

SELECT COUNT(neutered) FROM animal
WHERE neutered = true;

SELECT COUNT(neutered) FROM animal
WHERE neutered = false;

-- third pull reques
UPDATE animal
SET species_id = (
  SELECT id
  FROM species
  WHERE species.name_= 'Digimon'
  LIMIT 1
)
WHERE animal_name LIKE '%mon';

UPDATE animal
SET species_id = (
  SELECT id
  FROM species
  WHERE species.name = 'Pokemon'
)
WHERE animal.name_ NOT LIKE '%mon';

Sam Smith owns Agumon.

UPDATE animal
SET owner_id = (
  SELECT id
  FROM owner
  WHERE owner.full_name = 'Sam Smith';
)
WHERE animal_name = 'Agumon';

UPDATE animal
SET owner_id = (
  SELECT id
  FROM owner
  WHERE owner.full_name = 'Jennifer Orwell'
)
WHERE animal_name = 'Gabumon' OR animal_name = 'Pikachu' ;

UPDATE animal
SET owner_id = (
  SELECT id
  FROM owner
  WHERE owner.full_name = 'Bob'
)
WHERE animal_name = 'Devimon' OR animal_name = 'Plantmon' ;

UPDATE animal
SET owner_id = (
  SELECT id
  FROM owner
  WHERE owner.full_name = 'Melody Pond'
)
WHERE animal_name = 'Charmander' OR animal_name = 'Squirtle' OR animal_name = 'Blossom';

UPDATE animal
SET owner_id = (
  SELECT id
  FROM owner
  WHERE owner.full_name = 'Dean Winchester'
)
WHERE animal_name = 'Angemon' OR animal_name = 'Boarmon';
-- What animals belong to Melody Pond?
SELECT animal_name
FROM animal
JOIN owner
ON animal.owner_id = owner.id
WHERE owner.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).

SELECT animal_name
FROM animal
JOIN species 
ON animal.species_id = species.id
WHERE species.name_ = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owner.full_name, animal.animal_name
FROM animal
LEFT JOIN owner ON animal.owner_id = owner.id;

-- How many animals are there per species?
SELECT species.name_, COUNT(animal_name)
FROM animal
JOIN species ON animal.species_id = species.id
GROUP BY species.name_;

-- List all Digimon owned by Jennifer Orwell.

SELECT species.name_, COUNT(*)
FROM animal
JOIN species ON animal.species_id = species.id
JOIN owner ON animal.owner_id = owner.id
WHERE species.name_ = 'Digimon'
AND owner.full_name = 'Jennifer Orwell'
GROUP BY species.name_;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animal_name
FROM animal
JOIN owner ON animal.owner_id = owner.id
WHERE owner.full_name = 'Dean Winchester'
AND escape_attempts = 0;

-- Who owns the most animals?
SELECT full_name, COUNT(*)
FROM animal
JOIN owner ON animal.owner_id = owner.id
GROUP BY full_name
ORDER BY COUNT(*) DESC
LIMIT 1;