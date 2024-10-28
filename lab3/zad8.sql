--zad 8 
CREATE TABLE T2019_KAR_BRIDGES AS
SELECT  ST_Intersection(r.geom, w.geom) AS geom
FROM railways_2019 as r
join wather_lines_2019 as w on ST_Touches(r.geom,w.geom)
WHERE 
    ST_GeometryType(ST_Intersection(r.geom, w.geom)) = 'ST_Point';