task 1
Enter password: *********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
Server version: 8.0.40 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> DROP DATABASE IF EXISTS pet_database;
Query OK, 0 rows affected (0.04 sec)

mysql> CREATE DATABASE pet_database;
Query OK, 1 row affected (0.02 sec)

mysql> USE pet_database;
Database changed
mysql> CREATE TABLE petPet(
    -> petname VARCHAR(20) PRIMARY KEY,
    -> owner VARCHAR(45),
    -> species VARCHAR(45),
    -> gender CHAR(1) CHECK (gender IN('M','F')),
    -> birth DATE,
    -> death DATE
    -> );
Query OK, 0 rows affected (0.13 sec)

mysql> CREATE TABLE  petEvent (
    -> petname VARCHAR(20),
    -> eventdate DATE,
    -> eventtype VARCHAR(15),
    -> remark VARCHAR(255),
    -> PRIMARY KEY(petname,eventdate),
    -> FOREIGN KEY (petname) REFERENCES petpet(petname)
    -> );
Query OK, 0 rows affected (0.05 sec)

mysql> INSERT INTO petPet (petname, owner, species, gener, birth, death) VALUES
    -> ('Fluffy', 'Owner1', 'F', 'Female', '2015-05-10',NULL),
    -> ('Hammy', 'Diane', 'M', 'Male', '2010-10-30', NULL),
    -> ('Claws', 'Owner2', 'M', 'Male', '1995-01-20', NULL),
    -> ('Puffball', Owner3', 'F', 'Female', '2018-03-15',NULL);
    '>
    '> ^C
mysql>
mysql> INSERT INTO petPet (petname, owner, species, gender, birth, death) VALUES
    -> ('Fluffy', 'Owner1', 'F', 'F', '2015-05-10', NULL),
    -> ('Hammy', 'Diane', 'M', 'M', '2010-10-30', NULL),
    -> ('Claws', 'Owner2', 'M', 'M', '1995-01-20', NULL),
    -> ('Puffball', 'Owner3', 'F', 'F', '2018-03-15', NULL);
Query OK, 4 rows affected (0.02 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> INSERT INTO petEvent (petname, eventdate, eventtype, remark) VALUES
    -> ('Fluffy', '2020-10-15', 'vet', 'antibiotics'),
    -> ('Hammy', '2020-10-15', 'vet', 'antibiotics'),
    -> ('Claws', '1997-08-03', 'injury', 'broke the rib'),
    -> ('Puffball', '2020-09-01', 'death', 'died'),
    -> ('Hammy', '2020-10-30', 'birth', 'had 5 kittens, 2 male');
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql>