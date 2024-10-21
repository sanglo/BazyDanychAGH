--zad 6 g

select ST_Area(ST_SymDifference(b.geometry,ST_GeomFromEWKT('SRID=0;POLYGON((4 7, 6 7, 6 8, 4 8, 4 7))'))
) as diff
from buildings as b
where b.name='BuildingC'
