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
(primary key (id), -- this means id is the main key to 
  id int(3), -- 3 means the range will be between 000 - 999 . so this can be vary
  first_name varchar(100), -- the maximum size of varchar is 100
  last_name varhcar(100), -- same as above
  height decimal(3,1) -- this means height can be 3 digits and 2 decimal
  );

(7) delete a database
drop database dname;

(8) after steps in (6), we have created a table. Then to show the information of the table, we use the command below
mysql> describe tablename

(9) add data to the table we created
mysql> insert into personal_info 
    -> values
    -> (001, 'Yinzhe', 'Li', '160');

this will insert a row of data into the table we created

7.important command for query
==============================
(1) mysql> select * form personal_info
this command will return the entire table

(2) mysql> select column1, column2 ... from personal_info;
* mysql> select colunm1, column2 ... from personal_info where id = 1; -- watch out here, we can not have multi condition like: id = 15, 25, 35
* if we want to find specific name, we should use double quote. e.g. where a="guo";	
* if we want to find name, where no specific name is found. We shoudl use %. e.g where last_name like "%juan%";

in summary, where is followed by a condition. as long as the cindition can be found, we can use it to query something.
e.g. select * from orders
where 
first_name = "guo"
or 
last_name like "%juan%";

(3) the result after querying can be ordered. And it is ordered by the oerder_value. By default, order by increment, otherwise, it is ordered by descment.
e.g. select * from orders where first_name = "guo"
order by order_value desc; -- desc here means we order by descment 

(4) we can limit the number of data we want
e.g select (which columns)
    from (what table)
    where (on what condition)
    order by (one what kind of order)
    limit (how many lines you want to show)

(5) 
