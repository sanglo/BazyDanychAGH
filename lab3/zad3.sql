--zad 3

--import danych 
--shp2pgsql.exe "D:\AGH\sem7\Bazy danych\repoBD\T2019_KAR_GERMANY\T2019_KAR_STREETS.shp" public.streets_2019 | psql -h localhost -p 5433 -U postgres -d bdp_lab2
UPDATE streets_2019
SET geom = ST_SetSRID(geom, 4326)
WHERE ST_SRID(geom) = 0;

SELECT gid,link_id,st_name,ref_in_id,nref_in_id,func_class,speed_cat,fr_speed_l,to_speed_l,dir_travel,
ST_Transform(geom,31467) as geom
INTO streets_reprojected
FROM streets_2019

