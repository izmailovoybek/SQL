#Question: Explain at least two ways to find distinct values based on two columns.
CREATE TABLE InputTbl (
    col1 VARCHAR(10),
    col2 VARCHAR(10)
);
    INSERT INTO InputTbl (col1, col2) VALUES 
('a', 'b'),
('a', 'b'),
('b', 'a'),
('c', 'd'),
('c', 'd'),
('m', 'n'),
('n', 'm');
SELECT DISTINCT 
       LEAST(col1, col2) AS val1,
       GREATEST(col1, col2) AS val2
FROM InputTbl;

#Question: If all the columns have zero values, then don’t show that row. In this case, we have to remove the 5th row while selecting data.
CREATE TABLE TestMultipleZero (
    A INT NULL,
    B INT NULL,
    C INT NULL,
    D INT NULL
);

INSERT INTO TestMultipleZero(A,B,C,D)
VALUES 
    (0,0,0,1),
    (0,0,1,0),
    (0,1,0,0),
    (1,0,0,0),
    (0,0,0,0),
    (1,1,1,0);
SELECT *
FROM TestMultipleZero
WHERE A <> 0
   OR B <> 0
   OR C <> 0
   OR D <> 0;

# Find those with odd ids
create table section1(id int, name varchar(20))
insert into section1 values (1, 'Been'),
       (2, 'Roma'),
       (3, 'Steven'),
       (4, 'Paulo'),
       (5, 'Genryh'),
       (6, 'Bruno'),
       (7, 'Fred'),
       (8, 'Andro')
SELECT * FROM section1
WHERE id % 2 <> 0;
