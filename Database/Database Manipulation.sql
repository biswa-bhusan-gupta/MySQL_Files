CREATE DATABASE `Database3`;

create table Database3.Person(
ID INT PRIMARY KEY NOT NULL UNIQUE,
FirstName VARCHAR(25) NOT NULL,
LastName VARCHAR(25) NOT NULL,
Age INT NOT NULL
);

/* ORDER : SELECT -> FROM -> WHERE -> ORDER BY -> LIMIT */
/* ORDER : SELECT -> FROM -> WHERE -> GROUP BY -> HAVING */
/* HAVING : Agggregated Function with Condition ; WHERE : Non Aggregated with Condition */

/* SELECT */
SELECT * FROM Database3.Person;
SELECT * FROM Database3.Person LIMIT 5;


/* INSERT */
INSERT INTO Database3.Person VALUES (1,'Biswa Bhusan','Gupta',25);
INSERT INTO Database3.Person (ID,FirstName,LastName,Age) VALUES (2,'Anup','Gupta',27);
INSERT INTO Database3.Person VALUES (3,'Lalit','Tripathy',25);
INSERT INTO Database3.Person VALUES (4,'Yash','Gupta',22);
INSERT INTO Database3.Person VALUES (5,'Tushar','Srivastava',28);
INSERT INTO Database3.Person VALUES (6,'Tavish','Awasthy',27);

/* DELETE */
DELETE FROM Database3.Person WHERE ID = '6';
DELETE FROM Database3.Person WHERE ID BETWEEN 3 AND 5;



/* WHERE,AND,OR */
SELECT * FROM Database3.Person
WHERE Age = '28';

SELECT * FROM Database3.Person
WHERE Age = '28' OR LastName ='Gupta';

SELECT * FROM Database3.Person
WHERE Age = '28' OR Age ='27';

SELECT * FROM Database3.Person
WHERE Age = '28' AND ID ='5';

SELECT * FROM Database3.Person
WHERE LastName in ('Gupta','Awasthy');

/* ORDER BY (ASC/DESC) */
SELECT * FROM Database3.Person
ORDER BY Age ASC; 

/* UPADATE */
UPDATE Database3.Person 
SET FirstName = 'Anoop'
WHERE ID = '2';

UPDATE Database3.Person
SET FirstName = 'Alvin',LastName ='Smith'
WHERE ID IN (4,5);

/* SET */
SET @Age=24;
SELECT * FROM Database3.Person 
WHERE Age > @Age

