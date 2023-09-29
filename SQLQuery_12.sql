CREATE TABLE  AGENTS(	
    AGENT_CODE VARCHAR(6) NOT NULL PRIMARY KEY, 
  	AGENT_NAME VARCHAR(40), 
  	WORKING_AREA VARCHAR(35), 
  	COMMISSION FLOAT, 
  	PHONE_NO VARCHAR(15), 
  	COUNTRY VARCHAR(25) 
	 );
	 
INSERT INTO AGENTS VALUES 
('A007', 'Ramasundar', 'Bangalore', 0.15, '077-25814763', ''),
('A003', 'Alex ', 'London', 0.13, '075-12458969', ''),
('A008', 'Alford', 'New York',0.12, '044-25874365', ''),
('A011', 'Ravi Kumar', 'Bangalore', 0.15, '077-45625874', ''),
('A010', 'Santakumar', 'Chennai', 0.14, '007-22388644', ''),
('A012', 'Lucida', 'San Jose', 0.12, '044-52981425', ''),
('A005', 'Anderson', 'Brisban', 0.13, '045-21447739', ''),
('A001', 'Subbarao', 'Bangalore', 0.14, '077-12346674', ''),
('A002', 'Mukesh', 'Mumbai', 0.11, '029-12358964', ''),
('A006', 'McDen', 'London', 0.15, '078-22255588', ''),
('A004', 'Ivan', 'Torento',0.15, '008-22544166', ''),
('A009', 'Benjamin', 'Hampshair', 0.11, '008-22536178', '');



CREATE TABLE  CUSTOMER (
  CUST_CODE VARCHAR(6) NOT NULL PRIMARY KEY, 
	CUST_NAME VARCHAR(40) NOT NULL, 
	CUST_CITY CHAR(35), 
	WORKING_AREA VARCHAR(35) NOT NULL, 
	CUST_COUNTRY VARCHAR(20) NOT NULL, 
	GRADE INT, 
	OPENING_AMT INT NOT NULL, 
	RECEIVE_AMT INT NOT NULL, 
	PAYMENT_AMT INT NOT NULL, 
	OUTSTANDING_AMT INT NOT NULL, 
	PHONE_NO VARCHAR(17) NOT NULL, 
	AGENT_CODE VARCHAR(6) NOT NULL REFERENCES AGENTS
);


CREATE TABLE Products(
	product_ID VARCHAR(10) NOT NULL PRIMARY KEY,
	Product_name VARCHAR(30) NOT NULL 
	Product_price DECIMAL (CHECK > 0)
)

INSERT INTO CUSTOMER
VALUES
('C00013', 'Holmes', 'London', 'London', 'UK', 2, 6000, 5000, 7000, 4000, 'BBBBBBB', 'A003'),
('C00001', 'Micheal', 'New York', 'New York', 'USA', 2, 3000, 5000, 2000, 6000, 'CCCCCCC', 'A008'),
('C00020', 'Albert', 'New York', 'New York', 'USA', 3, 5000, 7000, 6000, 6000, 'BBBBSBB', 'A008'),
('C00025', 'Ravindran', 'Bangalore', 'Bangalore', 'India', 2, 5000, 7000, 4000, 8000, 'AVAVAVA', 'A011'),
('C00024', 'Cook', 'London', 'London', 'UK', 2, 4000, 9000, 7000, 6000, 'FSDDSDF', 'A006'),
('C00015', 'Stuart', 'London', 'London', 'UK', 1, 6000, 8000, 3000, 11000, 'GFSGERS', 'A003'),
('C00002', 'Bolt', 'New York', 'New York', 'USA', 3, 5000, 7000, 9000, 3000, 'DDNRDRH', 'A008'),
('C00018', 'Fleming', 'Brisban', 'Brisban', 'Australia', 2, 7000, 7000, 9000, 5000, 'NHBGVFC', 'A005'),
('C00021', 'Jacks', 'Brisban', 'Brisban', 'Australia', 1, 7000, 7000, 7000, 7000, 'WERTGDF', 'A005'),
('C00019', 'Yearannaidu', 'Chennai', 'Chennai', 'India', 1, 8000, 7000, 7000, 8000, 'ZZZZBFV', 'A010'),
('C00005', 'Sasikant', 'Mumbai', 'Mumbai', 'India', 1, 7000, 11000, 7000, 11000, '147-25896312', 'A002'),
('C00007', 'Ramanathan', 'Chennai', 'Chennai', 'India', 1, 7000, 11000, 9000, 9000, 'GHRDWSD', 'A010'),
('C00022', 'Avinash', 'Mumbai', 'Mumbai', 'India', 2, 7000, 11000, 9000, 9000, '113-12345678', 'A002'),
('C00004', 'Winston', 'Brisban', 'Brisban', 'Australia', 1, 5000, 8000, 7000, 6000, 'AAAAAAA', 'A005'),
('C00023', 'Karl', 'London', 'London', 'UK', 0, 4000, 6000, 7000, 3000, 'AAAABAA', 'A006'),
('C00006', 'Shilton', 'Torento', 'Torento', 'Canada', 1, 10000, 7000, 6000, 11000, 'DDDDDDD', 'A004'),
('C00010', 'Charles', 'Hampshair', 'Hampshair', 'UK', 3, 6000, 4000, 5000, 5000, 'MMMMMMM', 'A009'),
('C00017', 'Srinivas', 'Bangalore', 'Bangalore', 'India', 2, 8000, 4000, 3000, 9000, 'AAAAAAB', 'A007'),
('C00012', 'Steven', 'San Jose', 'San Jose', 'USA', 1, 5000, 7000, 9000, 3000, 'KRFYGJK', 'A012'),
('C00008', 'Karolina', 'Torento', 'Torento', 'Canada', 1, 7000, 7000, 9000, 5000, 'HJKORED', 'A004'),
('C00003', 'Martin', 'Torento', 'Torento', 'Canada', 2, 8000, 7000, 7000, 8000, 'MJYURFD', 'A004'),
('C00009', 'Ramesh', 'Mumbai', 'Mumbai', 'India', 3, 8000, 7000, 3000, 12000, 'Phone No', 'A002'),
('C00014', 'Rangarappa', 'Bangalore', 'Bangalore', 'India', 2, 8000, 11000, 7000, 12000, 'AAAATGF', 'A001'),
('C00016', 'Venkatpati', 'Bangalore', 'Bangalore', 'India', 2, 8000, 11000, 7000, 12000, 'JRTVFDD', 'A007'),
('C00011', 'Sundariya', 'Chennai', 'Chennai', 'India', 3, 7000, 11000, 7000, 11000, 'PPHGRTS', 'A010');



