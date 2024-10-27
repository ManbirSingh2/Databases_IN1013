task 2

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


mysql> SELECT * FROM petPet;
+----------+--------+---------+--------+------------+-------+
| petname  | owner  | species | gender | birth      | death |
+----------+--------+---------+--------+------------+-------+
| Claws    | Owner2 | M       | M      | 1995-01-20 | NULL  |
| Fluffy   | Owner1 | F       | F      | 2015-05-10 | NULL  |
| Hammy    | Diane  | M       | M      | 2010-10-30 | NULL  |
| Puffball | Owner3 | F       | F      | 2018-03-15 | NULL  |
+----------+--------+---------+--------+------------+-------+
4 rows in set (0.02 sec)

mysql> SELECT * FROM petEvent;
+----------+------------+-----------+-----------------------+
| petname  | eventdate  | eventtype | remark                |
+----------+------------+-----------+-----------------------+
| Claws    | 1997-08-03 | injury    | broke the rib         |
| Fluffy   | 2020-10-15 | vet       | antibiotics           |
| Hammy    | 2020-10-15 | vet       | antibiotics           |
| Hammy    | 2020-10-30 | birth     | had 5 kittens, 2 male |
| Puffball | 2020-09-01 | death     | died                  |
+----------+------------+-----------+-----------------------+
5 rows in set (0.00 sec)

mysql>