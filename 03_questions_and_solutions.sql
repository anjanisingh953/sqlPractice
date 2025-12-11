--3.1 Select all warehouses.
select * from boxes;

--3.2 Select all boxes with a value larger than $150.
select * from boxes where VALUE > 150;

--3.3 Select all distinct contents in all the boxes.
select DISTINCT(contents) from boxes;

--3.4 Select the average value of all the boxes.
select AVG(VALUE) from boxes;

--3.5 Select the warehouse code and the average value of the boxes in each warehouse.
 SELECT w.code, w.Location,avg(b.VALUE) AvgValue from boxes b JOIN warehouses w on w.code = b.Warehouse GROUP by b.Warehouse;


--3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
SELECT w.code, w.Location, avg(b.VALUE) AvgValue from boxes b JOIN warehouses w on w.code = b.Warehouse GROUP by b.Warehouse having avg(b.VALUE)>150;

--3.7 Select the code of each box, along with the name of the city the box is located in.
SELECT b.code, w.Location from boxes b JOIN warehouses w on w.code = b.Warehouse ;

--3.8 Select the warehouse codes, along with the number of boxes in each warehouse. 
    -- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
SELECT w.code, w.Location, count(b.code) from boxes b RIGHT JOIN warehouses w on w.code = b.Warehouse GROUP BY b.Warehouse;    

--3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
select w.code, w.location, COUNT(b.code) from boxes b join warehouses w on b.Warehouse = w.Code GROUP by b.Warehouse, w.Capacity HAVING COUNT(b.Code) > w.Capacity;


--3.10 Select the codes of all the boxes located in Chicago.
 select b.code, w.location from boxes b join warehouses w on b.Warehouse = w.Code WHERE w.Location = 'Chicago';

--3.11 Create a new warehouse in New York with a capacity for 3 boxes.
INSERT INTO Warehouses VALUES (6, 'New York', 3);


--3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
INSERT INTO Boxes VALUES('H5RT', 'Papers', 200, 2);


--3.13 Reduce the value of all boxes by 15%.
update boxes set value = value * 0.85;


--3.14 Remove all boxes with a value lower than $100.
delete from boxes where value < 100;

-- 3.15 Remove all boxes from saturated warehouses.
-- using correlated subquery --
delete from boxes where warehouse in (
SELECT Code FROM Warehouses WHERE Capacity <  (
    SELECT COUNT(*) FROM Boxes WHERE Warehouse = Warehouses.Code
   ) );
-- using joins --
DELETE from boxes WHERE warehouse in (SELECT w.Code	FROM Warehouses w LEFT JOIN Boxes b ON b.Warehouse = w.Code
GROUP BY w.Code, w.Capacity HAVING w.Capacity < COUNT(b.Code) )


-- 3.16 Add Index for column "Warehouse" in table "boxes"
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
CREATE INDEX wareIndex ON Boxes (warehouse);

-- 3.17 Print all the existing indexes
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
show index on boxes;

-- 3.18 Remove (drop) the index you added just
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
DROP index wareIndex on boxes;