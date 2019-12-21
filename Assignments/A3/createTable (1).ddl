-- Create accounts table
CREATE TABLE Accounts(
	username CHAR(10) NOT NULL,
	name CHAR(20) NOT NULL,
	balance DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (username)
);

-- Data to load into table Accounts
INSERT INTO Accounts (USERNAME,NAME,BALANCE) VALUES ('thor', 'Thor', 4250);
INSERT INTO Accounts (USERNAME,NAME,BALANCE) VALUES ('hulk', 'The Hulk', 4750);
INSERT INTO Accounts (USERNAME,NAME,BALANCE) VALUES ('nat', 'Black Widow', 550);
INSERT INTO Accounts (USERNAME,NAME,BALANCE) VALUES ('capt', 'Captain America', 1250);

-- List all Tables
SHOW TABLES;

-- Display all Records in table Accounts
SELECT * FROM Accounts;
