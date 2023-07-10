/*Queries animal by date of birth*/
SELECT * FROM animal 
WHERE EXTRACT (YEAR FROM date_of_birth) BETWEEN 2016 AND 2019
ORDER BY date_of_birth;
/*Queries animal by neutered and escape attempts*/
SELECT * FROM animal WHERE neutered = true AND escape_attempts < 3;
