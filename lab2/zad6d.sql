--zad 6d
select  name,ST_perimeter(geometry) as perimeter from buildings 
order by  ST_area(geometry) desc
LIMIT 2



