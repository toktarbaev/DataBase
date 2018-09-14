CREATE DATABASE Lab_2;

CREATE TABLE countries(
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR(50),
  region_id INT,
  population INT
);

INSERT INTO countries VALUES (DEFAULT, 'Kyrgyzstan', 34, 342315135);
INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, 'Uzbekistan');
INSERT INTO countries (region_id) VALUES (NULL);
INSERT INTO countries (country_id, country_name, region_id, population) VALUES (DEFAULT, 'USA', 21, 4390428),
                                                                               (DEFAULT, 'Russia', 32, 43426235),
                                                                               (DEFAULT, 'China', 12, 2523161);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries VALUES (7, DEFAULT, 48, 17500000);
INSERT INTO countries (country_id, country_name) VALUES (DEFAULT, DEFAULT);

CREATE TABLE countries_new(
  LIKE countries
);

INSERT INTO countries_new
SELECT * FROM countries;

SELECT * FROM countries_new;

UPDATE countries_new SET region_id = 1 WHERE region_id IS NULL;
UPDATE countries_new SET population = population + (population*0.1) RETURNING country_name, population AS "New popuation";

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries_new AS cn USING countries AS co WHERE cn.country_id=co.country_id RETURNING*;

DELETE FROM countries RETURNING*;