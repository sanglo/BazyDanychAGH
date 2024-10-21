select name,ST_area(geometry) as area from buildings
order by  name asc