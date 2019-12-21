DROP TABLE IF EXISTS WorksIn;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department; 

CREATE TABLE IF NOT EXISTS Employee(
	eid INT AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	type ENUM('Full-Time','Contract','Other') NOT NULL,
	salary INT,
	PRIMARY KEY(eid)
);

CREATE TABLE IF NOT EXISTS Department(
	did INT AUTO_INCREMENT,
	name VARCHAR(25) NOT NULL,
	budget INT,
	PRIMARY KEY(did)
);

CREATE TABLE IF NOT EXISTS WorksIn(
	eid INT, 
	did INT,
	manager BOOLEAN,
	PRIMARY KEY(eid,did),
	CONSTRAINT `FK1` FOREIGN KEY(eid) REFERENCES Employee(eid) ON DELETE CASCADE,
	FOREIGN KEY(did) REFERENCES Department(did)
);

SHOW TABLES;
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM WorksIn;

-- notice that I don't have to put in a PK as it will autogenerate
INSERT INTO Employee (name, type, salary) VALUES ("Sarah", "Full-Time", 75000);
INSERT INTO Employee (name, type, salary) VALUES ("Joey", "Full-Time", 71500);
INSERT INTO Employee (name, type, salary) VALUES ("Jenny", "Contract", 50000);

-- notice that if I try this insert statement I will get an error based on the incorrect type
-- INSERT INTO Employee (name, type, salary) VALUES ("Steven","Part-Time",45000);

-- now notice that if I try this insert statement I can write the Employee with a specified eid
--  INSERT INTO Employee (eid, name, type, salary) VALUES (10, "Steven","Other",45000); 

SELECT * FROM Employee;

INSERT INTO Department (name, budget) VALUES ("Shoes", 500000);
INSERT INTO Department (name, budget) VALUES ("Clothing", 750000);
INSERT INTO Department (name, budget) VALUES ("Jewelry", 2500000);

SELECT * FROM Department;

INSERT INTO WorksIn (eid, did, manager) VALUES (1, 1, True);
INSERT INTO WorksIn (eid, did, manager) VALUES (1, 2, True);
INSERT INTO WorksIn (eid, did, manager) VALUES (2, 2, False);
INSERT INTO WorksIn (eid, did, manager) VALUES (2, 3, False);
INSERT INTO WorksIn (eid, did, manager) VALUES (3, 2, False);

-- notice that if I insert a duplicate record, like the one below, I get a FK error!
-- INSERT INTO WorksIn (eid, did, manager) VALUES (2, 2, False);

SELECT * FROM WorksIn;

-- What happens if I delete a record from Employee? For example:
-- DELETE FROM Employee WHERE eid = 3;
-- If you view your Employees Table, Jenny is gone.
-- If you view your WorksIn Table, you'll also notice she was removed here too!


