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
WHERE animal_name = 'Devimon' AND animal_name = 'Plantmon' ;