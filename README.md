steps of setting sql(sql workbench and sql server)
==============================
tips: in readme, the points sentence show be written as exactly 

1.SQL server:
==============================

download the latest sql https://dev.mysql.com/downloads/mysql/

2.set root and remember the passward you set
==============================

open .bash_profile and set path directly to the path where the sql was downloaded extend: The ~/.bash_profile file is a configuration file for configuring user environments. The users can modify the default settings and add any extra configurations in it. $ls -al (check to make sure there is a .bash_profile)

$open -t .bash_profile

in .bash_profile, add the sentence

 below export PATH=${PATH}:/usr/local/mysql/bin/

open a new terminal $mysql -u root -p
mysql>
mysql > show databases;

3.simple setting of mysql server
==============================

* There are two ways of setting logging account

Way One: log in as root 

$ mysql -u root -p 
enter passward: 
then 
(1) mysql> CREATE USER 'jimmy'@'localhost' IDENTIFIED BY 'your_password';
	if it shows ok, then it is done

(2) GRANT ALL PRIVILEGES ON *.* TO 'jimmy'@'localhost' WITH GRANT OPTION;
  // this line gives the user you set all rights to deal with databases

(2) then just use $mysql -u user -p (user is jimmy here)

(3) we can also check where user is set successfully 
    mysql> SHOW GRANTS FOR 'admin'@'localhost';

Way two: 

after setting, $mysql -u username -p 
enter passward:

4.modify passward: SET or ALERT
==============================

(1) mysql> SET PASSWORD FOR 'jimmy'@'localhost' = PASSWORD('your_ps');
	this is for root to change passward
(2 ) if user is already set, it will be much easier
	SET PASSWORD = PASSWORD('your_ps');
or alter user user() identified by 'your_ps'


5.delete user that is created
==============================

(1)mysql> DROP USER 'jimmy'@'localhost';
so on 

6.commands in mysql server/ shell
==============================
(1) check what databases are there in current account
mysql> show datadbases;

(2) enter the database you want:
mysql> use dname;

(3) show what database you are currently in
mysql> show database();

(4) create a new database
mysql> create database dname;

(5) show what tables are there in the current database
mysql> show table person;

(6) create a new table 
mysql > create table ;

* there is a difference between mysql and execl : when initalizing table in sql,it can not be empty. However, when table of mysql is created, the content and type of the data must be set.
e.g:	
mysql> Create table personal_info
( Primary key (id), -- this means id is the main key to 
  id int(3); -- 3 means the range will be between 000 - 999 . so this can be vary
  first_name varchar(100);

(7) delete a database
drop database dname;




