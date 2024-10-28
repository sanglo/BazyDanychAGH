--zad 7
SELECT count(*)
FROM poi_2019 as p
join land_2019 as l on ST_DWithin(p.geom,l.geom ,0.003)
where p.type = 'Sporting Goods Store' and l.type like 'Park%'


