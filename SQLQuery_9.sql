drop table Employeee

CREATE TABLE Employeee(
    EmID INT PRIMARY KEY,
    EmName VARCHAR (50) NOT NULL,
    EmGender VARCHAR(6) NOT NULL DEFAULT 'Male',
    EmSalary INT CHECK(EmSalary > 10000),
    EmDependent INT
);

INSERT INTO Employeee
VALUES
(100, 'Nelson', 'MALE', 22000, 2),
(102, 'Christy', 'MALE', 25000, 3),
(103, 'Emmanuel','FEMALE',25500, 4),
(112, 'Chinedu', 'MALE', 25000, 3),
(101, 'Francisca', 'FEMALE', 22000, 6),
(104, 'Rufiat', 'FEMALE', 23000, 3),
(105, 'Oge', 'MALE', 28000, 3),
(114, 'Roro', 'FEMALE', 23000, 3),
(106, 'Eleganza', 'FEMALE', 28000, 5),
(107, 'Baba', 'FEMALE', 23600, 1),
(108, 'Dele', 'FEMALE', 21000, 2),
(109, 'Victony', 'MALE', 13000, 2),
(113, 'Micheal', 'MALE', 24700,2);
SELECT * FROM Employeee;


SELECT * FROM Employeee 
WHERE EmDependent >= 3 

-- SELECT * FROM Employeee 
-- WHERE EmSalary BETWEEN 25000 AND 30000

-- SELECT * FROM Employeee 
-- WHERE EmID BETWEEN 105 AND 110

-- SELECT * FROM Employeee
-- WHERE EmGender= 'MALE' AND EmSalary >20000


-- ORDER BY EmSalary DESC
-- Return MALE Employees that earns above 20000, and ordered by their salary
-- (SELECT * FROM Employeee
-- where EmSalary> 20000 AND EmGender= 'MALE'
-- ORDER BY EmName DESC)

-- RETURN Female Employees that earns below 30000
-- (SELECT * FROM Employeee
-- WHERE EmGender= 'FEMALE' AND EmSalary < 30000)

-- Return employee whose name is fracisca
-- (SELECT * FROM Employeee
-- WHERE EmName= 'Francisca')


-- -- Return only Gender, Name and Salary of OGE
-- SELECT * FROM Employeee
-- WHERE EmName= 'Oge' AND EmSalary=28000

-- -- Return where emSalary is the first COLUMN
-- (SELECT EmSalary, EmName, EmGender FROM Employeee)


-- -- Return the name gender and the ID of the Employee whose salary is between 25000 and 30000
-- (SELECT * FROM Employeee
-- WHERE EmSalary BETWEEN 25000 and 30000)

-- -- Return the name gender and the ID of the Employee whose salary is between 25000 and 30000
-- SELECT EmName, EmGender, EmID FROM Employeee
-- WHERE EmSalary BETWEEN 25000 and 30000

-- -- Return ID, Name, Salary of male employees who are above 25000 and also have at least 2 dependent
-- SELECT EmID, EmName, EmSalary FROM Employeee
-- WHERE EmGender = 'MALE' AND EmSalary> 20000 AND EmDependent >= 2

-- SELECT * FROM Employeee;
ALTER TABLE Employeee
DROP COLUMN Date_Joined;
-- ADD Date_Joined VARCHAR(50);

Select all male employees that earns between 15000 to 20000
SELECT * FROM Employeee
WHERE EmGender='MALE' AND EmSalary BETWEEN 15000 and 25000 


-- wage underpay is payment lesser than 25000. find all underpaid workers
SELECT * FROM Employeee
WHERE EmSalary < 25000

-- what is the EmID of the highest paid worker in the organisation
SELECT MAX(EmSalary) AS Highest_EmSalary FROM Employeee
.
SELECT TOP 1 EmID, EmName, EmSalary FROM Employeee
ORDER BY EmSalary DESC

-- what is the EmID of the least paid worker in the organiation
SELECT MIN(EmSalary) AS Least_EmSalary FROM Employeee
.
SELECT TOP 1 EmName, EmID, EmSalary FROM Employeee
ORDER BY EmSalary ASC


-- Find the EmID of Nelson
SELECT EmID, EmName FROM Employeee
WHERE EmName= 'Nelson'


-- Find the Salary of Christy
SELECT EmSalary, EmName FROM Employeee
WHERE EmName= 'Christy'

-- How many dependent does Francisca have
SELECT EmDependent, EmName FROM Employeee
WHERE EmName= 'Francisca'

-- Select out names whose ID are in Particular list
SELECT EmName, EmSalary FROM Employeee
WHERE EmID IN (100, 103, 106)
.
SELECT EmName, EmID, EmSalary, EmDependent FROM Employeee
WHERE EmName IN ('Nelson', 'Taiwo', 'Ehiz')


-- All round searching in a DATABASE
SELECT * FROM Employeee
WHERE EmName LIKE '%e%' AND EmSalary > 25000;


-- who is the highest paid in Nelso, Maya and Taiwo
SELECT TOP 1 EmID, EmSalary, EmName FROM Employeee
WHERE EmName IN ('Nelson', 'Maya', 'Taiwo')
ORDER BY EmSalary DESC

-- whos has the most number of children in the above NAMES
SELECT TOP 1 EmName, EmID, EmSalary, EmDependent FROM Employeee
WHERE EmName IN ('Nelson', 'Maya', 'Taiwo') 
ORDER BY EmDependent DESC

-- what is the gender of employee with the highest Pay
SELECT  EmGender, EmSalary FROM Employeee
ORDER BY EmSalary DESC

-- of all the employees whose name ends in 'A' who is the least paid
SELECT * FROM Employeee
WHERE EmName LIKE '%a' 
ORDER BY EmSalary ASC

-- Aggregation

-- GROUPING

                 