CREATE TABLE  ORDERS (
  ORD_NUM INT NOT NULL PRIMARY KEY, 
	ORD_AMOUNT INT NOT NULL, 
	ADVANCE_AMOUNT INT NOT NULL, 
	ORD_DATE DATE NOT NULL, 
	CUST_CODE VARCHAR(6) NOT NULL REFERENCES CUSTOMER, 
	AGENT_CODE VARCHAR(6) NOT NULL REFERENCES AGENTS, 
	ORD_DESCRIPTION VARCHAR(60) NOT NULL
   );


INSERT INTO ORDERS
VALUES
(200100, 1000, 600, '08/01/2008', 'C00013', 'A003', 'SOD'),
(200110, 3000, 500, '04/15/2008', 'C00019', 'A010', 'SOD'),
(200107, 4500, 900, '08/30/2008', 'C00007', 'A010', 'SOD'),
(200112, 2000, 400, '05/30/2008', 'C00016', 'A007', 'SOD'),
(200113, 4000, 600, '06/10/2008', 'C00022', 'A002', 'SOD'),
(200102, 2000, 300, '05/25/2008', 'C00012', 'A012', 'SOD'),
(200114, 3500, 2000, '08/15/2008', 'C00002', 'A008', 'SOD'),
(200122, 2500, 400, '09/16/2008', 'C00003', 'A004', 'SOD'),
(200118, 500, 100, '07/20/2008', 'C00023', 'A006', 'SOD'),
(200119, 4000, 700, '09/16/2008', 'C00007', 'A010', 'SOD'),
(200121, 1500, 600, '09/23/2008', 'C00008', 'A004', 'SOD'),
(200130, 2500, 400, '07/30/2008', 'C00025', 'A011', 'SOD'),
(200134, 4200, 1800, '09/25/2008', 'C00004', 'A005', 'SOD'),
(200108, 4000, 600, '02/15/2008', 'C00008', 'A004', 'SOD'),
(200103, 1500, 700, '05/15/2008', 'C00021', 'A005', 'SOD'),
(200105, 2500, 500, '07/18/2008', 'C00025', 'A011', 'SOD'),
(200109, 3500, 800, '07/30/2008', 'C00011', 'A010', 'SOD'),
(200101, 3000, 1000, '07/15/2008', 'C00001', 'A008', 'SOD'),
(200111, 1000, 300, '07/10/2008', 'C00020', 'A008', 'SOD'),
(200104, 1500, 500, '03/13/2008', 'C00006', 'A004', 'SOD'),
(200106, 2500, 700, '04/20/2008', 'C00005', 'A002', 'SOD'),
(200125, 2000, 600, '10/10/2008', 'C00018', 'A005', 'SOD'),
(200117, 800, 200, '10/20/2008', 'C00014', 'A001', 'SOD'),
(200123, 500, 100, '09/16/2008', 'C00022', 'A002', 'SOD'),
(200120, 500, 100, '07/20/2008', 'C00009', 'A002', 'SOD'),
(200116, 500, 100, '07/13/2008', 'C00010', 'A009', 'SOD'),
(200124, 500, 100, '06/20/2008', 'C00017', 'A007', 'SOD'),
(200126, 500, 100, '06/24/2008', 'C00022', 'A002', 'SOD'),
(200129, 2500, 500, '07/20/2008', 'C00024', 'A006', 'SOD'),
(200127, 2500, 400, '07/20/2008', 'C00015', 'A003', 'SOD'),
(200128, 3500, 1500, '07/20/2008', 'C00009', 'A002', 'SOD'),
(200135, 2000, 800, '09/16/2008', 'C00007', 'A010', 'SOD'),
(200131, 900, 150, '08/26/2008', 'C00012', 'A012', 'SOD'),
(200133, 1200, 400, '06/29/2008', 'C00009', 'A002', 'SOD');

