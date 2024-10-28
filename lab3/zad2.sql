--import danych 
--shp2pgsql.exe "D:\AGH\sem7\Bazy danych\repoBD\T2018_KAR_GERMANY\T2018_KAR_POI_TABLE.shp" public.poi_2018 | psql -h localhost -p 5433 -U postgres -d bdp_lab2
--shp2pgsql.exe "D:\AGH\sem7\Bazy danych\repoBD\T2019_KAR_GERMANY\T2019_KAR_POI_TABLE.shp" public.poi_2019 | psql -h localhost -p 5433 -U postgres -d bdp_lab2

--zad 2
--tworzenie temp tab dla buildings 
CREATE TEMP TABLE buildings1 AS
SELECT b19.gid, b19.polygon_id, b19.name, b19.type, b19.height AS height_19, NULL AS height_18, b19.geom
FROM buildings_2019 AS b19
LEFT JOIN buildings_2018 AS b18 ON b19.polygon_id = b18.polygon_id
WHERE b18.polygon_id IS NULL
UNION
SELECT b19.gid, b19.polygon_id, b19.name, b19.type, b19.height AS height_19, b18.height AS height_18, b19.geom
FROM buildings_2019 AS b19
JOIN buildings_2018 AS b18 ON b19.polygon_id = b18.polygon_id
WHERE b18.height <> b19.height OR NOT ST_Equals(b18.geom, b19.geom);

--tworzenie temp tab dla punktów
CREATE TEMP TABLE poi2 AS
SELECT p19.*
FROM poi_2019 AS p19
LEFT JOIN poi_2018 AS p18  ON p19.geom = p18.geom
WHERE p18.geom IS NULL;

-- tworzenie buffora
CREATE TEMP TABLE buffer2 AS
SELECT ST_Buffer(ST_Union(geom),0.005) as geom from buildings1

--Zlicznie punktów i grupowanie ich
--CREATE TEMP TABLE  group1 AS
SELECT 
    COUNT(CASE WHEN ST_Contains(b.geom, p.geom) THEN 1 END) AS count, 
    p.type
FROM poi2 AS p
CROSS JOIN buffer2 AS b
GROUP BY p.type
HAVING COUNT(CASE WHEN ST_Contains(b.geom, p.geom) THEN true END) > 0
ORDER BY count DESC;
