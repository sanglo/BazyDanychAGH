--zad 4
CREATE TABLE roads(
id int PRIMARY KEY,
geometry geometry,
name varchar(50)
);

CREATE TABLE buildings(
id int PRIMARY KEY,
geometry geometry,
name varchar(50)
);

CREATE TABLE poi(
id int PRIMARY KEY,
geometry geometry,
name varchar(50)
);