SELECT * FROM ORDERS

-- ORDER TABLE
-- From the ORDER table, find the custmer that ordered above 4000
SELECT CUST_CODE, ORD_NUM, ORD_AMOUNT FROM ORDERS
WHERE ORD_AMOUNT >4000


-- show the customer with the highest ORDER, show the date of the order, the amount, the agent who sold it  and what was sold
SELECT TOP 1 ORD_DATE, ORD_AMOUNT, AGENT_CODE, ORD_DESCRIPTION FROM ORDERS
ORDER BY ORD_AMOUNT DESC


-- what is the sum of the total order
SELECT SUM(ORD_AMOUNT) AS Total_ORDER FROM ORDERS


-- Find the total order amount of customer with the ID C00025, and what agent sold to him
SELECT CUST_CODE, AGENT_CODE, SUM(ORD_AMOUNT + ADVANCE_AMOUNT) AS Total_Order FROM ORDERS
WHERE CUST_CODE = 'C00025'
GROUP BY CUST_CODE, AGENT_CODE


-- Show the agents who has sold goods woth above 3000 for the organisation
-- REturn the agentID , Amount of ORDER
SELECT Agent_Code, ORD_DESCRIPTION,  ORD_AMOUNT FROM ORDERS
WHERE ORD_AMOUNT > 3000


-- Summing up All the orders, what agent made the highest average sales
SELECT TOP 1 AGENT_CODE, AVG(ORD_AMOUNT+ ADVANCE_AMOUNT) AS AVERAGE_SALE FROM ORDERS
GROUP BY AGENT_CODE
ORDER BY AVERAGE_SALE DESC
-- SELECT AGENT_CODE, AVG(ORD_AMOUNT + ADVANCE_AMOUNT) as AVERAGE_SALES
-- FROM ORDERS
-- GROUP BY AGENT_CODE
-- ORDER BY AVERAGE_SALES DESC


-- What customer made the most ORDER
SELECT TOP 1 CUST_CODE, SUM(ORD_AMOUNT + ADVANCE_AMOUNT) AS TOTAL_ORDER FROM ORDERS
GROUP BY CUST_CODE
ORDER BY TOTAL_ORDER DESC
-- SELECT TOP 1 CUST_CODE, AVG(ORD_AMOUNT + ADVANCE_AMOUNT) AS AVERAGE_ORDER FROM ORDERS
-- GROUP BY CUST_CODE
-- ORDER BY AVERAGE_ORDER DESC


SELECT * FROM CUSTOMER
-- CUSTOMER TABLE------
-- SHOW ALL THE CUSTOMER WITH 'EA' IN THEIR NAMES
SELECT CUST_NAME, CUST_CITY, OPENING_AMT FROM CUSTOMER
WHERE CUST_NAME LIKE '%ea%';

-- Fleming is our best customer, show me all information about him
SELECT * FROM CUSTOMER
WHERE CUST_NAME= 'Fleming'

-- Summing up all the Amounts, which customer is out best, and what is his phone number
SELECT TOP 1 CUST_NAME, CUST_CODE, PHONE_NO, SUM (PAYMENT_AMT - OUTSTANDING_AMT) AS BEST_CUSTOMER  FROM CUSTOMER
GROUP BY CUST_NAME, CUST_CODE, PHONE_NO
ORDER BY BEST_CUSTOMER DESC

-- What customer has the highest payment amount
SELECT TOP 1 CUST_NAME, SUM(PAYMENT_AMT) AS HIGHEST_PAYMENT_AMT FROM CUSTOMER
GROUP BY CUST_NAME
ORDER BY HIGHEST_PAYMENT_AMT DESC

-- What is the sum of the total amount that the company is owed
SELECT SUM(OUTSTANDING_AMT) AS TOTAL_AMT_OWED FROM CUSTOMER 

-- What is the total sum of money inflow to the company
SELECT SUM(OPENING_AMT + RECEIVE_AMT + PAYMENT_AMT) AS TOTAL_INFLOW FROM CUSTOMER


---------------- AGENT TABLE -------------------------
-- In the Question 5 under the Order Table, show the information of these Agents
SELECT 

-- Show the agents who has sold goods woth above 3000 for the organisation
-- REturn the agentID , Amount of ORDER
SELECT Agent_Code, ORD_DESCRIPTION,  ORD_AMOUNT FROM ORDERS
WHERE ORD_AMOUNT > 3000

-- In the question 4 of customer table, show the agents information

-- JOIN---------EXAMPLE
SELECT ORDERS.AGENT_CODE, ORDERS.ORD_AMOUNT, CUSTOMER.CUST_NAME, CUSTOMER.CUST_CITY
FROM ORDERS
LEFT JOIN CUSTOMER ON ORDERS.AGENT_CODE = CUSTOMER.AGENT_CODE

SELECT 


