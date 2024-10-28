--zad 6 
 reprojecta ST_buffer - odległosć 
 od lini zbudowanej z punktów  st_makeline
 st_contains
UPDATE street_node_2019
SET geom = ST_SetSRID(geom, 4326)
WHERE ST_SRID(geom) = 0;

--intersect- skrzyżownie; Y-yes; N-no
WITH intersections AS (
SELECT node_id, ST_Transform(geom, 3068) as geom
from street_node_2019 as sn19
WHERE sn19."intersect" = 'Y'
) , line AS (
SELECT ST_MakeLine(geometry) AS geom FROM input_points

)


SELECT node_id , line.geom
FROM intersections 
CROSS JOIN line 
WHERE ST_Contains(ST_Buffer(line.geom, 0.002),intersections.geom)