CREATE TABLE Wine(
 NumW INT PRIMARY KEY,
 Category VARCHAR(30) NOT NULL,
 Year INT NOT NULL,
 Degree INT NOT NULL
 );
 
 INSERT INTO Wine
 VALUES
 (1, 'Rose All Day', 2009, 10),
 (2, 'Faux Champagne', 2006, 20),
 (3, 'Fruit Wine', 2000, 15),
 (4, 'Bold Flavor', 2003, 18),
 (5, 'Chardonnay', 2005, 22),
 (6, 'Bright and Smooth', 2012, 11),
 (7, 'California Cab', 2022, 6),
 (8, 'vin', 2017, 5),
 (9, 'Sauvignon', 2001, 28),
 (10, 'Sparkling Wine', 2019, 25),
 (11, 'Fresh and fruity', 2020, 50),
 (12, 'Red Lovers', 2021, 35),
 (13, 'Sub Wine', 2008, 19),
 (14, 'Ariel', 2002, 58),
 (15, 'proxy', 2007, 48),
 (16, 'Merlot', 2008, 3),
 (17, 'Cabernet', 2013, 90),
 (18, 'Malbec', 2018, 85),
 (19, 'White Wine', 2015, 59),
 (20, 'Pinot', 1999, 38),
 (21, 'Zinfandel', 1998, 48),
 (22, 'Gris', 1997, 95),
 (23, 'Muscat', 2009, 51),
 (24, 'Tempranillo', 20022, 7),
 (25, 'Franc', 1994, 11),
 (26, 'Viognier', 2001, 8),
 (27, 'Bordeaux', 2004, 5),
 (28, 'Traminer', 1996, 24),
 (29, 'Shiraz', 2023, 65),
 (30, 'Grenache', 2007, 64),
 (31, 'Nebbiolo', 1992, 59),
 (32, 'Ampoule', 1995, 57),
 (33, 'Vosne', 2005, 43)

 SELECT * FROM Wine;
 
 CREATE TABLE Producer(
 NumP INT PRIMARY KEY,
 First_Name VARCHAR(20) NOT NULL,
 Last_Name VARCHAR(20) NOT NULL,
 Region VARCHAR(30) NOT NULL
 );
 INSERT INTO Producer
 VALUES
 (1, 'Ehiz', 'Eloho', 'Texas'),
 (2, 'Mahmoud', 'Rafi', 'Sfax'),
 (3, 'Kabeer', 'Habeeb', 'Sousse'),
 (4, 'Mya', ' Gbenga', 'Gabes'),
 (5, 'Ugo', 'Daniel', 'Bizerte'),
 (6, 'Bright', 'Lash', 'Kairouan'),
 (7, 'Dan', 'Wale', 'Tinis'),
 (8, 'Kelvin', 'John', 'Cape Town'),
 (9, 'Durelo', 'Jayson', 'Sousse'),
 (10, 'Sultan', 'Gayon', 'Sousse'),
 (11, 'David', 'Maxwell', 'Baltimore'),
 (12, 'Rammy', 'Lash', 'Cairo'),
 (13, 'Alloy', 'Lan', 'Peru'),
 (14, 'Mahmoud', 'Don', 'Chicago'),
 (15, 'Dammy', 'Jaleel', 'Sousse'),
 (16, 'Lee', 'Wright', 'Ontario'),
 (17, 'Bukky', 'Sanya', 'Lagos'),
 (18, 'Malik', 'Aaleem', 'Seoul'),
 (19, 'Habeeb', 'Agaba', 'Spain'),
 (20, 'Yusuf', 'Velaman', 'USA'),
 (21, 'Wuraola', 'Oye', 'Sicily'),
 (22, 'Zee', ' Lee', 'France'),
 (23, 'Brooks', 'Balo', 'Washington'),
 (24, 'Samuel', 'Sam', 'Oregon'),
 (25, 'Kay', 'Raphael', 'California'),
 (26, 'Rachel', 'Dotun', 'Bizerte'),
 (27, 'Taiwo', 'Tee', 'Sousse')
 SELECT * FROM Producer;
 
 CREATE TABLE Harvest(
 NumH INT PRIMARY KEY,
 Quantity INT NOT NULL,
 NumW INT FOREIGN KEY (NumW) REFERENCES Wine,
 NumP INT FOREIGN KEY (NumP) REFERENCES Producer
 );

 INSERT INTO Harvest
