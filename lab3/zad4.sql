--zad 4
CREATE TABLE input_points( 
id SERIAL PRIMARY KEY ,
geometry geometry);

INSERT INTO input_points( geometry)
VALUES (ST_GeomFromText('POINT(8.36093 49.03174)', 4326)),
       (ST_GeomFromText('POINT(8.39876 49.00644)', 4326));