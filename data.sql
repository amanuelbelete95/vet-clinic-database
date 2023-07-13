INSERT INTO animal (animal_name,date_of_birth,escape_attempts,neutered,weigth_kg)
VALUES ('Agumon', DATE '2020-02-03',0,true,10.23);
INSERT INTO animal (animal_name,date_of_birth,escape_attempts,neutered,weigth_kg)
VALUES ('Gabumon', DATE '2018-11-15',2,true,8.00);
INSERT INTO animal (animal_name,date_of_birth,escape_attempts,neutered,weigth_kg)
VALUES ('Pikachu', DATE '2021-01-07',1,false,15.04);
INSERT INTO animal (animal_name,date_of_birth,escape_attempts,neutered,weigth_kg)
VALUES ('Devimon', DATE '2017-05-12',5,true,11.00);

/*Add new animal*/
INSERT INTO animal (animal_name,date_of_birth,escape_attempts,neutered,weigth_kg)
VALUES ('Charmander', DATE '2020-02-08',0,false,-11.00);
INSERT INTO animal (animal_name,date_of_birth,escape_attempts,neutered,weigth_kg)
VALUES ('Plantom', DATE '2021-11-15',2,true,-5.70);
INSERT INTO animal (animal_name,date_of_birth,escape_attempts,neutered,weigth_kg)
VALUES ('Squirtle', DATE '1993-04-02',3,false,-12.13);
INSERT INTO animal (animal_name,date_of_birth,escape_attempts,neutered,weigth_kg)
VALUES ('Angemon', DATE '2005-06-12',1,true,-45.00);
INSERT INTO animal (animal_name,date_of_birth,escape_attempts,neutered,weigth_kg)
VALUES ('Boarmon', DATE '2005-06-07',7,true,20.40);
INSERT INTO animal (animal_name,date_of_birth,escape_attempts,neutered,weigth_kg)
VALUES ('Blossom', DATE '1998-10-13',3,true,17.00);
INSERT INTO animal (animal_name,date_of_birth,escape_attempts,neutered,weigth_kg)
VALUES ('Ditto', DATE '2022-05-14',4,true,22.00);



INSERT INTO owner (full_name, age) 
VALUES ('Sam Smith', 34);
VALUES ('Jennifer Orwell',19);
VALUES ('Bob', 45);
VALUES ('Melody Pond', 77);
VALUES ('Dean Winchester', 14);
VALUES ('Jodie Whittaker',38);

INSERT INTO species (name_)
VALUES ('Pokemon');

INSERT INTO species (name_)
VALUES ('Digimon');

-- query and multiple table

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