VALUES
(1, 100, 1, 1),
(2, 500, 4, 2),
(3, 350, 3, 3),
(4, 70, 5, 5),
(5, 200, 23, 4),
(6, 270, 33, 3),
(7, 105, 11, 7),
(8, 50,  21, 9),
(9, 203, 32, 6),
(10, 107, 12, 12),
(11, 112, 13, 8),
(12, 103, 6, 10),
(13, 50, 8, 13),
(14, 373, 2, 24),
(15, 700, 9, 3),
(16, 200, 7, 16),
(17, 150, 26, 15),
(18, 550, 20, 3),
(19, 340, 18, 17),
(20, 75, 15, 18),
(21, 255, 14, 21),
(22, 339, 17, 20),
(23, 250, 16, 10),
(24, 30, 19, 19),
(25, 545, 22, 22),
(26, 300, 10, 23),
(27, 400, 23, 2),
(28, 290, 25, 16),
(29, 190, 24, 27),
(30, 255, 27, 12),
(31, 370, 28, 1),
(32, 275, 29, 23),
(33, 100, 30, 21)
SELECT * FROM Harvest


-- -- 1. Convert the entity relationship diagram into relational model.
-- -- Wine(#NumW, Category, Year, Degree)
-- -- Producer(NumP, FirstName, LastName, Region) 
-- -- Harvest(#NumH, #NumW, #NumP, Quantity )

-- -- 2. Give the list the producers.
SELECT * FROM Producer;

-- -- 3. Give the list of producers sorted by name.
SELECT * FROM Producer
ORDER BY First_Name, Last_Name ASC;

-- -- 4. Give the list the producers of Sousse.
SELECT *FROM Producer
WHERE Region = 'Sousse';

-- --5. Calculate the total quantity of wine produced having the number 12.
SELECT Wine.NumW, Wine.category, SUM(Harvest.Quantity) AS Total_Quantity 
FROM Wine 
INNER JOIN Harvest ON Wine.NumW =Harvest.NumW
WHERE Wine.NumW = 12
GROUP BY Wine.Category, Wine.NumW;



-- -- 6. Calculate the quantity of wine produced by category.
SELECT Wine.Category, SUM(Harvest.Quantity) AS Total_Quantity
FROM Harvest
FULL OUTER JOIN Wine ON Harvest.NumW = Wine.NumW
GROUP BY Wine.Category;



-- --7. Which producers in the Sousse region have harvested at least one wine in quantities greater than
-- --  300 liters? We want the names and first names of the producers, sorted in alphabetical order.


SELECT Producer.First_Name, Producer.Last_Name, Wine.Category, Harvest.Quantity
FROM Producer
INNER JOIN Harvest ON Producer.NumP = Harvest.NumP
INNER JOIN Wine ON Harvest.NumW = Wine.NumW
WHERE Producer.Region = 'Sousse' AND Harvest.Quantity > 300
ORDER BY Producer.First_Name ASC;

-- --8. List the wine numbers that have a degree greater than 12 and that have been produced by producer number 24.
SELECT Wine.NumW, Producer.NumP, Wine.Degree, Wine.Category
FROM Wine 
INNER JOIN Harvest ON Wine.NumW = Harvest.NumW
INNER JOIN Producer ON Harvest.NumP = Producer.NumP
WHERE Wine.Degree > 12 AND Harvest.NumP = 24;


