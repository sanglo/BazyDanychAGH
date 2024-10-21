--zad 6 g
select b.name 
from buildings as b ,roads as r
where ST_Y(ST_Centroid(b.geometry)) > ST_Y(ST_Centroid(r.geometry)) and r.name='RoadX'

