CREATE DATABASE lab5
create extension postgis
--zadanie 1
CREATE DATABASE lab5
create extension postgis

create table obiekty(
id SERIAL PRIMARY KEY ,
geometry geometry,
name varchar(32)
)
--obiekt1
INSERT INTO obiekty("name", geometry) 
VALUES
('obiekt1', 
	ST_CollectionExtract(
		ST_CurveToLine(
			ST_GeomFromEWKT(
	 			'SRID=0;GEOMETRYCOLLECTION(
					 LINESTRING(0 1, 1 1),
				 	 CIRCULARSTRING(1 1, 2 0, 3 1),
				 	 CIRCULARSTRING(3 1, 4 2, 5 1),
				 	 LINESTRING(5 1, 6 1)
	 			)'
 			)
		)
	)
)

--obiekt2
INSERT INTO obiekty("name", geometry) 
VALUES
('obiekt2', 
	ST_SetSRID(
		ST_BuildArea(
			ST_Collect(
				ARRAY[
					'LINESTRING(10 6, 14 6)',
					'CIRCULARSTRING(14 6, 16 4, 14 2)',
					'CIRCULARSTRING(14 2, 12 0, 10 2)',
					'LINESTRING(10 2, 10 6)',
					ST_Buffer(ST_POINT(12, 2), 1)
				]
			)
		), 0
	)
)
--obiekt3
INSERT INTO obiekty("name", geometry) 
VALUES
('obiekt3', 
	ST_GeomFromEWKT(
		'SRID=0;
		POLYGON((10 17, 12 13, 7 15, 10 17))'
	)
)

--obiekt4
INSERT INTO obiekty("name", geometry) 
VALUES
('obiekt4', 
	ST_GeomFromEWKT(
		'SRID=0;
		LINESTRING(20 20, 25 25, 27 24, 25 22, 26 21, 22 19, 20.5 19.5)'
	)
)

--obiekt5
INSERT INTO obiekty("name", geometry) 
VALUES
('obiekt5', 
	ST_GeomFromEWKT(
		'SRID=0;
		MULTIPOINT((30 50 59), (38 32 234))'
	)
)

--obiekt 6
INSERT INTO obiekty("name", geometry) 
VALUES
('obiekt6', 
	ST_SetSRID(
		ST_Collect(
			'LINESTRING(1 1, 3 2)',
			'POINT(4 2)'
		), 0
	)
)

SELECT id,name,geometry 
FROM obiekty

--zad 2


SELECT ST_Area(
           ST_Buffer(
               ST_ShortestLine(o3.geometry, o4.geometry), 
               5
           )
       ) AS buffer_area
FROM obiekty AS o3, obiekty AS o4
WHERE o3.name = 'obiekt3' AND o4.name = 'obiekt4';

--zadnie 3

-- obiekt nie był poligonem ponieważ nie był "zamknięty", jego osttni punkt nie pokrywał sie z pierwszym 
WITH polygon_geom AS (
	SELECT ST_MakePolygon(ST_AddPoint(geometry, ST_StartPoint(geometry)))
	FROM obiekty
	WHERE "name" = 'obiekt4'
)
UPDATE obiekty
SET geometry = (SELECT * FROM polygon_geom)
WHERE "name" = 'obiekt4';

--zadanie 4 

INSERT INTO obiekty("name" , geometry)
SELECT 'obiect7', ST_Collect(geometry)
FROM obiekty
WHERE 'name'= 'obiekty3' or 'name'='obiekty4'

--zadanie 5 
SELECT 
    sum(ST_Area(ST_Buffer(geometry, 5)))AS total_area_bufefr
FROM obiekty
WHERE GeometryType(geometry) NOT IN ('CIRCULARSTRING');
