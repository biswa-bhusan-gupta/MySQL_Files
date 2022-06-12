CREATE DATABASE `Database4`;


/* Alpha Table */
CREATE TABLE Database4.Alpha (
	ID1 int NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Age VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY(ID1)
);

CREATE TABLE Database4.Alpha_New (
	ID1 int NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Age VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY(ID1)
);

/* FOREIGN KEY For Beta Table */
CREATE TABLE Database4.Beta (
	ID2 INT NOT NULL,
    Pincode INT NOT NULL,
    FID INT NOT NULL,
    primary key(ID2),
    FOREIGN KEY(FID) REFERENCES Database4.Alpha(ID1)
);

/* Gamma Table */
CREATE TABLE Database4.Gamma (
	ID3 INT NOT NULL,
    Location VARCHAR(25) NOT NULL,
    primary key(ID3)
);

INSERT INTO Database4.Alpha (ID1,Name,Age) VALUES (1,'A',25);
INSERT INTO Database4.Alpha VALUES (2,'B',26);
INSERT INTO Database4.Alpha VALUES (3,'D',27);
INSERT INTO Database4.Alpha VALUES (5,'E',29);

INSERT INTO Database4.Alpha_New (ID1,Name,Age) VALUES (1,'A',25);
INSERT INTO Database4.Alpha_New VALUES (2,'B',26);
INSERT INTO Database4.Alpha_New VALUES (3,'D',27);
INSERT INTO Database4.Alpha_New VALUES (5,'E',29);

INSERT INTO Database4.Beta (ID2,Pincode,FID) VALUES (11,25,1);
INSERT INTO Database4.Beta VALUES (13,27,3);
INSERT INTO Database4.Beta VALUES (15,29,5);

INSERT INTO Database4.Gamma (ID3,Location) VALUES (1,'BBSR');
INSERT INTO Database4.Gamma VALUES (3,'BDK');
INSERT INTO Database4.Gamma VALUES (4,'BAL');
INSERT INTO Database4.Gamma VALUES (5,'JAJ');

SELECT * FROM Database4.Alpha;
SELECT * FROM Database4.Beta;
SELECT * FROM Database4.Gamma;

/* <-------------------------------------- INNER JOIN ------------------------------------->*/

/* I. For Beta Table */
SELECT
    database4.alpha.ID1 As `Alpha ID`,
    database4.alpha.Name,
    database4.alpha.Age,
    database4.beta.ID2 As `Beta ID`,
    database4.beta.Pincode,
    database4.beta.FID
FROM
    database4.alpha INNER JOIN
    database4.beta ON database4.beta.FID = database4.alpha.ID1;

/* II. For Gamma Table */
SELECT
    database4.alpha.ID1 As `Alpha ID`,
    database4.alpha.Name,
    database4.alpha.Age,
    database4.gamma.ID3 As `Gamma ID`,
    database4.gamma.Location
FROM
    database4.alpha INNER JOIN
    database4.gamma ON database4.gamma.ID3 = database4.alpha.ID1;


/* <-------------------------------------- LEFT JOIN ------------------------------------->*/

/* I. For Beta Table */
SELECT
    database4.alpha.ID1 As `Alpha ID`,
    database4.alpha.Name,
    database4.alpha.Age,
    database4.beta.ID2 As `Beta ID`,
    database4.beta.Pincode
FROM
    database4.alpha LEFT JOIN
    database4.beta ON database4.beta.FID = database4.alpha.ID1;
   
/* II. For Gamma Table */
SELECT
    database4.alpha.ID1 As `Alpha ID`,
    database4.alpha.Name,
    database4.alpha.Age,
    database4.gamma.ID3 As `Gamma ID`,
    database4.gamma.Location
FROM
    database4.alpha LEFT JOIN
    database4.gamma ON database4.alpha.ID1 = database4.gamma.ID3;
    
/* <-------------------------------------- RIGHT JOIN ------------------------------------->*/

/* I. For Beta Table */
SELECT
    database4.alpha.ID1 As `Alpha ID`,
    database4.alpha.Name,
    database4.alpha.Age,
    database4.beta.ID2 As `Beta ID`,
    database4.beta.Pincode
FROM
    database4.alpha RIGHT JOIN
    database4.beta ON database4.beta.FID = database4.alpha.ID1;

/* II. For Gamma Table */       
SELECT
    database4.alpha.ID1 As `Alpha ID`,
    database4.alpha.Name,
    database4.alpha.Age,
    database4.gamma.ID3 As `Gamma ID`,
    database4.gamma.Location
FROM
    database4.alpha RIGHT JOIN
    database4.gamma ON database4.alpha.ID1 = database4.gamma.ID3;
    
/* <-------------------------------------- FULL JOIN ------------------------------------->*/

/* I. For Beta Table */
SELECT
    database4.alpha.ID1 As `Alpha ID`,
    database4.alpha.Name,    
    database4.alpha.Age,
    database4.beta.ID2 As `Beta ID`,
    database4.beta.Pincode
FROM
    database4.alpha FULL JOIN
    database4.beta ON database4.beta.FID = database4.alpha.ID1;

/* II. For Gamma Table */       
SELECT
    database4.alpha.ID1 As `Alpha ID`,
    database4.alpha.Name,
    database4.alpha.Age,
    database4.gamma.ID3 As `Gamma ID`,
    database4.gamma.Location
FROM
    database4.alpha FULL JOIN
    database4.gamma On database4.gamma.ID3 = database4.alpha.ID1;    
  
  
/* <-------------------------------------- FULL JOIN ------------------------------------->*/

SELECT * FROM Database4.Alpha
UNION 
SELECT * FROM Database4.Alpha_New;

SELECT * FROM Database4.Alpha
UNION ALL
SELECT * FROM Database4.Alpha_New;