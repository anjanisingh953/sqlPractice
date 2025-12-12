-- https://en.wikibooks.org/wiki/SQL_Exercises/Pieces_and_providers


-- 5.1 Select the name of all the pieces.
select Name from Pieces;

-- 5.2  Select all the providers' data. 
select * from providers;


-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
select piece, avg(price) from Provides group by piece;

-- 5.4  Obtain the names of all providers who supply piece 1.
select Name from Providers where Code in (select  Provider from provides where Piece = 1);
 or
select Providers.Name from Providers join Provides on Providers.Code = Provides.Provider where Provides.Piece = 1;


-- 5.5 Select the name of pieces provided by provider with code "HAL".
select Pieces.Name from Pieces join Provides on (Pieces.code = Provides.Piece) where Provides.Provider = 'HAL';

-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
-- ---------------------------------------------

SELECT Pieces.Name, Providers.Name, Price
  FROM Pieces INNER JOIN Provides ON Pieces.Code = Piece
              INNER JOIN Providers ON Providers.Code = Provider
  WHERE Price =
  (
    SELECT MAX(Price) FROM Provides
    WHERE Piece = Pieces.Code
  );



-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
INSERT INTO Provides(Piece, Provider, Price) VALUES (1, 'TNBC', 7);


-- 5.8 Increase all prices by one cent.
UPDATE Provides SET Price = Price + 1;


-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
DELETE FROM Provides WHERE provider = 'RBT' AND Piece = 4;


-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).

DELETE FROM provides WHERE Provider = 'RBT';    