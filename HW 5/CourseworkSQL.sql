
/* Student name: Manbir Singh */
/* Student ID: */

/* SECTION 1 - CREATE TABLE STATEMENTS */


CREATE TABLE Animals (
     animal_id VARCHAR(10) PRIMARY KEY,
     name VARCHAR(50),
     species VARCHAR(30),
     breed VARCHAR(50),
     age INT,
     adoption_status VARCHAR(20)
 );


CREATE TABLE Adopters (
     adopter_id VARCHAR(10) PRIMARY KEY,
     name VARCHAR(50),
     phone_number VARCHAR(15),
     email VARCHAR(50),
     address VARCHAR(100)
 );

CREATE TABLE Staff (
     staff_id VARCHAR(10) PRIMARY KEY,
     name VARCHAR(50),
     role VARCHAR(30),
     salary DECIMAL(10, 2)
 );


CREATE TABLE Adoptions (
     adoption_id VARCHAR(10) PRIMARY KEY,
     animal_id VARCHAR(10),
     adopter_id VARCHAR(10),
     adoption_date DATE,
     staff_id VARCHAR(10),
     FOREIGN KEY (animal_id) REFERENCES Animals(animal_id),
     FOREIGN KEY (adopter_id) REFERENCES Adopters(adopter_id),
     FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
 );
 
 
/* SECTION 2 - INSERT STATEMENTS */

INSERT INTO Animals VALUES
     ("A001", "Bella", "Dog", "Labrador", 3, "Available"),
     ("A002", "Max", "Cat", "Siamese", 2, "Adopted"),
     ("A003", "Charlie", "Dog", "Beagle", 4, "Available"),
     ("A004", "Lucy", "Rabbit", "Lop", 1, "Adopted"),
     ("A005", "Daisy", "Dog", "Bulldog", 5, "Available"),
     ("A006", "Oscar", "Cat", "Persian", 3, "Available"),
     ("A007", "Lola", "Rabbit", "Netherland Dwarf", 2, "Adopted"),
     ("A008", "Milo", "Snake", "Corn Snake", 2, "Available"),
     ("A009", "Simba", "Cat", "Maine Coon", 4, "Available"),
     ("A010", "Coco", "Hamster", "Syrian", 1, "Adopted");


INSERT INTO Adopters VALUES
     ("B001", "Manbir", "07123456789", "manbir@email.com", "123 Maple Street, Morpeth, NE61 3RP"),
     ("B002", "Maya", "07123456780", "maya@email.com", "58 Oak Avenue, Alnwick, NE66 7ST"),
     ("B003", "Maria", "07123456781", "maria@email.com", "982 Pine Road, Byker, NE6 3RE"),
     ("B004", "Joe", "07123456782", "joe@email.com", "301 Birch Lane, Sunderland, SR2 4PO"),
     ("B005", "Harry", "07123456783", "harry@email.com", "625 Elm Street, Durham, DH3 9PQ"),
     ("B006", "Riya", "07123456784", "riya@email.com", "471 Cedar Close, Morpeth, NE65 9DR"),
     ("B007", "Preet", "07123456785", "preet@email.com", "812 Willow Street, Alnwick, NE66 8FQ"),
     ("B008", "Olivia", "07123456786", "olivia@email.com", "256 Ash Crescent, Byker, NE6 3RB"),
     ("B009", "Daniel", "07123456787", "daniel@email.com", "394 Birchwood Road, Durham, DH3 9PQ"),
     ("B010", "Liam", "07123456788", "liam@email.com", "506 Cedar Lane, Morpeth, NE61 3HS");


INSERT INTO Staff VALUES
     ("S001", "John Smith", "Manager", 35000.00),
     ("S002", "Emily Johnson", "Veterinarian", 42000.00),
     ("S003", "Michael Brown", "Adoption Coordinator", 30000.00),
     ("S004", "Sarah Davis", "Animal Caretaker", 25000.00),
     ("S005", "David Martinez", "Receptionist", 22000.00),
     ("S006", "Sophia Wilson", "Volunteer Coordinator", 27000.00),
     ("S007", "James Taylor", "Shelter Manager", 38000.00),
     ("S008", "Isabella Moore", "Social Media Coordinator", 28000.00),
     ("S009", "William Lee", "Animal Trainer", 33000.00),
     ("S010", "Ava Harris", "Fundraising Manager", 31000.00);


