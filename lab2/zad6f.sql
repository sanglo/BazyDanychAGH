--zad 6 f
select ST_Area(
		ST_Difference(C.geometry, ST_Buffer(B.geometry, 0.5)))
from buildings as C,buildings as B
where C.name ='BuildingC' and B.name='BuildingB'


