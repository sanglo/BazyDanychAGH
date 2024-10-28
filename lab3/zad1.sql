--zad 1 
-- polecenie do importu danych 
--shp2pgsql.exe "D:\AGH\sem7\Bazy danych\repoBD\T2018_KAR_GERMANY\T2018_KAR_BUILDINGS.shp" public.buildings_2018 | psql -h localhost -p 5433 -U postgres -d bdp_lab2
--shp2pgsql.exe "D:\AGH\sem7\Bazy danych\repoBD\T2019_KAR_GERMANY\T2019_KAR_BUILDINGS.shp" public.buildings_2019 | psql -h localhost -p 5433 -U postgres -d bdp_lab2

-- nowo wybudowane -> nowe polygon_id, zminione-> geom + height 
SELECT b19.gid, b19.polygon_id, b19.name, b19.type, b19.height AS height_19, NULL AS height_18, b19.geom
FROM buildings_2019 AS b19
LEFT JOIN buildings_2018 AS b18 ON b19.polygon_id = b18.polygon_id
WHERE b18.polygon_id IS NULL

UNION

SELECT b19.gid, b19.polygon_id, b19.name, b19.type, b19.height AS height_19, b18.height AS height_18, b19.geom
FROM buildings_2019 AS b19
JOIN buildings_2018 AS b18 ON b19.polygon_id = b18.polygon_id
WHERE b18.height <> b19.height OR NOT ST_Equals(b18.geom , b19.geom)
