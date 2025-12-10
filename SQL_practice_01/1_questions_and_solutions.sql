-- 1.1 Write a query to display all products along with their manufacturer names.
select ROW_NUMBER() over() as 's.no', products.name, manufacturers.name from products inner join manufacturers on products.Manufacturer = manufacturers.code;

-- 1.2 Write a query to find the most expensive product and its manufacturer.
select products.code As 's.no', products.name, products.price, manufacturers.name from products join manufacturers ON products.Manufacturer = manufacturers.code order by price desc limit 1;

-- 1.3 Write a query to list all manufacturers that do NOT have any products.
select m.name from manufacturers m left join products p on m.code = p.manufacturer where p.code is null;

-- 1.4 Write a query to count how many products each manufacturer has.
select m.name, count(p.name) from manufacturers m inner join products p on m.code= p.manufacturer group by p.manufacturer;


-- 1.5 Write a query to get the average price of all products.
select  avg(price) from products ;


-- 1.6 Write a query to list products whose price is above the average product price.
SELECT Name, Price FROM Products HAVING Price > AVG(Price);
-- Note: The previous query returns only 1 row because HAVING without GROUP BY collapses the result into a single group. Therefore
-- we have to use below query(sub-query) to get complete product list
SELECT Name, Price FROM Products WHERE Price > (SELECT AVG(Price) FROM Products);


-- 1.7 Write a query to find the second-highest priced product.
select  name,price from products order by price desc limit 1,1;


-- 1.8 Write a query to list all products starting with the letter ‘D’.
select  name from products WHERE name like 'D%';


-- 1.9 Write a query to show the manufacturer(s) that produce the cheapest product.
select m.name from products p join manufacturers m on p.manufacturer = m.code order by p.price limit 1;


-- 1.10 Write a query to display products grouped by manufacturer with total price sum per manufacturer.
select m.name, sum(p.price) as price_sum  from products p join manufacturers  m on p.manufacturer = m.code group by p.manufacturer;  
