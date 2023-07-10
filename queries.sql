/*Queries that provide answers to the questions from all projects.*/
SELECT * FROM animal WHERE EXTRACT (YEAR FROM date_of_birth) BETWEEN 2016 AND 2019
ORDER BY date_of_birth;