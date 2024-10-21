--zad6b
select ST_AsText(geometry) as wkt, ST_Area(geometry) as area, ST_Perimeter(geometry) as perimeter
from buildings where name='BuildingA'