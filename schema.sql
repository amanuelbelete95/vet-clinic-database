CREATE TABLE animal  (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  animal_name TEXT NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT NOT NULL,
  neutered BOOLEAN NOT NULL,
  weigth_kg DECIMAL NOT NULL
);