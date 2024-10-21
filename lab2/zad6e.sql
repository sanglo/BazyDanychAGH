select ST_Distance(buildings.geometry, poi.geometry) AS shortest_distance
from buildings, poi
where buildings.name = 'BuildingC' AND poi.name = 'K';