INSERT INTO Adoptions VALUES
     ("AD001", "A001", "B001", "2024-12-01", "S001"),
     ("AD002", "A002", "B002", "2024-12-05", "S002"),
     ("AD003", "A003", "B003", "2024-12-10", "S003"),
     ("AD004", "A004", "B004", "2024-03-12", "S004"),
     ("AD005", "A005", "B005", "2024-07-15", "S005"),
     ("AD006", "A006", "B006", "2024-12-18", "S006"),
     ("AD007", "A007", "B007", "2024-12-20", "S007"),
     ("AD008", "A008", "B008", "2024-11-22", "S008"),
     ("AD009", "A009", "B009", "2024-12-25", "S009"),
     ("AD010", "A010", "B010", "2024-09-28", "S010");


/* SECTION 3 - UPDATE STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) Increase Michael Brown's Salary by 5000 */
UPDATE Staff
SET salary = salary + 5000
WHERE staff_id = 'S003';


/* 2) Update the phone number of the adopter with ID 'B003' and an address containing 'Morpeth', but only if they have made an adoption after January 1, 2024 */
UPDATE Adopters
SET phone_number = '0976543210'
WHERE adopter_id = 'B003' AND address LIKE '%Morpeth%'
  AND EXISTS (
      SELECT 1
      FROM Adoptions
      WHERE Adoptions.adopter_id = Adopters.adopter_id
      AND Adoptions.adoption_date > '2024-01-01'
  );

/* SECTION 4 - SELECT STATEMENTS - The queries must be explained in natural (English) language first, and then followed up by respective SELECTs */
/* 1) Retrieve the names of adopted animals, their corresponding adopters, the staff involved in the adoption, the adoption date, but only for animals marked as 'Adopted'. */
SELECT
     a.name AS AnimalName,
     ad.name AS AdopterName,
     s.name AS StaffName,
     adp.adoption_date
 FROM
     Animals a
 JOIN
     Adoptions adp ON a.animal_id = adp.animal_id
 JOIN
     Adopters ad ON adp.adopter_id = ad.adopter_id
 JOIN
     Staff s ON adp.staff_id = s.staff_id
 WHERE
     a.adoption_status = 'Adopted';

/* 2) What species has the most number of animals? */
 SELECT species, COUNT(*) AS number_of_animals
 FROM Animals
 GROUP BY species
 ORDER BY number_of_animals DESC
 LIMIT 1;

/* 3) Retrieve the staff members that make over 30000 */
 SELECT name, role, salary
 FROM Staff
 WHERE salary > 30000;

/* 4) List the names of adopters who live in Alnwick and adopted an animal on the 1st December 2024. */
 SELECT a.name
 FROM Adopters a
 JOIN Adoptions ad ON a.adopter_id = ad.adopter_id
 WHERE a.address LIKE '%Alnwick%'
 AND ad.adoption_date = '2024-12-01';

/* 5) Lists all adopters and orders them alphabetically by their name. */
 SELECT * FROM Adopters
 ORDER BY name ASC;

/* 6) Calculate the average age of animals grouped by species. */
 SELECT species, AVG(age) AS average_age
 FROM Animals
 GROUP BY species;

/* 7) List all dogs and cats from the Animals table. */ 
 SELECT name FROM Animals WHERE species = 'Dog'
 UNION
 SELECT name FROM Animals WHERE species = 'Cat';

/* 8) Find adopters who have adopted at least one animal. */
SELECT name
FROM Adopters
WHERE EXISTS (SELECT 1 FROM Adoptions WHERE Adoptions.adopter_id = Adopters.adopter_id);

/* SECTION 5 - DELETE ROWS - The queries must be explained in natural (English) language first, and then followed up by respective statements */

/* 1) Delete a record from the Adoptions table where the adoption_id matches 'AD001' */
DELETE FROM Adoptions WHERE adoption_id = 'AD001';

/* 2) Delete all the dogs older than 2 */
DELETE FROM Adoptions
WHERE animal_id IN (
    SELECT animal_id
    FROM Animals
    WHERE species = 'Dog' AND age > 2
);


DELETE FROM Animals
WHERE species = 'Dog' AND age > 2;

/* SECTION 6 DROP TABLES */
DROP TABLE Adoptions;
DROP TABLE Animals;
DROP TABLE Adopters;
DROP TABLE Staff;

SHOW TABLES;
