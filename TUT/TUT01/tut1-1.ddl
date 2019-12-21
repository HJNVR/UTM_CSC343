-- This is a sample script for tutorial 1

CREATE TABLE Course(cid INT NOT NULL, name CHAR(10), PRIMARY KEY (cid));


CREATE TABLE TA(tid INT NOT NULL, name CHAR(10), cid INT, PRIMARY KEY (tid), FOREIGN KEY (cid) REFERENCES Course(cid));


-- Populates Course table

INSERT INTO Course VALUES ('343', 'Database');
INSERT INTO Course VALUES ('314', 'Machine Learning');


-- Populate TA table

INSERT INTO TA VALUES ('0001', 'John','343');
INSERT INTO TA VALUES ('0002', 'Smith', '343');
INSERT INTO TA VALUES ('0003', 'Mary', '314');

-- List all tables in database
SHOW TABLES;

-- List all records of TA table
SELECT * FROM TA;
SELECT * FROM Course;
