steps of setting sql(sql workbench and sql server)
1. ==============================

SQL server:
download the latest sql https://dev.mysql.com/downloads/mysql/

2. ==============================

set root and remember the passward you set

open .bash_profile and set path directly to the path where the sql was downloaded extend: The ~/.bash_profile file is a configuration file for configuring user environments. The users can modify the default settings and add any extra configurations in it. $ls -al (check to make sure there is a .bash_profile)

$open -t .bash_profile

in .bash_profile, add the sentence below export PATH=${PATH}:/usr/local/mysql/bin/

open a new terminal $mysql -u root -p
mysql>
mysql > show databases;

3. ==============================

simple setting of mysql server
enter mysql shell
then 
(1) mysql> CREATE USER 'jimmy'@'localhost' IDENTIFIED BY 'your_password';
	if it shows ok, then it is done
(2) then just use $mysql -u user -p (user is jimmy here)

(3) we can also check where user is set successfully 
    mysql> SHOW GRANTS FOR 'admin'@'localhost';

4.==============================

modify passward
(1) mysql> SET PASSWORD FOR 'jimmy'@'localhost' = PASSWORD('your_ps');
	this is for root to change passward
(2 ) if user is already set, it will be much easier
	SET PASSWORD = PASSWORD('your_ps');

5. ==============================

delete user that is created
mysql> DROP USER 'jimmy'@'localhost';





