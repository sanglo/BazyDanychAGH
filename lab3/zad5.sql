--zad 5 
ALTER TABLE input_points
ALTER COLUMN geometry 
TYPE geometry(Point) USING ST_Transform(ST_SetSRID(geometry,4326),3068)
--sprawdzenei srid
SELECT DISTINCT ST_SRID(geometry) AS srid
FROM input_points;
