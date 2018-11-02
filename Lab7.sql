CREATE DATABASE lab7;

CREATE INDEX name_index ON countries USING hash (name); --1

CREATE INDEX surname_index ON countries USING hash (name, surname); --2

CREATE UNIQUE INDEX salary_index ON employees (salary); --3

CREATE INDEX subster_index ON employees (substring(name from 1 to 4)); --4

CREATE INDEX depart_index ON employees (department_id, salary); 
CREATE INDEX budget_index ON departments (department_id, budget); --5

