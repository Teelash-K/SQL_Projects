
-- drop table Contract_Employee
-- drop table Full_Time_Employee

CREATE TABLE Full_Time_Employee(
    EmpID INT PRIMARY KEY NOT NULL,
    FirstName VARCHAR (50) NOT NULL,
    LastName VARCHAR (50) NOT NULL,
    Age INT NOT NULL,
    Salary INT NOT NULL,
    Number_of_Dependent INT NOT NULL
);

CREATE TABLE Contract_Employee(
    C_ID INT PRIMARY KEY NOT NULL,
    C_FirstName VARCHAR (50) NOT NULL,
    C_Lastname VARCHAR (50) NOT NULL,
    Gender VARCHAR(7) NOT NULL,
    Num_Dependent INT NOT NULL,
    EmpID INT FOREIGN KEY REFERENCES Full_Time_Employee(EmpID)

);    

INSERT INTO Full_Time_Employee
VALUES
(123, 'Taiwo', 'Lash', 24, 400000, 1 ),
(456, 'Ehiz', 'Mya', 26, 370000, 2),
(345, 'Gbenga', 'Ugo', 30, 400000, 3)
SELECT * FROM Full_Time_Employee;

INSERT INTO Contract_Employee
VALUES
(100, 'Nelson', 'MALE', 22000, 2, 123),
(102, 'Christy', 'MALE', 25000, 3, 456),
(103, 'Emmanuel', 'FEMALE', 25500, 4, 345),
(112, 'Chinedu', 'MALE', 25000, 3, 345),
(101, 'Francisca', 'FEMALE', 22000, 6, 456),
(104, 'Rufiat', 'FEMALE', 23000, 3, 123),
(105, 'Oge', 'MALE', 28000, 3, 123),
(114, 'Roro', 'FEMALE', 23000, 3, 345),
(106, 'Eleganza', 'FEMALE', 28000, 5, 456),
(107, 'Baba', 'FEMALE', 23600, 1, 456),
(108,'Dele', 'FEMALE',21000, 2, 123),
(109, 'Victony', 'MALE', 13000, 2, 345),
(113, 'Micheal', 'MALE', 24700, 2, 456);
SELECT * FROM Contract_Employee;

