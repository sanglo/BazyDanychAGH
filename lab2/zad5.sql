--zad 5
INSERT INTO buildings(id, geometry, name)
VALUES (1, ST_GeomFromText('POLYGON((8 4, 10.5 4, 10.5 1.5, 8 1.5, 8 4))'), 'BuildingA'),
       (2, ST_GeomFromText('POLYGON((4 7, 6 7, 6 5, 4 5, 4 7))'), 'BuildingB'),
       (3, ST_GeomFromText('POLYGON((3 8, 5 8, 5 6, 3 6, 3 8))'), 'BuildingC'),
       (4, ST_GeomFromText('POLYGON((9 9, 10 9, 10 8, 9 8, 9 9))'), 'BuildingD'),
       (5, ST_GeomFromText('POLYGON((1 2, 2 2, 2 1, 1 1, 1 2))'), 'BuildingE');

INSERT INTO poi(id, geometry, name)
VALUES (1, ST_GeomFromText('POINT(5.5 1.5)'), 'H'),
       (2, ST_GeomFromText('POINT(1 3.5)'), 'G'),
       (3, ST_GeomFromText('POINT(9.5 6)'), 'I'),
       (4, ST_GeomFromText('POINT(6.5 6)'), 'J'),
       (5, ST_GeomFromText('POINT(6 9.5)'), 'K');
	   
INSERT INTO roads(id, geometry, name)
VALUES (1, ST_GeomFromText('LINESTRING(7.5 0, 7.5 10.5)'), 'RoadY'),
       (2, ST_GeomFromText('LINESTRING(0 4.5, 12 4.5)'), 'RoadX');
