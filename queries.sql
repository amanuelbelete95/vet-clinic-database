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
