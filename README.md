steps of setting sql(sql workbench and sql server)

SQL server:

download the latest sql https://dev.mysql.com/downloads/mysql/

set root and remember the passward you set

open .bash_profile and set path directly to the path where the sql was downloaded extend: The ~/.bash_profile file is a configuration file for configuring user environments. The users can modify the default settings and add any extra configurations in it. $ls -al (check to make sure there is a .bash_profile)

$open -t .bash_profile

in .bash_profile, add the sentence below export PATH=${PATH}:/usr/local/mysql/bin/

open a new terminal $mysql -u root -p
mysql>

mysql > show databases;
