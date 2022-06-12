CREATE DATABASE `Database1`;
CREATE SCHEMA  Database2;

DROP DATABASE `Database2`;

/* CREATE TABLE */

CREATE TABLE Database1.Person (
PersonID INT NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(255),
    PRIMARY KEY(PersonID)
);

CREATE TABLE Database2.human (
HumanID INT NOT NULL PRIMARY KEY,
    LastName VARCHAR(255) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    Age INT NOT NULL UNIQUE,
    SchoolID INT NOT NULL,
    City VARCHAR(255) DEFAULT 'NEW DELHI',
    UNIQUE (HumanID),
    UNIQUE (SchoolID),
    CHECK (Age>=18),
    FOREIGN KEY (SchoolID) REFERENCES database1.person(PersonID)
);


/* ALTER TABLE */
ALTER TABLE database1.person 
CHANGE COLUMN City City VARCHAR(25) NOT NULL ;

ALTER TABLE database1.person 
DROP COLUMN City,
ADD COLUMN `Pincode` INT(5) NOT NULL;
;

ALTER TABLE database1.person 
MODIFY COLUMN Pincode INT NOT NULL UNIQUE;

ALTER TABLE database1.person 
ADD COLUMN CollegeID INT NOT NULL AFTER Address
;

ALTER TABLE database1.person
ADD UNIQUE INDEX PersonID_UNIQUE (PersonID),
ADD UNIQUE INDEX CollegeID_UNIQUE (CollegeID);

ALTER TABLE database1.person 
DROP INDEX CollegeID_UNIQUE,
DROP INDEX PersonID_UNIQUE;

ALTER TABLE database1.person 
ADD UNIQUE (PersonID),
ADD UNIQUE (CollegeID);

ALTER TABLE database1.person 
DROP INDEX CollegeID,
DROP INDEX PersonID;

ALTER TABLE database1.person
ADD CONSTRAINT PersonID UNIQUE (PersonID),
ADD CONSTRAINT CollegeID UNIQUE (CollegeID);

ALTER TABLE database1.person
DROP PRIMARY KEY,
ADD PRIMARY KEY (PersonID,CollegeID);

ALTER TABLE database1.person 
DROP PRIMARY KEY,
ADD PRIMARY KEY (PersonID);

ALTER TABLE database1.person
ADD COLUMN Age INT NOT NULL UNIQUE,
ADD CHECK (Age>=18);



/* CREATE VIEW */
CREATE VIEW Database1.Alexa AS
SELECT
    sakila.customer.customer_id As Customer,
    SUM(sakila.payment.amount) As `Total Payment`,
    COUNT(sakila.payment.rental_id) As `Total Rentals`
FROM
    sakila.customer INNER JOIN
    sakila.payment ON sakila.payment.customer_id = sakila.customer.customer_id
GROUP BY
    sakila.customer.customer_id
HAVING
    Sum(sakila.payment.amount) >= 150
ORDER BY
   Customer
;


/* RENAME TABLE NAME */
ALTER TABLE database2.human
RENAME TO database2.people;

