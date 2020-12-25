TASK 3.1 Database Administration

Step 1. Connected to VM for ssh. Downloaded MySQL server for Ubuntu on VM. Installed MySQL server on VM and ran mysql:
![](images/scr1.png)

Step 2. Database schema (3 tables):

![](images/schema.png)

Step 3. Created database (bamikdb), created tables (classes, cars and owners)  and filled in tables (INSERT INTO tables):

![](images/scr2.png)

Step 4.Some queries:

![](images/scr5.png)

![](images/scr3.png)

![](images/scr4.png)

Step 5. Created a new user with different privileges and connected to db. Made a selection from db.

[](images/scr6.png)


Step 6. Made backup my database, deleted table and restored:

voloshchuk@s1-voloshchuk:~$ sudo mysqldump -u root -p bamikdb > backupdb.sql
Enter password: 
voloshchuk@s1-voloshchuk:~$ ls
backupdb.sql


mysql> USE bamikdb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+-------------------+
| Tables_in_bamikdb |
+-------------------+
| cars              |
| classes           |
| owners            |
+-------------------+
3 rows in set (0.01 sec)

mysql> DROP TABLE cars;
Query OK, 0 rows affected (2.26 sec)

mysql> SHOW TABLES;
+-------------------+
| Tables_in_bamikdb |
+-------------------+
| classes           |
| owners            |
+-------------------+
2 rows in set (0.00 sec)

mysql> CREATE DATABASE bamiknewdb;
Query OK, 1 row affected (0.55 sec)

mysql> USE bamiknewdb;
Database changed
mysql> \q
Bye
voloshchuk@s1-voloshchuk:~$ mysql -u root -p bamiknewdb < backupdb.sql
Enter password: 
ERROR 1698 (28000): Access denied for user 'root'@'localhost'
voloshchuk@s1-voloshchuk:~$ sudo mysql -u root -p bamiknewdb < backupdb.sql
Enter password: 
voloshchuk@s1-voloshchuk:~$ sudo mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 24
Server version: 8.0.22-0ubuntu0.20.04.3 (Ubuntu)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| bamikdb            |
| bamiknewdb         |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.01 sec)

mysql> USE bamiknewdb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+----------------------+
| Tables_in_bamiknewdb |
+----------------------+
| cars                 |
| classes              |
| owners               |
+----------------------+
3 rows in set (0.00 sec)

mysql> 

Step 7. Transfered my local DB to RDS AWS:

