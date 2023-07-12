CREATE TABLE animal  (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  animal_name TEXT NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT NOT NULL,
  neutered BOOLEAN NOT NULL,
  weigth_kg DECIMAL NOT NULL
);
ALTER TABLE animal
ADD species TEXT;

--owner TABLE

CREATE TABLE owner  (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  full_name TEXT NOT NULL,
  age INT NOT NULL
);

-- species TABLE

CREATE TABLE species  (
  id BIGSERIAL PRIMARY KEY NOT NULL,
  name_ TEXT NOT NULL
);
