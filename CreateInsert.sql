-- Database: e-commerce

-- DROP DATABASE IF EXISTS "e-commerce";

CREATE DATABASE "e-commerce"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
	
	
	
	
-- Products TABLE	
CREATE TABLE Products
(
		ProductID INT PRIMARY KEY,
	    Name VARCHAR(50) NOT NULL,
		Price INT NOT NULL,
		Stock_Quantity INT NOT NULL,
		CategoryID INT NOT NULL 
);

-- Categories TABLE
CREATE TABLE Categories
(
		CategoryID INT PRIMARY KEY,
		CategoryName VARCHAR(25)
);


ALTER TABLE Products
ADD FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);

-- Customer TABLE
CREATE TABLE Customers
(
	CustomerID INT PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Email varchar(50)
);

-- Orders TABLE
CREATE TABLE Orders
(
	OrderID INT PRIMARY KEY,
	CustomerID INT NOT NULL,
	OrderDate DATE NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- OrderDetails TABLE
CREATE TABLE OrderDetails
(
	DetailID INT PRIMARY KEY,
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Reviews TABLE
CREATE TABLE Reviews
(
	ReviewID INT PRIMARY KEY,
	ProductID INT NOT NULL,
	CustomerID INT NOT NULL,
	Rating DECIMAL(5,2) NOT NULL,
	Comment VARCHAR(250),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)	
);

-- Shiping TABLE
CREATE TABLE Shiping
(
	ShipingID INT PRIMARY KEY,
	OrderID INT NOT NULL,
	ShipDate DATE,
	DeliveryDate DATE,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)	
);


-- Discount TABLE
CREATE TABLE Discount
(
	DiscountID INT PRIMARY KEY,
	ProductID INT NOT NULL,
	DiscountAmount DECIMAL(10,2),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Coupans TABLE
CREATE TABLE Coupan
(
	CoupanID INT PRIMARY KEY,
	DiscountAmout DECIMAL(10,2) NOT NULL
);


-- Insserting Values into tables


-- Inserting data into Categories table
INSERT INTO Categories (CategoryID, CategoryName)
VALUES 
    (1, 'Electronics'),
    (2, 'Clothing'),
    (3, 'Books'),
	(4,'Food'),
	(5,'Footwear'),
	(6,'Fitness'),
	(7,'Medical'),
	(8,'Jewelry'),
	(9,'Music Instruments'),
	(10,'Beauty & Personal Care');
	
-- Inserting data into Products table
INSERT INTO Products (ProductID, Name, Price, Stock_Quantity, CategoryID)
VALUES
    (1, 'Tablet', 500, 40, 1),
    (2, 'Jeans', 40, 80, 2),
    (3, 'Novel', 10, 150, 3),
    (4, 'Milk', 2, 300, 4),
    (5, 'Sneakers', 70, 100, 5),
    (6, 'Yoga Mat', 20, 120, 6),
    (7, 'First Aid Kit', 25, 60, 7),
    (8, 'Earrings', 50, 70, 8),
    (9, 'Keyboard', 50, 30, 1),
    (10, 'Face Cream', 15, 200, 10),
    (11, 'Orange Juice', 3, 250, 4),
    (12, 'Dress', 80, 70, 2),
    (13, 'Thriller Book', 12, 100, 3),
    (14, 'Chicken', 6, 180, 4),
    (15, 'Sandals', 30, 120, 5),
    (16, 'Jump Rope', 10, 90, 6),
    (17, 'Thermometer', 8, 50, 7),
    (18, 'Bracelet', 40, 90, 8),
    (19, 'Piano', 1000, 10, 9),
    (20, 'Lipstick', 8, 150, 10),
    (21, 'Camera', 700, 25, 1),
    (22, 'Hoodie', 50, 60, 2),
    (23, 'Cookbook', 18, 90, 3),
    (24, 'Bread', 3, 200, 4),
    (25, 'Boots', 90, 80, 5),
    (26, 'Treadmill', 1000, 15, 6),
    (27, 'Pain Relief Gel', 15, 70, 7),
    (28, 'Watch', 200, 40, 8),
    (29, 'Microphone', 150, 20, 9),
    (30, 'Hair Conditioner', 12, 150, 10),
    (31, 'Printer', 300, 30, 1),
    (32, 'Shorts', 25, 100, 2),
    (33, 'Comic Book', 5, 120, 3),
    (34, 'Eggs', 2, 250, 4),
    (35, 'High Heels', 80, 70, 5),
    (36, 'Stationary Bike', 600, 10, 6),
    (37, 'Antibacterial Ointment', 10, 80, 7),
    (38, 'Necklace Set', 120, 50, 8),
    (39, 'Violin', 400, 15, 9),
    (40, 'Facial Cleanser', 10, 180, 10),
    (41, 'Headphones', 80, 50, 1),
    (42, 'Sweater', 60, 70, 2),
    (43, 'Self-Help Book', 20, 100, 3),
    (44, 'Rice', 5, 300, 4),
    (45, 'Flats', 50, 90, 5),
    (46, 'Elliptical Machine', 800, 10, 6),
    (47, 'Allergy Medication', 10, 60, 7),
    (48, 'Ring', 80, 60, 8),
    (49, 'Drum Set', 600, 8, 9),
    (50, 'Sunscreen', 15, 120, 10),
    (51, 'Smartwatch', 250, 30, 1),
    (52, 'Jacket', 70, 50, 2),
    (53, 'Fantasy Book', 15, 80, 3),
    (54, 'Pasta', 4, 200, 4),
    (55, 'Running Shoes', 100, 80, 5),
    (56, 'Gym Bench', 150, 25, 6),
    (57, 'Cold Medicine', 8, 70, 7),
    (58, 'Charm Bracelet', 60, 40, 8),
    (59, 'Trumpet', 300, 12, 9),
    (60, 'Hand Cream', 8, 150, 10);

select * from products;

INSERT INTO Customers (CustomerID, Name, Email)
VALUES
    (1, 'John Doe', 'john.doe@example.com'),
    (2, 'Jane Smith', 'jane.smith@example.com'),	
	(3, 'Michael Johnson', 'michael.johnson@example.com'),
    (4, 'Emily Brown', 'emily.brown@example.com'),
    (5, 'Daniel Wilson', 'daniel.wilson@example.com'),
    (6, 'Sarah Taylor', 'sarah.taylor@example.com'),
    (7, 'Christopher Anderson', 'christopher.anderson@example.com'),
    (8, 'Jessica Martinez', 'jessica.martinez@example.com'),
    (9, 'David Thompson', 'david.thompson@example.com'),
    (10, 'Jennifer Thomas', 'jennifer.thomas@example.com'),
    (11, 'Andrew Garcia', 'andrew.garcia@example.com'),
    (12, 'Amanda Rodriguez', 'amanda.rodriguez@example.com'),
    (13, 'James Hernandez', 'james.hernandez@example.com'),
    (14, 'Melissa Lopez', 'melissa.lopez@example.com'),
    (15, 'Ryan Martinez', 'ryan.martinez@example.com'),
    (16, 'Jessica Cox', 'jessica.cox@example.com'),
    (17, 'Nicholas Gonzalez', 'nicholas.gonzalez@example.com'),
    (18, 'Samantha Young', 'samantha.young@example.com'),
    (19, 'Matthew Lee', 'matthew.lee@example.com'),
    (20, 'Emma Walker', 'emma.walker@example.com'),
    (21, 'Justin Perez', 'justin.perez@example.com'),
    (22, 'Nicole Turner', 'nicole.turner@example.com'),
    (23, 'Kevin Scott', 'kevin.scott@example.com'),
    (24, 'Lauren King', 'lauren.king@example.com'),
    (25, 'Brandon Wright', 'brandon.wright@example.com'),
    (26, 'Ashley Hill', 'ashley.hill@example.com'),
    (27, 'Jacob Green', 'jacob.green@example.com'),
    (28, 'Kayla Adams', 'kayla.adams@example.com'),
    (29, 'Tyler Baker', 'tyler.baker@example.com'),
    (30, 'Olivia Hall', 'olivia.hall@example.com'),
    (31, 'Christopher Young', 'christopher.young@example.com'),
    (32, 'Rachel Cox', 'rachel.cox@example.com'),
    (33, 'Joshua Lewis', 'joshua.lewis@example.com'),
    (34, 'Stephanie Allen', 'stephanie.allen@example.com'),
    (35, 'David Nelson', 'david.nelson@example.com'),
    (36, 'Rebecca Carter', 'rebecca.carter@example.com'),
    (37, 'Jonathan Mitchell', 'jonathan.mitchell@example.com'),
    (38, 'Emily Adams', 'emily.adams@example.com'),
    (39, 'Alexis Roberts', 'alexis.roberts@example.com'),
    (40, 'Daniel Turner', 'daniel.turner@example.com'),
    (41, 'Madison Phillips', 'madison.phillips@example.com'),
    (42, 'Austin Evans', 'austin.evans@example.com'),
    (43, 'Taylor Parker', 'taylor.parker@example.com'),
    (44, 'Hannah Morris', 'hannah.morris@example.com'),
    (45, 'Joseph Campbell', 'joseph.campbell@example.com'),
    (46, 'Megan Richardson', 'megan.richardson@example.com'),
    (47, 'William Flores', 'william.flores@example.com'),
    (48, 'Katherine Cooper', 'katherine.cooper@example.com'),
    (49, 'Ethan Morgan', 'ethan.morgan@example.com'),
    (50, 'Victoria Bailey', 'victoria.bailey@example.com'),
    (51, 'Dylan Howard', 'dylan.howard@example.com'),
    (52, 'Grace Cox', 'grace.cox@example.com'),
    (53, 'Nathan Reed', 'nathan.reed@example.com'),
    (54, 'Emma Richardson', 'emma.richardson@example.com'),
    (55, 'James Hayes', 'james.hayes@example.com'),
    (56, 'Isabella Wood', 'isabella.wood@example.com'),
    (57, 'Andrew Ross', 'andrew.ross@example.com'),
    (58, 'Sophia Mitchell', 'sophia.mitchell@example.com'),
    (59, 'Jacob Coleman', 'jacob.coleman@example.com'),
    (60, 'Madison Stewart', 'madison.stewart@example.com'),
    (61, 'Logan Rivera', 'logan.rivera@example.com'),
    (62, 'Alyssa Ward', 'alyssa.ward@example.com'),
    (63, 'Christopher Cox', 'christopher.cox@example.com'),
    (64, 'Ava Gray', 'ava.gray@example.com'),
    (65, 'Jack Simmons', 'jack.simmons@example.com'),
    (66, 'Hailey Foster', 'hailey.foster@example.com'),
    (67, 'Caleb Murphy', 'caleb.murphy@example.com'),
    (68, 'Chloe Washington', 'chloe.washington@example.com'),
    (69, 'Elijah Long', 'elijah.long@example.com'),
    (70, 'Mia Foster', 'mia.foster@example.com'),
    (71, 'Benjamin Barnes', 'benjamin.barnes@example.com'),
    (72, 'Emma Hughes', 'emma.hughes@example.com'),
    (73, 'Jackson Jenkins', 'jackson.jenkins@example.com'),
    (74, 'Lily Rodriguez', 'lily.rodriguez@example.com'),
    (75, 'Luke Patterson', 'luke.patterson@example.com'),
    (76, 'Layla Nelson', 'layla.nelson@example.com'),
    (77, 'Gabriel Powell', 'gabriel.powell@example.com'),
    (78, 'Avery Diaz', 'avery.diaz@example.com'),
    (79, 'Olivia Parker', 'olivia.parker@example.com'),
    (80, 'Carter Price', 'carter.price@example.com'),
    (81, 'Sophia Watson', 'sophia.watson@example.com'),
    (82, 'Matthew Long', 'matthew.long@example.com'),
    (83, 'Aria Bell', 'aria.bell@example.com'),
    (84, 'Ethan Martinez', 'ethan.martinez@example.com'),
    (85, 'Harper Peterson', 'harper.peterson@example.com'),
    (86, 'Daniel Sanders', 'daniel.sanders@example.com'),
    (87, 'Aubrey Ward', 'aubrey.ward@example.com'),
    (88, 'Christopher Brooks', 'christopher.brooks@example.com'),
    (89, 'Addison Ramirez', 'addison.ramirez@example.com'),
    (90, 'Noah Bailey', 'noah.bailey@example.com'),
    (91, 'Ella White', 'ella.white@example.com'),
    (92, 'Wyatt Alexander', 'wyatt.alexander@example.com'),
    (93, 'Victoria Bell', 'victoria.bell@example.com'),
    (94, 'Julian Foster', 'julian.foster@example.com'),
    (95, 'Grace Henderson', 'grace.henderson@example.com'),
    (96, 'Michael Gray', 'michael.gray@example.com'),
    (97, 'Scarlett Barnes', 'scarlett.barnes@example.com'),
    (98, 'Alexander Ward', 'alexander.ward@example.com'),
    (99, 'Sophie Perry', 'sophie.perry@example.com'),
    (100, 'Connor Russell', 'connor.russell@example.com'),
    (101, 'Katherine Martinez', 'katherine.martinez@example.com'),
    (102, 'John Coleman', 'john.coleman@example.com'),
    (103, 'Madeline Powell', 'madeline.powell@example.com'),
    (104, 'David Simmons', 'david.simmons@example.com'),
    (105, 'Abigail Wright', 'abigail.wright@example.com'),
    (106, 'Ryan Thomas', 'ryan.thomas@example.com'),
    (107, 'Evelyn Allen', 'evelyn.allen@example.com'),
    (108, 'Henry Evans', 'henry.evans@example.com'),
    (109, 'Zoe Adams', 'zoe.adams@example.com'),
    (110, 'Luke Brown', 'luke.brown@example.com'),
    (111, 'Scarlett Phillips', 'scarlett.phillips@example.com'),
    (112, 'Owen Mitchell', 'owen.mitchell@example.com'),
    (113, 'Liam Wright', 'liam.wright@example.com'),
    (114, 'Natalie Martinez', 'natalie.martinez@example.com'),
    (115, 'Elena White', 'elena.white@example.com'),
    (116, 'Lucas Lewis', 'lucas.lewis@example.com'),
    (117, 'Elizabeth Johnson', 'elizabeth.johnson@example.com'),
    (118, 'Alexander Moore', 'alexander.moore@example.com'),
    (119, 'Sofia Rodriguez', 'sofia.rodriguez@example.com'),
    (120, 'Gabriel Hill', 'gabriel.hill@example.com'),
    (121, 'Avery Murphy', 'avery.murphy@example.com'),
    (122, 'Anna Bell', 'anna.bell@example.com'),
    (123, 'William Young', 'william.young@example.com'),
    (124, 'Amelia Ross', 'amelia.ross@example.com'),
    (125, 'Henry Campbell', 'henry.campbell@example.com'),
    (126, 'Mila Morris', 'mila.morris@example.com'),
    (127, 'Eli Martinez', 'eli.martinez@example.com'),
    (128, 'Aria Butler', 'aria.butler@example.com'),
    (129, 'Mason James', 'mason.james@example.com'),
    (130, 'Harper Richardson', 'harper.richardson@example.com'),
    (131, 'Caleb Diaz', 'caleb.diaz@example.com'),
    (132, 'Luna Adams', 'luna.adams@example.com'),
    (133, 'Oliver Peterson', 'oliver.peterson@example.com'),
    (134, 'Layla Gonzalez', 'layla.gonzalez@example.com'),
    (135, 'Logan Russell', 'logan.russell@example.com'),
    (136, 'Grace Ramirez', 'grace.ramirez@example.com'),
    (137, 'Jackson Morgan', 'jackson.morgan@example.com'),
    (138, 'Aurora Flores', 'aurora.flores@example.com'),
    (139, 'Ethan Turner', 'ethan.turner@example.com'),
    (140, 'Amelia King', 'amelia.king@example.com'),
    (141, 'Lucas Clark', 'lucas.clark@example.com'),
    (142, 'Chloe Brown', 'chloe.brown@example.com'),
    (143, 'Daniel Parker', 'daniel.parker@example.com'),
    (144, 'Sophie Cooper', 'sophie.cooper@example.com'),
    (145, 'Michael Garcia', 'michael.garcia@example.com'),
    (146, 'Ava Edwards', 'ava.edwards@example.com'),
    (147, 'Evan White', 'evan.white@example.com'),
    (148, 'Ella Jenkins', 'ella.jenkins@example.com'),
    (149, 'Liam Hall', 'liam.hall@example.com'),
    (150, 'Sophia Gonzalez', 'sophia.gonzalez@example.com');
	
select * from customers;

insert into Orders (OrderID, CustomerID, OrderDate) values (1, 79, '2023/05/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (2, 139, '2023/04/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (3, 44, '2023/07/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (4, 58, '2023/06/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (5, 43, '2023/09/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (6, 99, '2023/05/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (7, 139, '2023/03/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (8, 132, '2023/12/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (9, 111, '2023/06/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (10, 90, '2023/11/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (11, 31, '2023/08/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (12, 118, '2023/10/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (13, 117, '2023/08/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (14, 77, '2023/07/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (15, 20, '2023/07/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (16, 44, '2023/09/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (17, 67, '2023/10/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (18, 20, '2023/12/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (19, 18, '2023/11/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (20, 90, '2023/07/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (21, 13, '2023/03/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (22, 21, '2023/08/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (23, 90, '2023/02/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (24, 104, '2023/10/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (25, 91, '2023/06/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (26, 121, '2023/11/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (27, 46, '2023/11/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (28, 22, '2023/04/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (29, 80, '2023/12/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (30, 132, '2023/12/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (31, 101, '2023/10/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (32, 136, '2023/06/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (33, 120, '2023/05/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (34, 91, '2023/11/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (35, 78, '2023/11/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (36, 143, '2023/03/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (37, 137, '2023/06/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (38, 124, '2024/01/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (39, 39, '2023/09/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (40, 33, '2023/07/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (41, 141, '2023/04/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (42, 34, '2023/09/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (43, 48, '2023/04/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (44, 49, '2024/01/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (45, 147, '2023/02/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (46, 3, '2023/04/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (47, 14, '2023/10/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (48, 99, '2023/07/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (49, 68, '2023/10/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (50, 134, '2023/04/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (51, 146, '2023/09/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (52, 45, '2023/04/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (53, 119, '2023/03/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (54, 56, '2023/04/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (55, 17, '2023/04/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (56, 125, '2024/01/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (57, 45, '2023/10/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (58, 122, '2024/01/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (59, 72, '2023/05/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (60, 117, '2023/12/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (61, 80, '2023/09/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (62, 121, '2024/01/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (63, 107, '2023/12/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (64, 61, '2024/01/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (65, 138, '2023/07/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (66, 126, '2023/10/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (67, 73, '2023/11/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (68, 21, '2023/07/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (69, 4, '2023/07/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (70, 124, '2023/07/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (71, 1, '2023/06/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (72, 65, '2024/01/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (73, 96, '2023/10/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (74, 142, '2023/07/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (75, 142, '2023/06/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (76, 65, '2023/02/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (77, 122, '2023/03/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (78, 71, '2023/09/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (79, 148, '2023/08/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (80, 13, '2023/02/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (81, 28, '2023/09/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (82, 96, '2024/01/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (83, 58, '2023/04/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (84, 8, '2023/12/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (85, 139, '2023/11/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (86, 134, '2023/05/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (87, 88, '2023/03/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (88, 78, '2023/10/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (89, 140, '2023/08/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (90, 51, '2023/12/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (91, 72, '2023/02/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (92, 123, '2023/06/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (93, 141, '2023/07/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (94, 16, '2023/09/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (95, 46, '2024/01/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (96, 121, '2023/12/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (97, 73, '2023/08/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (98, 104, '2023/11/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (99, 23, '2023/07/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (100, 91, '2023/11/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (101, 5, '2023/04/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (102, 53, '2023/11/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (103, 35, '2023/09/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (104, 110, '2023/10/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (105, 100, '2023/08/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (106, 5, '2023/10/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (107, 109, '2023/07/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (108, 124, '2024/01/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (109, 23, '2023/05/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (110, 101, '2023/05/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (111, 22, '2024/01/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (112, 13, '2023/05/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (113, 77, '2024/01/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (114, 77, '2023/03/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (115, 143, '2023/09/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (116, 65, '2024/01/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (117, 23, '2023/04/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (118, 20, '2023/11/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (119, 48, '2023/10/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (120, 97, '2023/10/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (121, 53, '2023/08/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (122, 105, '2023/12/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (123, 93, '2023/05/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (124, 4, '2023/08/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (125, 99, '2023/03/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (126, 121, '2024/01/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (127, 30, '2023/02/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (128, 6, '2023/10/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (129, 70, '2023/08/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (130, 98, '2023/11/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (131, 27, '2023/11/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (132, 11, '2023/12/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (133, 83, '2023/06/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (134, 53, '2023/08/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (135, 112, '2023/10/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (136, 36, '2023/11/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (137, 91, '2024/01/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (138, 32, '2023/02/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (139, 15, '2023/06/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (140, 66, '2023/05/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (141, 140, '2024/01/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (142, 75, '2023/08/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (143, 45, '2023/05/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (144, 30, '2023/10/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (145, 26, '2023/04/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (146, 27, '2023/02/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (147, 75, '2023/05/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (148, 42, '2023/11/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (149, 4, '2023/10/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (150, 105, '2023/10/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (151, 68, '2024/01/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (152, 16, '2023/05/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (153, 71, '2023/08/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (154, 4, '2023/03/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (155, 84, '2023/08/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (156, 149, '2024/01/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (157, 7, '2023/02/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (158, 127, '2023/09/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (159, 66, '2023/10/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (160, 74, '2023/10/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (161, 130, '2023/06/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (162, 58, '2023/12/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (163, 36, '2023/08/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (164, 28, '2023/11/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (165, 31, '2023/07/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (166, 109, '2023/09/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (167, 34, '2023/11/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (168, 79, '2023/07/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (169, 139, '2023/10/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (170, 71, '2023/02/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (171, 52, '2023/11/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (172, 146, '2023/12/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (173, 51, '2023/04/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (174, 38, '2023/02/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (175, 109, '2023/04/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (176, 12, '2023/02/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (177, 82, '2023/07/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (178, 97, '2023/07/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (179, 2, '2024/01/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (180, 5, '2023/08/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (181, 136, '2023/09/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (182, 35, '2023/12/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (183, 114, '2023/10/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (184, 50, '2023/12/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (185, 149, '2023/12/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (186, 37, '2023/12/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (187, 52, '2023/07/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (188, 132, '2023/08/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (189, 111, '2023/09/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (190, 36, '2023/08/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (191, 78, '2023/04/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (192, 70, '2023/10/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (193, 118, '2023/05/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (194, 145, '2023/03/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (195, 78, '2023/06/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (196, 91, '2023/03/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (197, 35, '2023/05/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (198, 141, '2023/03/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (199, 10, '2024/01/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (200, 20, '2023/11/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (201, 76, '2023/11/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (202, 146, '2023/08/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (203, 16, '2023/06/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (204, 89, '2023/09/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (205, 37, '2023/12/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (206, 23, '2024/01/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (207, 48, '2023/03/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (208, 61, '2023/08/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (209, 71, '2023/07/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (210, 110, '2023/04/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (211, 30, '2023/06/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (212, 5, '2023/12/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (213, 14, '2023/11/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (214, 69, '2023/05/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (215, 29, '2023/07/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (216, 71, '2023/10/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (217, 25, '2023/07/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (218, 80, '2023/03/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (219, 77, '2023/05/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (220, 142, '2023/07/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (221, 23, '2023/03/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (222, 125, '2023/03/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (223, 114, '2023/09/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (224, 73, '2023/11/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (225, 103, '2023/08/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (226, 150, '2023/06/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (227, 44, '2023/10/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (228, 39, '2024/01/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (229, 53, '2023/03/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (230, 146, '2023/10/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (231, 98, '2023/11/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (232, 131, '2023/10/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (233, 53, '2023/05/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (234, 15, '2023/07/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (235, 57, '2024/01/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (236, 58, '2023/05/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (237, 31, '2023/09/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (238, 3, '2023/05/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (239, 51, '2023/08/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (240, 37, '2023/12/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (241, 10, '2023/07/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (242, 98, '2023/12/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (243, 38, '2023/11/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (244, 36, '2023/11/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (245, 95, '2023/06/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (246, 40, '2023/05/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (247, 123, '2023/09/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (248, 68, '2023/04/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (249, 101, '2023/07/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (250, 77, '2024/01/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (251, 124, '2023/03/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (252, 10, '2023/05/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (253, 17, '2023/07/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (254, 97, '2023/10/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (255, 110, '2024/01/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (256, 42, '2023/09/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (257, 9, '2023/10/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (258, 116, '2023/08/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (259, 8, '2023/10/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (260, 68, '2023/04/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (261, 35, '2023/02/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (262, 7, '2023/02/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (263, 78, '2023/06/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (264, 123, '2023/07/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (265, 53, '2023/07/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (266, 11, '2023/04/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (267, 14, '2023/05/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (268, 67, '2023/07/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (269, 8, '2023/09/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (270, 106, '2023/05/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (271, 36, '2023/08/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (272, 129, '2023/11/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (273, 105, '2023/11/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (274, 3, '2024/01/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (275, 112, '2023/11/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (276, 123, '2023/06/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (277, 127, '2023/04/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (278, 38, '2023/07/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (279, 89, '2023/08/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (280, 106, '2023/12/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (281, 99, '2023/12/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (282, 38, '2023/03/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (283, 110, '2023/05/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (284, 119, '2023/03/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (285, 110, '2023/08/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (286, 118, '2023/07/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (287, 123, '2024/01/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (288, 107, '2023/06/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (289, 121, '2023/09/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (290, 128, '2023/12/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (291, 58, '2023/08/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (292, 73, '2023/04/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (293, 35, '2023/06/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (294, 69, '2023/11/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (295, 99, '2024/01/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (296, 18, '2023/12/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (297, 137, '2023/10/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (298, 108, '2023/02/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (299, 116, '2023/04/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (300, 64, '2023/06/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (301, 72, '2023/11/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (302, 85, '2024/01/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (303, 112, '2023/10/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (304, 116, '2023/10/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (305, 136, '2023/10/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (306, 5, '2023/09/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (307, 109, '2023/10/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (308, 103, '2023/03/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (309, 149, '2023/04/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (310, 137, '2023/03/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (311, 101, '2023/02/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (312, 124, '2023/10/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (313, 69, '2023/04/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (314, 126, '2024/01/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (315, 11, '2023/11/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (316, 101, '2023/08/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (317, 70, '2023/05/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (318, 147, '2023/02/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (319, 105, '2023/03/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (320, 144, '2023/05/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (321, 96, '2023/10/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (322, 66, '2023/05/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (323, 22, '2023/05/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (324, 26, '2023/08/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (325, 36, '2023/10/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (326, 131, '2023/04/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (327, 43, '2023/02/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (328, 69, '2023/11/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (329, 43, '2023/04/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (330, 120, '2023/06/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (331, 2, '2023/06/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (332, 84, '2023/02/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (333, 64, '2024/01/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (334, 18, '2023/06/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (335, 65, '2023/06/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (336, 116, '2023/10/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (337, 8, '2023/06/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (338, 82, '2023/08/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (339, 62, '2023/11/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (340, 59, '2023/07/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (341, 48, '2023/11/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (342, 93, '2023/03/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (343, 79, '2023/05/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (344, 81, '2023/07/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (345, 69, '2023/11/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (346, 138, '2023/08/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (347, 80, '2023/11/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (348, 125, '2023/06/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (349, 92, '2023/07/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (350, 2, '2023/11/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (351, 38, '2023/05/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (352, 141, '2023/09/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (353, 23, '2023/08/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (354, 79, '2024/01/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (355, 59, '2024/01/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (356, 118, '2023/05/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (357, 99, '2023/12/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (358, 15, '2023/12/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (359, 49, '2023/04/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (360, 14, '2023/12/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (361, 147, '2023/08/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (362, 5, '2023/03/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (363, 85, '2023/07/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (364, 79, '2023/10/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (365, 110, '2023/02/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (366, 38, '2023/05/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (367, 149, '2023/09/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (368, 121, '2023/06/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (369, 90, '2023/08/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (370, 29, '2023/05/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (371, 18, '2023/03/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (372, 115, '2023/08/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (373, 61, '2023/02/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (374, 17, '2023/07/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (375, 6, '2023/05/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (376, 35, '2024/01/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (377, 124, '2023/10/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (378, 19, '2023/08/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (379, 106, '2023/06/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (380, 129, '2023/09/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (381, 121, '2023/05/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (382, 40, '2023/06/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (383, 139, '2023/04/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (384, 69, '2023/03/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (385, 74, '2023/05/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (386, 28, '2023/06/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (387, 51, '2023/08/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (388, 103, '2023/03/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (389, 93, '2023/09/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (390, 112, '2023/07/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (391, 92, '2023/05/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (392, 87, '2023/04/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (393, 64, '2023/12/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (394, 57, '2023/10/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (395, 103, '2023/05/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (396, 120, '2023/11/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (397, 54, '2023/09/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (398, 89, '2023/05/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (399, 133, '2023/04/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (400, 130, '2023/04/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (401, 26, '2023/10/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (402, 74, '2023/10/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (403, 143, '2023/04/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (404, 23, '2024/01/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (405, 64, '2023/07/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (406, 133, '2023/10/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (407, 68, '2023/10/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (408, 106, '2023/08/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (409, 136, '2023/12/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (410, 50, '2023/09/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (411, 58, '2023/06/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (412, 58, '2023/02/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (413, 94, '2023/04/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (414, 22, '2023/11/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (415, 54, '2023/09/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (416, 35, '2023/07/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (417, 37, '2023/12/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (418, 4, '2023/12/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (419, 85, '2023/08/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (420, 85, '2023/10/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (421, 145, '2023/12/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (422, 87, '2024/01/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (423, 5, '2023/08/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (424, 70, '2023/06/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (425, 148, '2023/08/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (426, 45, '2023/05/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (427, 126, '2023/03/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (428, 39, '2023/11/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (429, 39, '2023/06/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (430, 112, '2023/11/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (431, 141, '2023/12/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (432, 12, '2023/10/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (433, 52, '2023/06/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (434, 42, '2023/08/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (435, 143, '2024/01/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (436, 134, '2024/01/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (437, 20, '2023/06/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (438, 102, '2023/12/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (439, 144, '2023/06/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (440, 117, '2023/06/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (441, 137, '2023/08/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (442, 50, '2023/09/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (443, 23, '2023/06/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (444, 35, '2023/11/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (445, 2, '2023/05/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (446, 70, '2023/05/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (447, 150, '2023/04/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (448, 36, '2023/03/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (449, 136, '2023/09/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (450, 122, '2023/11/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (451, 64, '2023/11/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (452, 74, '2023/05/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (453, 25, '2023/11/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (454, 84, '2023/10/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (455, 100, '2023/07/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (456, 26, '2023/05/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (457, 1, '2023/04/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (458, 64, '2023/02/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (459, 119, '2024/01/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (460, 58, '2024/01/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (461, 129, '2023/11/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (462, 94, '2023/04/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (463, 95, '2023/09/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (464, 106, '2023/12/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (465, 52, '2023/05/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (466, 80, '2023/04/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (467, 16, '2023/12/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (468, 45, '2023/09/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (469, 131, '2023/06/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (470, 92, '2023/10/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (471, 60, '2023/06/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (472, 138, '2023/10/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (473, 84, '2024/01/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (474, 148, '2023/08/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (475, 20, '2023/02/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (476, 96, '2024/01/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (477, 6, '2023/10/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (478, 7, '2023/11/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (479, 27, '2023/04/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (480, 138, '2023/08/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (481, 14, '2023/11/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (482, 43, '2023/11/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (483, 65, '2023/11/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (484, 133, '2023/11/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (485, 89, '2023/06/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (486, 40, '2023/12/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (487, 128, '2023/07/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (488, 121, '2023/12/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (489, 89, '2023/04/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (490, 70, '2023/04/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (491, 112, '2023/09/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (492, 75, '2023/02/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (493, 24, '2023/07/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (494, 3, '2023/08/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (495, 96, '2023/10/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (496, 21, '2023/06/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (497, 56, '2023/11/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (498, 123, '2023/02/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (499, 96, '2023/05/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (500, 11, '2023/03/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (501, 115, '2023/03/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (502, 45, '2023/02/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (503, 148, '2023/11/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (504, 149, '2023/04/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (505, 79, '2023/07/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (506, 29, '2023/05/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (507, 32, '2024/01/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (508, 121, '2023/03/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (509, 109, '2023/09/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (510, 103, '2023/04/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (511, 39, '2023/04/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (512, 5, '2023/04/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (513, 20, '2023/09/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (514, 16, '2023/08/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (515, 90, '2023/11/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (516, 71, '2023/12/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (517, 2, '2024/01/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (518, 92, '2023/11/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (519, 46, '2023/11/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (520, 53, '2023/03/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (521, 70, '2023/06/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (522, 128, '2023/06/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (523, 78, '2023/06/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (524, 62, '2023/12/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (525, 39, '2023/06/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (526, 116, '2024/01/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (527, 18, '2023/05/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (528, 2, '2023/10/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (529, 150, '2023/03/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (530, 20, '2023/03/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (531, 100, '2023/11/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (532, 102, '2023/04/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (533, 52, '2023/04/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (534, 127, '2024/01/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (535, 11, '2024/01/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (536, 84, '2023/07/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (537, 147, '2023/03/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (538, 137, '2023/08/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (539, 104, '2023/05/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (540, 91, '2023/08/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (541, 13, '2024/01/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (542, 57, '2023/10/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (543, 18, '2023/12/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (544, 68, '2023/06/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (545, 113, '2023/12/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (546, 132, '2023/03/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (547, 142, '2023/04/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (548, 101, '2023/11/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (549, 116, '2023/02/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (550, 5, '2023/10/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (551, 19, '2023/09/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (552, 27, '2023/03/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (553, 134, '2023/12/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (554, 94, '2023/05/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (555, 10, '2024/01/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (556, 15, '2024/01/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (557, 59, '2023/06/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (558, 145, '2023/03/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (559, 117, '2023/04/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (560, 131, '2023/12/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (561, 105, '2023/08/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (562, 122, '2023/06/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (563, 27, '2023/12/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (564, 66, '2023/03/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (565, 136, '2023/09/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (566, 38, '2023/05/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (567, 125, '2023/09/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (568, 42, '2023/10/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (569, 78, '2023/03/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (570, 99, '2023/10/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (571, 22, '2023/09/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (572, 142, '2023/04/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (573, 39, '2023/02/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (574, 57, '2024/01/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (575, 91, '2023/02/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (576, 76, '2023/08/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (577, 116, '2023/11/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (578, 126, '2023/12/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (579, 78, '2023/10/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (580, 55, '2023/05/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (581, 3, '2023/08/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (582, 58, '2023/06/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (583, 5, '2023/04/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (584, 7, '2023/08/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (585, 136, '2023/07/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (586, 38, '2024/01/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (587, 24, '2023/10/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (588, 85, '2023/03/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (589, 66, '2023/04/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (590, 71, '2023/12/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (591, 139, '2023/08/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (592, 84, '2024/01/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (593, 30, '2023/11/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (594, 51, '2023/07/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (595, 24, '2023/03/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (596, 66, '2023/09/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (597, 19, '2024/01/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (598, 74, '2023/11/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (599, 38, '2023/10/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (600, 88, '2023/11/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (601, 18, '2023/03/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (602, 149, '2023/09/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (603, 101, '2023/02/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (604, 47, '2023/12/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (605, 93, '2023/09/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (606, 114, '2023/03/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (607, 31, '2023/08/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (608, 147, '2023/06/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (609, 48, '2024/01/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (610, 37, '2023/12/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (611, 55, '2023/12/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (612, 114, '2023/05/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (613, 97, '2023/04/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (614, 88, '2023/10/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (615, 28, '2023/05/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (616, 15, '2023/11/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (617, 116, '2024/01/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (618, 105, '2023/03/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (619, 118, '2023/05/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (620, 18, '2023/11/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (621, 57, '2023/11/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (622, 26, '2024/01/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (623, 51, '2023/12/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (624, 146, '2023/05/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (625, 105, '2023/11/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (626, 69, '2023/11/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (627, 143, '2023/09/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (628, 105, '2023/10/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (629, 114, '2023/12/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (630, 68, '2023/07/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (631, 22, '2023/03/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (632, 32, '2023/03/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (633, 65, '2023/10/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (634, 109, '2024/01/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (635, 33, '2023/07/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (636, 44, '2023/10/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (637, 31, '2023/07/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (638, 129, '2023/08/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (639, 48, '2023/04/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (640, 19, '2023/03/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (641, 58, '2023/09/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (642, 14, '2023/06/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (643, 4, '2023/05/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (644, 109, '2023/09/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (645, 25, '2023/08/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (646, 75, '2023/06/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (647, 21, '2024/01/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (648, 73, '2023/05/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (649, 4, '2023/04/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (650, 134, '2023/08/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (651, 108, '2023/05/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (652, 147, '2023/05/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (653, 142, '2023/07/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (654, 135, '2023/11/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (655, 9, '2023/04/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (656, 136, '2023/09/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (657, 15, '2023/07/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (658, 124, '2024/01/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (659, 130, '2023/04/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (660, 45, '2023/12/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (661, 86, '2023/04/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (662, 143, '2023/07/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (663, 140, '2023/04/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (664, 57, '2023/08/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (665, 25, '2023/11/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (666, 132, '2023/04/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (667, 15, '2023/06/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (668, 105, '2023/09/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (669, 72, '2023/07/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (670, 132, '2023/03/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (671, 121, '2024/01/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (672, 90, '2023/04/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (673, 43, '2023/06/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (674, 79, '2023/04/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (675, 132, '2023/07/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (676, 7, '2023/11/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (677, 8, '2023/05/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (678, 58, '2023/02/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (679, 126, '2023/08/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (680, 29, '2023/11/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (681, 110, '2023/04/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (682, 78, '2023/09/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (683, 143, '2023/09/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (684, 134, '2023/06/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (685, 5, '2023/07/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (686, 108, '2023/07/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (687, 47, '2023/06/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (688, 86, '2023/11/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (689, 146, '2024/01/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (690, 132, '2023/12/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (691, 30, '2023/10/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (692, 116, '2023/06/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (693, 148, '2023/03/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (694, 21, '2023/09/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (695, 46, '2023/04/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (696, 115, '2023/06/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (697, 57, '2024/01/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (698, 56, '2023/11/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (699, 128, '2023/09/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (700, 105, '2023/09/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (701, 23, '2023/08/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (702, 80, '2023/09/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (703, 115, '2023/12/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (704, 82, '2024/01/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (705, 122, '2023/06/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (706, 88, '2023/03/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (707, 132, '2023/09/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (708, 13, '2023/06/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (709, 24, '2024/01/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (710, 102, '2023/11/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (711, 44, '2023/07/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (712, 14, '2023/12/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (713, 129, '2023/02/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (714, 49, '2023/10/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (715, 82, '2023/07/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (716, 87, '2024/01/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (717, 22, '2023/07/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (718, 21, '2023/10/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (719, 99, '2023/04/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (720, 23, '2023/10/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (721, 122, '2023/08/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (722, 111, '2023/09/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (723, 70, '2023/08/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (724, 94, '2023/07/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (725, 22, '2024/01/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (726, 90, '2024/01/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (727, 34, '2023/07/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (728, 38, '2023/04/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (729, 74, '2023/11/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (730, 90, '2023/12/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (731, 10, '2023/07/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (732, 24, '2023/09/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (733, 81, '2023/08/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (734, 82, '2023/11/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (735, 111, '2023/09/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (736, 88, '2024/01/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (737, 139, '2023/03/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (738, 9, '2023/02/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (739, 115, '2023/04/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (740, 53, '2024/01/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (741, 114, '2023/11/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (742, 48, '2024/01/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (743, 8, '2023/05/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (744, 96, '2023/02/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (745, 75, '2023/03/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (746, 76, '2024/01/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (747, 3, '2023/12/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (748, 105, '2023/05/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (749, 43, '2023/07/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (750, 79, '2023/04/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (751, 128, '2023/10/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (752, 69, '2023/04/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (753, 71, '2023/04/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (754, 54, '2023/08/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (755, 70, '2023/03/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (756, 140, '2023/07/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (757, 104, '2023/09/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (758, 41, '2023/05/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (759, 136, '2023/03/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (760, 74, '2023/11/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (761, 65, '2023/12/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (762, 33, '2023/11/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (763, 61, '2023/03/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (764, 61, '2023/11/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (765, 115, '2023/10/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (766, 77, '2023/11/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (767, 12, '2023/10/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (768, 104, '2024/01/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (769, 123, '2023/03/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (770, 86, '2024/01/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (771, 116, '2023/07/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (772, 81, '2023/03/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (773, 31, '2023/09/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (774, 37, '2023/12/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (775, 143, '2024/01/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (776, 91, '2023/04/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (777, 3, '2024/01/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (778, 59, '2023/05/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (779, 80, '2023/03/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (780, 39, '2023/10/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (781, 70, '2023/03/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (782, 146, '2024/01/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (783, 2, '2023/08/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (784, 116, '2023/03/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (785, 72, '2023/12/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (786, 130, '2023/07/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (787, 25, '2023/06/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (788, 1, '2023/11/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (789, 143, '2023/04/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (790, 30, '2023/12/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (791, 10, '2023/07/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (792, 103, '2023/08/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (793, 108, '2024/01/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (794, 41, '2023/12/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (795, 43, '2023/05/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (796, 43, '2023/12/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (797, 19, '2023/10/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (798, 36, '2023/09/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (799, 90, '2024/01/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (800, 6, '2023/06/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (801, 119, '2023/12/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (802, 74, '2023/04/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (803, 90, '2023/05/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (804, 28, '2023/08/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (805, 32, '2023/05/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (806, 36, '2023/09/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (807, 33, '2023/12/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (808, 121, '2023/03/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (809, 21, '2023/09/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (810, 19, '2023/03/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (811, 109, '2023/02/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (812, 142, '2023/04/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (813, 75, '2023/10/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (814, 140, '2023/03/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (815, 74, '2024/01/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (816, 50, '2023/08/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (817, 85, '2024/01/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (818, 41, '2023/05/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (819, 41, '2023/04/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (820, 2, '2023/04/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (821, 131, '2023/05/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (822, 18, '2023/06/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (823, 60, '2024/01/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (824, 81, '2023/12/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (825, 87, '2023/03/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (826, 96, '2023/02/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (827, 88, '2024/01/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (828, 102, '2023/07/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (829, 133, '2023/11/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (830, 34, '2023/05/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (831, 54, '2023/02/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (832, 26, '2024/01/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (833, 91, '2023/03/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (834, 75, '2023/02/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (835, 26, '2023/07/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (836, 133, '2023/06/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (837, 139, '2023/03/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (838, 96, '2024/01/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (839, 111, '2023/11/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (840, 108, '2023/05/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (841, 81, '2023/11/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (842, 139, '2024/01/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (843, 66, '2023/05/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (844, 43, '2024/01/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (845, 57, '2023/08/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (846, 145, '2023/05/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (847, 109, '2023/11/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (848, 100, '2023/08/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (849, 60, '2023/09/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (850, 19, '2023/04/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (851, 111, '2023/11/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (852, 108, '2023/11/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (853, 88, '2023/04/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (854, 124, '2023/08/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (855, 115, '2023/11/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (856, 108, '2023/08/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (857, 24, '2023/12/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (858, 62, '2023/07/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (859, 14, '2023/10/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (860, 67, '2023/10/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (861, 91, '2023/10/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (862, 138, '2023/12/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (863, 9, '2023/05/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (864, 36, '2023/10/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (865, 131, '2023/07/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (866, 90, '2023/09/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (867, 144, '2023/05/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (868, 29, '2023/12/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (869, 133, '2023/11/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (870, 68, '2024/01/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (871, 87, '2023/05/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (872, 92, '2023/10/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (873, 76, '2023/10/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (874, 135, '2023/11/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (875, 93, '2023/10/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (876, 73, '2023/06/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (877, 56, '2023/04/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (878, 44, '2023/07/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (879, 2, '2023/04/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (880, 120, '2023/04/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (881, 9, '2023/06/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (882, 76, '2023/09/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (883, 13, '2024/01/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (884, 92, '2023/05/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (885, 70, '2023/07/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (886, 54, '2023/07/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (887, 84, '2024/01/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (888, 132, '2023/11/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (889, 28, '2023/02/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (890, 138, '2023/09/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (891, 64, '2023/05/31');
insert into Orders (OrderID, CustomerID, OrderDate) values (892, 109, '2023/11/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (893, 85, '2023/10/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (894, 48, '2024/01/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (895, 37, '2023/07/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (896, 42, '2024/01/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (897, 42, '2023/04/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (898, 29, '2023/07/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (899, 30, '2023/11/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (900, 136, '2023/08/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (901, 6, '2024/01/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (902, 111, '2023/11/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (903, 41, '2023/05/02');
insert into Orders (OrderID, CustomerID, OrderDate) values (904, 64, '2023/05/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (905, 52, '2024/01/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (906, 91, '2023/03/07');
insert into Orders (OrderID, CustomerID, OrderDate) values (907, 150, '2023/08/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (908, 71, '2023/05/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (909, 15, '2023/03/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (910, 60, '2023/04/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (911, 4, '2023/10/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (912, 33, '2023/12/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (913, 150, '2023/06/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (914, 97, '2024/01/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (915, 9, '2023/06/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (916, 77, '2023/07/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (917, 42, '2023/05/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (918, 50, '2023/12/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (919, 14, '2023/10/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (920, 103, '2023/04/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (921, 2, '2023/06/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (922, 134, '2023/05/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (923, 103, '2023/12/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (924, 127, '2023/11/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (925, 24, '2024/01/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (926, 93, '2023/03/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (927, 54, '2023/08/21');
insert into Orders (OrderID, CustomerID, OrderDate) values (928, 112, '2023/08/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (929, 142, '2023/03/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (930, 142, '2023/06/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (931, 150, '2023/06/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (932, 123, '2023/11/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (933, 6, '2023/04/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (934, 29, '2023/06/08');
insert into Orders (OrderID, CustomerID, OrderDate) values (935, 122, '2023/09/14');
insert into Orders (OrderID, CustomerID, OrderDate) values (936, 77, '2023/04/22');
insert into Orders (OrderID, CustomerID, OrderDate) values (937, 58, '2023/03/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (938, 106, '2023/12/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (939, 113, '2023/11/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (940, 116, '2023/12/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (941, 11, '2023/06/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (942, 118, '2023/04/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (943, 143, '2023/10/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (944, 77, '2023/05/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (945, 67, '2023/02/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (946, 43, '2023/04/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (947, 102, '2023/03/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (948, 122, '2023/08/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (949, 42, '2023/08/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (950, 122, '2023/12/15');
insert into Orders (OrderID, CustomerID, OrderDate) values (951, 19, '2023/09/09');
insert into Orders (OrderID, CustomerID, OrderDate) values (952, 34, '2023/10/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (953, 5, '2023/09/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (954, 116, '2023/08/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (955, 106, '2023/05/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (956, 124, '2023/06/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (957, 131, '2023/05/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (958, 64, '2023/08/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (959, 37, '2023/08/19');
insert into Orders (OrderID, CustomerID, OrderDate) values (960, 137, '2023/08/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (961, 59, '2023/08/26');
insert into Orders (OrderID, CustomerID, OrderDate) values (962, 135, '2023/08/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (963, 80, '2023/08/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (964, 83, '2023/09/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (965, 135, '2023/08/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (966, 17, '2023/12/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (967, 58, '2023/03/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (968, 126, '2024/01/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (969, 112, '2023/04/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (970, 44, '2023/06/01');
insert into Orders (OrderID, CustomerID, OrderDate) values (971, 120, '2023/03/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (972, 64, '2023/07/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (973, 137, '2023/04/18');
insert into Orders (OrderID, CustomerID, OrderDate) values (974, 108, '2024/01/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (975, 5, '2023/11/06');
insert into Orders (OrderID, CustomerID, OrderDate) values (976, 140, '2023/02/20');
insert into Orders (OrderID, CustomerID, OrderDate) values (977, 19, '2024/01/11');
insert into Orders (OrderID, CustomerID, OrderDate) values (978, 5, '2023/08/05');
insert into Orders (OrderID, CustomerID, OrderDate) values (979, 122, '2023/07/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (980, 132, '2023/03/29');
insert into Orders (OrderID, CustomerID, OrderDate) values (981, 112, '2024/01/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (982, 125, '2023/04/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (983, 73, '2023/03/27');
insert into Orders (OrderID, CustomerID, OrderDate) values (984, 97, '2023/05/28');
insert into Orders (OrderID, CustomerID, OrderDate) values (985, 142, '2023/12/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (986, 31, '2023/11/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (987, 36, '2023/07/12');
insert into Orders (OrderID, CustomerID, OrderDate) values (988, 23, '2023/02/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (989, 135, '2023/07/04');
insert into Orders (OrderID, CustomerID, OrderDate) values (990, 24, '2023/12/16');
insert into Orders (OrderID, CustomerID, OrderDate) values (991, 138, '2023/03/13');
insert into Orders (OrderID, CustomerID, OrderDate) values (992, 97, '2023/07/30');
insert into Orders (OrderID, CustomerID, OrderDate) values (993, 116, '2023/05/25');
insert into Orders (OrderID, CustomerID, OrderDate) values (994, 49, '2023/03/03');
insert into Orders (OrderID, CustomerID, OrderDate) values (995, 99, '2023/09/10');
insert into Orders (OrderID, CustomerID, OrderDate) values (996, 123, '2023/09/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (997, 31, '2023/08/24');
insert into Orders (OrderID, CustomerID, OrderDate) values (998, 57, '2023/12/17');
insert into Orders (OrderID, CustomerID, OrderDate) values (999, 2, '2023/06/23');
insert into Orders (OrderID, CustomerID, OrderDate) values (1000, 122, '2023/12/20');

select * from orders;

SELECT string_agg(DISTINCT CustomerID::TEXT, ',') FROM Orders


INSERT INTO OrderDetails (DetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 1, 5),
(2, 2, 5, 12),
(3, 3, 11, 8),
(4, 4, 60, 10),
(5, 5, 15, 6),
(6, 6, 28, 17),
(7, 7, 9, 3),
(8, 8, 40, 14),
(9, 9, 21, 8),
(10, 10, 7, 5),
(11, 11, 52, 12),
(12, 12, 33, 9),
(13, 13, 4, 20),
(14, 14, 18, 2),
(15, 15, 56, 15),
(16, 16, 10, 11),
(17, 17, 29, 7),
(18, 18, 45, 4),
(19, 19, 3, 18),
(20, 20, 38, 1),
(21, 21, 20, 19),
(22, 22, 35, 6),
(23, 23, 48, 10),
(24, 24, 2, 15),
(25, 25, 13, 3),
(26, 26, 30, 8),
(27, 27, 55, 12),
(28, 28, 42, 5),
(29, 29, 16, 7),
(30, 30, 50, 14),
(31, 31, 24, 1),
(32, 32, 8, 18),
(33, 33, 36, 9),
(34, 34, 5, 4),
(35, 35, 19, 11),
(36, 36, 44, 20),
(37, 37, 57, 2),
(38, 38, 22, 17),
(39, 39, 6, 13),
(40, 40, 32, 16),
(41, 41, 23, 5),
(42, 42, 18, 10),
(43, 43, 47, 15),
(44, 44, 10, 20),
(45, 45, 31, 1),
(46, 46, 52, 2),
(47, 47, 9, 3),
(48, 48, 36, 4),
(49, 49, 29, 6),
(50, 50, 41, 7),
(51, 51, 14, 8),
(52, 52, 7, 9),
(53, 53, 46, 11),
(54, 54, 58, 12),
(55, 55, 3, 13),
(56, 56, 22, 14),
(57, 57, 45, 16),
(58, 58, 5, 17),
(59, 59, 25, 18),
(60, 60, 40, 19),
(61, 61, 21, 1),
(62, 62, 53, 2),
(63, 63, 8, 3),
(64, 64, 38, 4),
(65, 65, 17, 5),
(66, 66, 43, 6),
(67, 67, 59, 7),
(68, 68, 6, 8),
(69, 69, 30, 9),
(70, 70, 55, 10),
(71, 71, 28, 11),
(72, 72, 11, 12),
(73, 73, 44, 13),
(74, 74, 19, 14),
(75, 75, 34, 15),
(76, 76, 12, 16),
(77, 77, 49, 17),
(78, 78, 27, 18),
(79, 79, 4, 19),
(80, 80, 50, 20),
(81, 81, 35, 1),
(82, 82, 56, 2),
(83, 83, 16, 3),
(84, 84, 33, 4),
(85, 85, 1, 5),
(86, 86, 39, 6),
(87, 87, 57, 7),
(88, 88, 20, 8),
(89, 89, 42, 9),
(90, 90, 15, 10),
(91, 91, 2, 11),
(92, 92, 37, 12),
(93, 93, 24, 13),
(94, 94, 48, 14),
(95, 95, 26, 15),
(96, 96, 54, 16),
(97, 97, 13, 17),
(98, 98, 32, 18),
(99, 99, 51, 19),
(100, 100, 9, 20),
(101, 101, 47, 1),
(102, 102, 26, 2),
(103, 103, 18, 3),
(104, 104, 37, 4),
(105, 105, 5, 5),
(106, 106, 31, 6),
(107, 107, 56, 7),
(108, 108, 12, 8),
(109, 109, 40, 9),
(110, 110, 23, 10),
(111, 111, 9, 11),
(112, 112, 42, 12),
(113, 113, 58, 13),
(114, 114, 15, 14),
(115, 115, 33, 15),
(116, 116, 6, 16),
(117, 117, 49, 17),
(118, 118, 28, 18),
(119, 119, 17, 19),
(120, 120, 46, 20),
(121, 121, 21, 1),
(122, 122, 52, 2),
(123, 123, 7, 3),
(124, 124, 34, 4),
(125, 125, 19, 5),
(126, 126, 44, 6),
(127, 127, 59, 7),
(128, 128, 8, 8),
(129, 129, 36, 9),
(130, 130, 55, 10),
(131, 131, 27, 11),
(132, 132, 10, 12),
(133, 133, 45, 13),
(134, 134, 20, 14),
(135, 135, 35, 15),
(136, 136, 11, 16),
(137, 137, 48, 17),
(138, 138, 29, 18),
(139, 139, 1, 19),
(140, 140, 38, 20),
(141, 141, 57, 1),
(142, 142, 16, 2),
(143, 143, 39, 3),
(144, 144, 22, 4),
(145, 145, 2, 5),
(146, 146, 41, 6),
(147, 147, 51, 7),
(148, 148, 14, 8),
(149, 149, 30, 9),
(150, 150, 54, 10),
(151, 151, 25, 11),
(152, 152, 6, 12),
(153, 153, 43, 13),
(154, 154, 8, 14),
(155, 155, 32, 15),
(156, 156, 13, 16),
(157, 157, 50, 17),
(158, 158, 24, 18),
(159, 159, 3, 19),
(160, 160, 60, 20),
(161, 161, 35, 1),
(162, 162, 56, 2),
(163, 163, 16, 3),
(164, 164, 33, 4),
(165, 165, 1, 5),
(166, 166, 39, 6),
(167, 167, 57, 7),
(168, 168, 20, 8),
(169, 169, 42, 9),
(170, 170, 15, 10),
(171, 171, 2, 11),
(172, 172, 37, 12),
(173, 173, 24, 13),
(174, 174, 48, 14),
(175, 175, 26, 15),
(176, 176, 54, 16),
(177, 177, 13, 17),
(178, 178, 32, 18),
(179, 179, 51, 19),
(180, 180, 9, 20),
(181, 181, 47, 1),
(182, 182, 26, 2),
(183, 183, 18, 3),
(184, 184, 37, 4),
(185, 185, 5, 5),
(186, 186, 31, 6),
(187, 187, 56, 7),
(188, 188, 12, 8),
(189, 189, 40, 9),
(190, 190, 23, 10),
(191, 191, 9, 11),
(192, 192, 42, 12),
(193, 193, 58, 13),
(194, 194, 15, 14),
(195, 195, 33, 15),
(196, 196, 6, 16),
(197, 197, 49, 17),
(198, 198, 28, 18),
(199, 199, 17, 19),
(200, 200, 46, 20),
(201, 201, 21, 1),
(202, 202, 52, 2),
(203, 203, 7, 3),
(204, 204, 34, 4),
(205, 205, 19, 5),
(206, 206, 44, 6),
(207, 207, 59, 7),
(208, 208, 8, 8),
(209, 209, 36, 9),
(210, 210, 55, 10),
(211, 211, 27, 11),
(212, 212, 10, 12),
(213, 213, 45, 13),
(214, 214, 20, 14),
(215, 215, 35, 15),
(216, 216, 11, 16),
(217, 217, 48, 17),
(218, 218, 29, 18),
(219, 219, 1, 19),
(220, 220, 38, 20),
(221, 221, 57, 1),
(222, 222, 16, 2),
(223, 223, 39, 3),
(224, 224, 22, 4),
(225, 225, 2, 5),
(226, 226, 41, 6),
(227, 227, 51, 7),
(228, 228, 14, 8),
(229, 229, 30, 9),
(230, 230, 54, 10),
(231, 231, 25, 11),
(232, 232, 6, 12),
(233, 233, 43, 13),
(234, 234, 8, 14),
(235, 235, 32, 15),
(236, 236, 13, 16),
(237, 237, 50, 17),
(238, 238, 24, 18),
(239, 239, 3, 19),
(240, 240, 60, 20),
(241, 241, 35, 1),
(242, 242, 56, 2),
(243, 243, 16, 3),
(244, 244, 33, 4),
(245, 245, 1, 5),
(246, 246, 39, 6),
(247, 247, 57, 7),
(248, 248, 20, 8),
(249, 249, 42, 9),
(250, 250, 15, 10),
(251, 251, 2, 11),
(252, 252, 37, 12),
(253, 253, 24, 13),
(254, 254, 48, 14),
(255, 255, 26, 15),
(256, 256, 54, 16),
(257, 257, 13, 17),
(258, 258, 32, 18),
(259, 259, 51, 19),
(260, 260, 9, 20),
(261, 261, 47, 1),
(262, 262, 26, 2),
(263, 263, 18, 3),
(264, 264, 37, 4),
(265, 265, 5, 5),
(266, 266, 31, 6),
(267, 267, 56, 7),
(268, 268, 12, 8),
(269, 269, 40, 9),
(270, 270, 23, 10),
(271, 271, 9, 11),
(272, 272, 42, 12),
(273, 273, 58, 13),
(274, 274, 15, 14),
(275, 275, 33, 15),
(276, 276, 6, 16),
(277, 277, 49, 17),
(278, 278, 28, 18),
(279, 279, 17, 19),
(280, 280, 46, 20),
(281, 281, 21, 1),
(282, 282, 52, 2),
(283, 283, 7, 3),
(284, 284, 34, 4),
(285, 285, 19, 5),
(286, 286, 44, 6),
(287, 287, 59, 7),
(288, 288, 8, 8),
(289, 289, 36, 9),
(290, 290, 55, 10),
(291, 291, 27, 11),
(292, 292, 10, 12),
(293, 293, 45, 13),
(294, 294, 20, 14),
(295, 295, 35, 15),
(296, 296, 11, 16),
(297, 297, 48, 17),
(298, 298, 29, 18),
(299, 299, 1, 19),
(300, 300, 38, 20),
(301, 301, 57, 1),
(302, 302, 16, 2),
(303, 303, 39, 3),
(304, 304, 22, 4),
(305, 305, 2, 5),
(306, 306, 41, 6),
(307, 307, 51, 7),
(308, 308, 14, 8),
(309, 309, 30, 9),
(310, 310, 54, 10),
(311, 311, 25, 11),
(312, 312, 6, 12),
(313, 313, 43, 13),
(314, 314, 8, 14),
(315, 315, 32, 15),
(316, 316, 13, 16),
(317, 317, 50, 17),
(318, 318, 24, 18),
(319, 319, 3, 19),
(320, 320, 60, 20),
(321, 321, 35, 1),
(322, 322, 56, 2),
(323, 323, 16, 3),
(324, 324, 33, 4),
(325, 325, 1, 5),
(326, 326, 39, 6),
(327, 327, 57, 7),
(328, 328, 20, 8),
(329, 329, 42, 9),
(330, 330, 15, 10),
(331, 331, 2, 11),
(332, 332, 37, 12),
(333, 333, 24, 13),
(334, 334, 48, 14),
(335, 335, 26, 15),
(336, 336, 54, 16),
(337, 337, 13, 17),
(338, 338, 32, 18),
(339, 339, 51, 19),
(340, 340, 9, 20),
(341, 341, 47, 1),
(342, 342, 26, 2),
(343, 343, 18, 3),
(344, 344, 37, 4),
(345, 345, 5, 5),
(346, 346, 31, 6),
(347, 347, 56, 7),
(348, 348, 12, 8),
(349, 349, 40, 9),
(350, 350, 23, 10),
(351, 351, 9, 11),
(352, 352, 42, 12),
(353, 353, 58, 13),
(354, 354, 15, 14),
(355, 355, 33, 15),
(356, 356, 6, 16),
(357, 357, 49, 17),
(358, 358, 28, 18),
(359, 359, 17, 19),
(360, 360, 46, 20),
(361, 361, 21, 1),
(362, 362, 52, 2),
(363, 363, 7, 3),
(364, 364, 34, 4),
(365, 365, 19, 5),
(366, 366, 44, 6),
(367, 367, 59, 7),
(368, 368, 8, 8),
(369, 369, 36, 9),
(370, 370, 55, 10),
(371, 371, 27, 11),
(372, 372, 10, 12),
(373, 373, 45, 13),
(374, 374, 20, 14),
(375, 375, 35, 15),
(376, 376, 11, 16),
(377, 377, 48, 17),
(378, 378, 29, 18),
(379, 379, 1, 19),
(380, 380, 38, 20),
(381, 381, 57, 1),
(382, 382, 16, 2),
(383, 383, 39, 3),
(384, 384, 22, 4),
(385, 385, 2, 5),
(386, 386, 41, 6),
(387, 387, 51, 7),
(388, 388, 14, 8),
(389, 389, 30, 9),
(390, 390, 54, 10),
(391, 391, 25, 11),
(392, 392, 6, 12),
(393, 393, 43, 13),
(394, 394, 8, 14),
(395, 395, 32, 15),
(396, 396, 13, 16),
(397, 397, 50, 17),
(398, 398, 24, 18),
(399, 399, 3, 19),
(400, 400, 60, 20),
(401, 401, 35, 1),
(402, 402, 56, 2),
(403, 403, 16, 3),
(404, 404, 33, 4),
(405, 405, 1, 5),
(406, 406, 39, 6),
(407, 407, 57, 7),
(408, 408, 20, 8),
(409, 409, 42, 9),
(410, 410, 15, 10),
(411, 411, 2, 11),
(412, 412, 37, 12),
(413, 413, 24, 13),
(414, 414, 48, 14),
(415, 415, 26, 15),
(416, 416, 54, 16),
(417, 417, 13, 17),
(418, 418, 32, 18),
(419, 419, 51, 19),
(420, 420, 9, 20),
(421, 421, 47, 1),
(422, 422, 26, 2),
(423, 423, 18, 3),
(424, 424, 37, 4),
(425, 425, 5, 5),
(426, 426, 31, 6),
(427, 427, 56, 7),
(428, 428, 12, 8),
(429, 429, 40, 9),
(430, 430, 23, 10),
(431, 431, 9, 11),
(432, 432, 42, 12),
(433, 433, 58, 13),
(434, 434, 15, 14),
(435, 435, 33, 15),
(436, 436, 6, 16),
(437, 437, 49, 17),
(438, 438, 28, 18),
(439, 439, 17, 19),
(440, 440, 46, 20),
(441, 441, 21, 1),
(442, 442, 52, 2),
(443, 443, 7, 3),
(444, 444, 34, 4),
(445, 445, 19, 5),
(446, 446, 44, 6),
(447, 447, 59, 7),
(448, 448, 8, 8),
(449, 449, 36, 9),
(450, 450, 55, 10),
(451, 451, 27, 11),
(452, 452, 10, 12),
(453, 453, 45, 13),
(454, 454, 20, 14),
(455, 455, 35, 15),
(456, 456, 11, 16),
(457, 457, 48, 17),
(458, 458, 29, 18),
(459, 459, 1, 19),
(460, 460, 38, 20),
(461, 461, 57, 1),
(462, 462, 16, 2),
(463, 463, 39, 3),
(464, 464, 22, 4),
(465, 465, 2, 5),
(466, 466, 41, 6),
(467, 467, 51, 7),
(468, 468, 14, 8),
(469, 469, 30, 9),
(470, 470, 54, 10),
(471, 471, 25, 11),
(472, 472, 6, 12),
(473, 473, 43, 13),
(474, 474, 8, 14),
(475, 475, 32, 15),
(476, 476, 13, 16),
(477, 477, 50, 17),
(478, 478, 24, 18),
(479, 479, 3, 19),
(480, 480, 60, 20),
(481, 481, 35, 1),
(482, 482, 56, 2),
(483, 483, 16, 3),
(484, 484, 33, 4),
(485, 485, 1, 5),
(486, 486, 39, 6),
(487, 487, 57, 7),
(488, 488, 20, 8),
(489, 489, 42, 9),
(490, 490, 15, 10),
(491, 491, 2, 11),
(492, 492, 37, 12),
(493, 493, 24, 13),
(494, 494, 48, 14),
(495, 495, 26, 15),
(496, 496, 54, 16),
(497, 497, 13, 17),
(498, 498, 32, 18),
(499, 499, 51, 19),
(500, 500, 9, 20),
(501, 501, 47, 1),
(502, 502, 26, 2),
(503, 503, 18, 3),
(504, 504, 37, 4),
(505, 505, 5, 5),
(506, 506, 31, 6),
(507, 507, 56, 7),
(508, 508, 12, 8),
(509, 509, 40, 9),
(510, 510, 23, 10),
(511, 511, 9, 11),
(512, 512, 42, 12),
(513, 513, 58, 13),
(514, 514, 15, 14),
(515, 515, 33, 15),
(516, 516, 6, 16),
(517, 517, 49, 17),
(518, 518, 28, 18),
(519, 519, 17, 19),
(520, 520, 46, 20),
(521, 521, 21, 1),
(522, 522, 52, 2),
(523, 523, 7, 3),
(524, 524, 34, 4),
(525, 525, 19, 5),
(526, 526, 44, 6),
(527, 527, 59, 7),
(528, 528, 8, 8),
(529, 529, 36, 9),
(530, 530, 55, 10),
(531, 531, 27, 11),
(532, 532, 10, 12),
(533, 533, 45, 13),
(534, 534, 20, 14),
(535, 535, 35, 15),
(536, 536, 11, 16),
(537, 537, 48, 17),
(538, 538, 29, 18),
(539, 539, 1, 19),
(540, 540, 38, 20),
(541, 541, 57, 1),
(542, 542, 16, 2),
(543, 543, 39, 3),
(544, 544, 22, 4),
(545, 545, 2, 5),
(546, 546, 41, 6),
(547, 547, 51, 7),
(548, 548, 14, 8),
(549, 549, 30, 9),
(550, 550, 54, 10),
(551, 551, 25, 11),
(552, 552, 6, 12),
(553, 553, 43, 13),
(554, 554, 8, 14),
(555, 555, 32, 15),
(556, 556, 13, 16),
(557, 557, 50, 17),
(558, 558, 24, 18),
(559, 559, 3, 19),
(560, 560, 60, 20),
(561, 561, 35, 1),
(562, 562, 56, 2),
(563, 563, 16, 3),
(564, 564, 33, 4),
(565, 565, 1, 5),
(566, 566, 39, 6),
(567, 567, 57, 7),
(568, 568, 20, 8),
(569, 569, 42, 9),
(570, 570, 15, 10),
(571, 571, 2, 11),
(572, 572, 37, 12),
(573, 573, 24, 13),
(574, 574, 48, 14),
(575, 575, 26, 15),
(576, 576, 54, 16),
(577, 577, 13, 17),
(578, 578, 32, 18),
(579, 579, 51, 19),
(580, 580, 9, 20),
(581, 581, 47, 1),
(582, 582, 26, 2),
(583, 583, 18, 3),
(584, 584, 37, 4),
(585, 585, 5, 5),
(586, 586, 31, 6),
(587, 587, 56, 7),
(588, 588, 12, 8),
(589, 589, 40, 9),
(590, 590, 23, 10),
(591, 591, 9, 11),
(592, 592, 42, 12),
(593, 593, 58, 13),
(594, 594, 15, 14),
(595, 595, 33, 15),
(596, 596, 6, 16),
(597, 597, 49, 17),
(598, 598, 28, 18),
(599, 599, 17, 19),
(600, 600, 46, 20),
(601, 601, 21, 1),
(602, 602, 52, 2),
(603, 603, 7, 3),
(604, 604, 34, 4),
(605, 605, 19, 5),
(606, 606, 44, 6),
(607, 607, 59, 7),
(608, 608, 8, 8),
(609, 609, 36, 9),
(610, 610, 55, 10),
(611, 611, 27, 11),
(612, 612, 10, 12),
(613, 613, 45, 13),
(614, 614, 20, 14),
(615, 615, 35, 15),
(616, 616, 11, 16),
(617, 617, 48, 17),
(618, 618, 29, 18),
(619, 619, 1, 19),
(620, 620, 38, 20),
(621, 621, 57, 1),
(622, 622, 16, 2),
(623, 623, 39, 3),
(624, 624, 22, 4),
(625, 625, 2, 5),
(626, 626, 41, 6),
(627, 627, 51, 7),
(628, 628, 14, 8),
(629, 629, 30, 9),
(630, 630, 54, 10),
(631, 631, 25, 11),
(632, 632, 6, 12),
(633, 633, 43, 13),
(634, 634, 8, 14),
(635, 635, 32, 15),
(636, 636, 13, 16),
(637, 637, 50, 17),
(638, 638, 24, 18),
(639, 639, 3, 19),
(640, 640, 60, 20),
(641, 641, 35, 1),
(642, 642, 56, 2),
(643, 643, 16, 3),
(644, 644, 33, 4),
(645, 645, 1, 5),
(646, 646, 39, 6),
(647, 647, 57, 7),
(648, 648, 20, 8),
(649, 649, 42, 9),
(650, 650, 15, 10),
(651, 651, 2, 11),
(652, 652, 37, 12),
(653, 653, 24, 13),
(654, 654, 48, 14),
(655, 655, 26, 15),
(656, 656, 54, 16),
(657, 657, 13, 17),
(658, 658, 32, 18),
(659, 659, 51, 19),
(660, 660, 9, 20),
(661, 661, 47, 1),
(662, 662, 26, 2),
(663, 663, 18, 3),
(664, 664, 37, 4),
(665, 665, 5, 5),
(666, 666, 31, 6),
(667, 667, 56, 7),
(668, 668, 12, 8),
(669, 669, 40, 9),
(670, 670, 23, 10),
(671, 671, 9, 11),
(672, 672, 42, 12),
(673, 673, 58, 13),
(674, 674, 15, 14),
(675, 675, 33, 15),
(676, 676, 6, 16),
(677, 677, 49, 17),
(678, 678, 28, 18),
(679, 679, 17, 19),
(680, 680, 46, 20),
(681, 681, 21, 1),
(682, 682, 52, 2),
(683, 683, 7, 3),
(684, 684, 34, 4),
(685, 685, 19, 5),
(686, 686, 44, 6),
(687, 687, 59, 7),
(688, 688, 8, 8),
(689, 689, 36, 9),
(690, 690, 55, 10),
(691, 691, 27, 11),
(692, 692, 10, 12),
(693, 693, 45, 13),
(694, 694, 20, 14),
(695, 695, 35, 15),
(696, 696, 11, 16),
(697, 697, 48, 17),
(698, 698, 29, 18),
(699, 699, 1, 19),
(700, 700, 38, 20),
(701, 701, 57, 1),
(702, 702, 16, 2),
(703, 703, 39, 3),
(704, 704, 22, 4),
(705, 705, 2, 5),
(706, 706, 41, 6),
(707, 707, 51, 7),
(708, 708, 14, 8),
(709, 709, 30, 9),
(710, 710, 54, 10),
(711, 711, 25, 11),
(712, 712, 6, 12),
(713, 713, 43, 13),
(714, 714, 8, 14),
(715, 715, 32, 15),
(716, 716, 13, 16),
(717, 717, 50, 17),
(718, 718, 24, 18),
(719, 719, 3, 19),
(720, 720, 60, 20),
(721, 721, 35, 1),
(722, 722, 56, 2),
(723, 723, 16, 3),
(724, 724, 33, 4),
(725, 725, 1, 5),
(726, 726, 39, 6),
(727, 727, 57, 7),
(728, 728, 20, 8),
(729, 729, 42, 9),
(730, 730, 15, 10),
(731, 731, 2, 11),
(732, 732, 37, 12),
(733, 733, 24, 13),
(734, 734, 48, 14),
(735, 735, 26, 15),
(736, 736, 54, 16),
(737, 737, 13, 17),
(738, 738, 32, 18),
(739, 739, 51, 19),
(740, 740, 9, 20),
(741, 741, 47, 1),
(742, 742, 26, 2),
(743, 743, 18, 3),
(744, 744, 37, 4),
(745, 745, 5, 5),
(746, 746, 31, 6),
(747, 747, 56, 7),
(748, 748, 12, 8),
(749, 749, 40, 9),
(750, 750, 23, 10),
(751, 751, 9, 11),
(752, 752, 42, 12),
(753, 753, 58, 13),
(754, 754, 15, 14),
(755, 755, 33, 15),
(756, 756, 6, 16),
(757, 757, 49, 17),
(758, 758, 28, 18),
(759, 759, 17, 19),
(760, 760, 46, 20),
(761, 761, 21, 1),
(762, 762, 52, 2),
(763, 763, 7, 3),
(764, 764, 34, 4),
(765, 765, 19, 5),
(766, 766, 44, 6),
(767, 767, 59, 7),
(768, 768, 8, 8),
(769, 769, 36, 9),
(770, 770, 55, 10),
(771, 771, 27, 11),
(772, 772, 10, 12),
(773, 773, 45, 13),
(774, 774, 20, 14),
(775, 775, 35, 15),
(776, 776, 11, 16),
(777, 777, 48, 17),
(778, 778, 29, 18),
(779, 779, 1, 19),
(780, 780, 38, 20),
(781, 781, 57, 1),
(782, 782, 16, 2),
(783, 783, 39, 3),
(784, 784, 22, 4),
(785, 785, 2, 5),
(786, 786, 41, 6),
(787, 787, 51, 7),
(788, 788, 14, 8),
(789, 789, 30, 9),
(790, 790, 54, 10),
(791, 791, 25, 11),
(792, 792, 6, 12),
(793, 793, 43, 13),
(794, 794, 8, 14),
(795, 795, 32, 15),
(796, 796, 13, 16),
(797, 797, 50, 17),
(798, 798, 24, 18),
(799, 799, 3, 19),
(800, 800, 60, 20),
(801, 801, 35, 1),
(802, 802, 56, 2),
(803, 803, 16, 3),
(804, 804, 33, 4),
(805, 805, 1, 5),
(806, 806, 39, 6),
(807, 807, 57, 7),
(808, 808, 20, 8),
(809, 809, 42, 9),
(810, 810, 15, 10),
(811, 811, 2, 11),
(812, 812, 37, 12),
(813, 813, 24, 13),
(814, 814, 48, 14),
(815, 815, 26, 15),
(816, 816, 54, 16),
(817, 817, 13, 17),
(818, 818, 32, 18),
(819, 819, 51, 19),
(820, 820, 9, 20),
(821, 821, 47, 1),
(822, 822, 26, 2),
(823, 823, 18, 3),
(824, 824, 37, 4),
(825, 825, 5, 5),
(826, 826, 31, 6),
(827, 827, 56, 7),
(828, 828, 12, 8),
(829, 829, 40, 9),
(830, 830, 23, 10),
(831, 831, 9, 11),
(832, 832, 42, 12),
(833, 833, 58, 13),
(834, 834, 15, 14),
(835, 835, 33, 15),
(836, 836, 6, 16),
(837, 837, 49, 17),
(838, 838, 28, 18),
(839,839, 17, 19),
(840, 840, 46, 20),
(841, 841, 21, 1),
(842, 842, 52, 2),
(843, 843, 7, 3),
(844, 844, 34, 4),
(845, 845, 19, 5),
(846, 846, 44, 6),
(847, 847, 59, 7),
(848, 848, 8, 8),
(849, 849, 36, 9),
(850, 850, 55, 10),
(851, 851, 27, 11),
(852, 852, 10, 12),
(853, 853, 45, 13),
(854, 854, 20, 14),
(855, 855, 35, 15),
(856, 856, 11, 16),
(857, 857, 48, 17),
(858, 858, 29, 18),
(859, 859, 1, 19),
(860, 860, 38, 20),
(861, 861, 57, 1),
(862, 862, 16, 2),
(863, 863, 39, 3),
(864, 864, 22, 4),
(865, 865, 2, 5),
(866, 866, 41, 6),
(867, 867, 51, 7),
(868, 868, 14, 8),
(869, 869, 30, 9),
(870, 870, 54, 10),
(871, 871, 25, 11),
(872, 872, 6, 12),
(873, 873, 43, 13),
(874, 874, 8, 14),
(875, 875, 32, 15),
(876, 876, 13, 16),
(877, 877, 50, 17),
(878, 878, 24, 18),
(879, 879, 3, 19),
(880, 880, 60, 20),
(881, 881, 35, 1),
(882, 882, 56, 2),
(883, 883, 16, 3),
(884, 884, 33, 4),
(885, 885, 1, 5),
(886, 886, 39, 6),
(887, 887, 57, 7),
(888, 888, 20, 8),
(889, 889, 42, 9),
(890, 890, 15, 10),
(891, 891, 2, 11),
(892, 892, 37, 12),
(893, 893, 24, 13),
(894, 894, 48, 14),
(895, 895, 26, 15),
(896, 896, 54, 16),
(897, 897, 13, 17),
(898, 898, 32, 18),
(899, 899, 51, 19),
(900, 900, 9, 20),
(901, 901, 47, 1),
(902, 902, 26, 2),
(903, 903, 18, 3),
(904, 904, 37, 4),
(905, 905, 5, 5),
(906, 906, 31, 6),
(907, 907, 56, 7),
(908, 908, 12, 8),
(909, 909, 40, 9),
(910, 910, 23, 10),
(911, 911, 9, 11),
(912, 912, 42, 12),
(913, 913, 58, 13),
(914, 914, 15, 14),
(915, 915, 33, 15),
(916, 916, 6, 16),
(917, 917, 49, 17),
(918, 918, 28, 18),
(919, 919, 17, 19),
(920, 920, 46, 20),
(921, 921, 21, 1),
(922, 922, 52, 2),
(923, 923, 7, 3),
(924, 924, 34, 4),
(925, 925, 19, 5),
(926, 926, 44, 6),
(927, 927, 59, 7),
(928, 928, 8, 8),
(929, 929, 36, 9),
(930, 930, 55, 10),
(931, 931, 27, 11),
(932, 932, 10, 12),
(933, 933, 45, 13),
(934, 934, 20, 14),
(935, 935, 35, 15),
(936, 936, 11, 16),
(937, 937, 48, 17),
(938, 938, 29, 18),
(939, 939, 1, 19),
(940, 940, 38, 20),
(941, 941, 57, 1),
(942, 942, 16, 2),
(943, 943, 39, 3),
(944, 944, 22, 4),
(945, 945, 2, 5),
(946, 946, 41, 6),
(947, 947, 51, 7),
(948, 948, 14, 8),
(949, 949, 30, 9),
(950, 950, 54, 10),
(951, 951, 25, 11),
(952, 952, 6, 12),
(953, 953, 43, 13),
(954, 954, 8, 14),
(955, 955, 32, 15),
(956, 956, 13, 16),
(957, 957, 50, 17),
(958, 958, 24, 18),
(959, 959, 3, 19),
(960, 960, 60, 20),
(961, 961, 35, 1),
(962, 962, 56, 2),
(963, 963, 16, 3),
(964, 964, 33, 4),
(965, 965, 1, 5),
(966, 966, 39, 6),
(967, 967, 57, 7),
(968, 968, 20, 8),
(969, 969, 42, 9),
(970, 970, 15, 10),
(971, 971, 2, 11),
(972, 972, 37, 12),
(973, 973, 24, 13),
(974, 974, 48, 14),
(975, 975, 26, 15),
(976, 976, 54, 16),
(977, 977, 13, 17),
(978, 978, 32, 18),
(979, 979, 51, 19),
(980, 980, 9, 20),
(981, 981, 47, 1),
(982, 982, 26, 2),
(983, 983, 18, 3),
(984, 984, 37, 4),
(985, 985, 5, 5),
(986, 986, 31, 6),
(987, 987, 56, 7),
(988, 988, 12, 8),
(989, 989, 40, 9),
(990, 990, 23, 10),
(991, 991, 9, 11),
(992, 992, 42, 12),
(993, 993, 58, 13),
(994, 994, 15, 14),
(995, 995, 33, 15),
(996, 996, 6, 16),
(997, 997, 49, 17),
(998, 998, 28, 18),
(999, 999, 17, 19),
(1000, 1000, 46, 20);

select * from OrderDetails

INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, Comment)
VALUES
     (1, 1, 1, 4.5, 'Great Product Worth Money!'),
    (2, 5, 22, 3.5, 'Nice Quality.'),
    (3, 21, 11, 4, 'Interesting but can be be durable'),
    (4, 4, 2, 4.5, 'Excellent product.'),
	(5, 11, 76, 4.0, 'Satisfied with the purchase.'),
    (6, 30, 45, 3.0, 'Average product, could be better.'),
    (7, 55, 103, 4.5, 'Impressive quality and performance.'),
    (8, 16, 92, 3.5, 'Decent product for the price.'),
    (9, 7, 127, 4.0, 'Good value for money.'),
	(10, 42, 89, 4.2, 'Highly recommended, exceeded expectations.'),
    (11, 19, 34, 3.8, 'Fair product, met my basic requirements.'),
    (12, 8, 112, 4.7, 'Absolutely love it, great value for money!'),
    (13, 56, 77, 3.9, 'Good build quality but could improve functionality.'),
    (14, 2, 123, 4.3, 'Fantastic product, very satisfied with the purchase.'),
	(15, 33, 55, 4.6, 'Impressed with the quality, would buy again!'),
    (16, 13, 88, 3.7, 'Satisfactory performance, could have better features.'),
    (17, 58, 142, 4.8, 'Excellent product, exceeded my expectations.'),
    (18, 26, 19, 3.4, 'Average quality, expected better for the price.'),
    (19, 9, 67, 4.5, 'Great value for money, highly recommended!'),
	(20, 47, 98, 4.1, 'Overall satisfied with the product.'),
    (21, 17, 25, 3.6, 'Decent quality, but delivery took longer than expected.'),
    (22, 3, 132, 4.4, 'Very happy with the purchase, would recommend to others.'),
    (23, 50, 41, 3.9, 'Good product, meets my requirements.'),
    (24, 15, 68, 4.7, 'Excellent value for money, exceeded expectations!'),
	(25, 23, 76, 4.3, 'Impressive quality, worth the price.'),
    (26, 6, 110, 3.8, 'Satisfied with the product, but delivery could be faster.'),
    (27, 49, 19, 4.5, 'Great product, exceeded my expectations.'),
    (28, 12, 48, 3.6, 'Average quality, expected more features.'),
    (29, 31, 88, 4.2, 'Happy with the purchase, good value for money.'),
    (30, 14, 134, 3.9, 'Decent product, met my requirements.'),
    (31, 53, 72, 4.6, 'Excellent build quality, highly recommended.'),
    (32, 18, 9, 3.7, 'Satisfactory product, but could be improved.'),
    (33, 5, 127, 4.4, 'Very good product, happy with the purchase.'),
    (34, 27, 36, 4.1, 'Impressed with the performance, would buy again.'),
	(35, 36, 24, 4.0, 'Good quality product, meets expectations.'),
    (36, 10, 103, 3.5, 'Fair product, could improve durability.'),
    (37, 45, 55, 4.3, 'Impressed with the features and performance.'),
    (38, 20, 76, 3.8, 'Satisfied with the purchase, but delivery was slow.'),
    (39, 40, 142, 4.5, 'Excellent product, worth every penny.'),
    (40, 28, 11, 3.6, 'Average quality, expected more for the price.'),
    (41, 51, 89, 4.2, 'Great value for money, satisfied with the product.'),
    (42, 16, 127, 3.9, 'Good product, but could have better durability.'),
    (43, 35, 34, 4.6, 'Very satisfied with the purchase, exceeded expectations.'),
    (44, 2, 67, 4.1, 'Overall happy with the product, performs well.'),
	(45, 14, 22, 4.4, 'Great product, exceeded my expectations.'),
    (46, 55, 109, 3.7, 'Satisfied with the purchase, but could improve durability.'),
    (47, 8, 47, 4.5, 'Excellent quality, highly recommended.'),
    (48, 25, 68, 3.9, 'Good value for money, but delivery took longer than expected.'),
    (49, 42, 126, 4.2, 'Impressed with the features, satisfied with the purchase.'),
    (50, 3, 35, 3.6, 'Average product, meets basic requirements.'),
    (51, 57, 79, 4.3, 'Very satisfied with the performance, worth every penny.'),
    (52, 17, 128, 3.8, 'Satisfactory quality, but expected more for the price.'),
    (53, 39, 46, 4.6, 'Excellent value for money, would recommend to others.'),
    (54, 24, 87, 4.1, 'Happy with the purchase, performs well.'),
    (55, 7, 131, 4.0, 'Good quality product, meets expectations.'),
    (56, 48, 21, 3.5, 'Fair product, could improve durability.'),
    (57, 29, 56, 4.3, 'Impressed with the features and performance.'),
    (58, 21, 75, 3.8, 'Satisfied with the purchase, but delivery was slow.'),
    (59, 43, 141, 4.5, 'Excellent product, worth every penny.'),
    (60, 33, 10, 3.6, 'Average quality, expected more for the price.'),
    (61, 53, 88, 4.2, 'Great value for money, satisfied with the product.'),
    (62, 19, 126, 3.9, 'Good product, but could have better durability.'),
    (63, 37, 33, 4.6, 'Very satisfied with the purchase, exceeded expectations.'),
    (64, 6, 66, 4.1, 'Overall happy with the product, performs well.'),
	(65, 11, 25, 4.4, 'Great product, highly recommended!'),
    (66, 50, 104, 3.7, 'Satisfied with the purchase, but delivery was slow.'),
    (67, 4, 48, 4.5, 'Excellent quality, meets expectations.'),
    (68, 28, 69, 3.9, 'Good value for money, but could improve durability.'),
    (69, 40, 127, 4.2, 'Impressed with the features and performance.'),
    (70, 2, 36, 3.6, 'Average product, meets basic requirements.'),
    (71, 49, 80, 4.3, 'Very satisfied with the performance, worth every penny.'),
    (72, 16, 129, 3.8, 'Satisfactory quality, but expected more for the price.'),
    (73, 38, 47, 4.6, 'Excellent value for money, would recommend to others.'),
    (74, 23, 88, 4.1, 'Happy with the purchase, performs well.'),
    (75, 9, 132, 4.0, 'Good quality product, meets expectations.'),
    (76, 46, 22, 3.5, 'Fair product, could improve durability.'),
    (77, 30, 57, 4.3, 'Impressed with the features and performance.'),
    (78, 18, 76, 3.8, 'Satisfied with the purchase, but delivery was slow.'),
    (79, 41, 142, 4.5, 'Excellent product, worth every penny.'),
    (80, 1, 34, 3.6, 'Average quality, meets basic requirements.'),
    (81, 52, 90, 4.2, 'Great value for money, satisfied with the product.'),
    (82, 14, 127, 3.9, 'Good product, but could have better durability.'),
    (83, 36, 34, 4.6, 'Very satisfied with the purchase, exceeded expectations.'),
    (84, 7, 67, 4.1, 'Overall happy with the product, performs well.'),
	(85, 22, 26, 4.4, 'Great product, highly recommended!'),
    (86, 51, 105, 3.7, 'Satisfied with the purchase, but delivery was slow.'),
    (87, 5, 49, 4.5, 'Excellent quality, meets expectations.'),
    (88, 29, 70, 3.9, 'Good value for money, but could improve durability.'),
    (89, 41, 128, 4.2, 'Impressed with the features and performance.'),
    (90, 3, 37, 3.6, 'Average product, meets basic requirements.'),
    (91, 50, 81, 4.3, 'Very satisfied with the performance, worth every penny.'),
    (92, 15, 130, 3.8, 'Satisfactory quality, but expected more for the price.'),
    (93, 39, 48, 4.6, 'Excellent value for money, would recommend to others.'),
    (94, 24, 89, 4.1, 'Happy with the purchase, performs well.'),
    (95, 8, 133, 4.0, 'Good quality product, meets expectations.'),
    (96, 47, 23, 3.5, 'Fair product, could improve durability.'),
    (97, 31, 58, 4.3, 'Impressed with the features and performance.'),
    (98, 19, 77, 3.8, 'Satisfied with the purchase, but delivery was slow.'),
    (99, 42, 143, 4.5, 'Excellent product, worth every penny.'),
    (100, 2, 35, 3.6, 'Average quality, meets basic requirements.'),
    (101, 53, 91, 4.2, 'Great value for money, satisfied with the product.'),
    (102, 20, 128, 3.9, 'Good product, but could have better durability.'),
    (103, 37, 35, 4.6, 'Very satisfied with the purchase, exceeded expectations.'),
    (104, 11, 68, 4.1, 'Overall happy with the product, performs well.'),
	(105, 10, 27, 4.4, 'Great product, highly recommended!'),
    (106, 49, 106, 3.7, 'Satisfied with the purchase, but delivery was slow.'),
    (107, 4, 50, 4.5, 'Excellent quality, meets expectations.'),
    (108, 30, 71, 3.9, 'Good value for money, but could improve durability.'),
    (109, 40, 129, 4.2, 'Impressed with the features and performance.'),
    (110, 1, 38, 3.6, 'Average product, meets basic requirements.'),
    (111, 48, 82, 4.3, 'Very satisfied with the performance, worth every penny.'),
    (112, 14, 131, 3.8, 'Satisfactory quality, but expected more for the price.'),
    (113, 38, 49, 4.6, 'Excellent value for money, would recommend to others.'),
    (114, 25, 90, 4.1, 'Happy with the purchase, performs well.'),
    (115, 9, 134, 4.0, 'Good quality product, meets expectations.'),
    (116, 46, 24, 3.5, 'Fair product, could improve durability.'),
    (117, 29, 59, 4.3, 'Impressed with the features and performance.'),
    (118, 17, 78, 3.8, 'Satisfied with the purchase, but delivery was slow.'),
    (119, 43, 144, 4.5, 'Excellent product, worth every penny.'),
    (120, 3, 36, 3.6, 'Average quality, meets basic requirements.'),
    (121, 54, 92, 4.2, 'Great value for money, satisfied with the product.'),
    (122, 21, 129, 3.9, 'Good product, but could have better durability.'),
    (123, 36, 36, 4.6, 'Very satisfied with the purchase, exceeded expectations.'),
    (124, 6, 69, 4.1, 'Overall happy with the product, performs well.'),
	(125, 20, 28, 4.4, 'Great product, highly recommended!'),
    (126, 51, 107, 3.7, 'Satisfied with the purchase, but delivery was slow.'),
    (127, 6, 51, 4.5, 'Excellent quality, meets expectations.'),
    (128, 31, 72, 3.9, 'Good value for money, but could improve durability.'),
    (129, 41, 130, 4.2, 'Impressed with the features and performance.'),
    (130, 2, 39, 3.6, 'Average product, meets basic requirements.'),
    (131, 47, 83, 4.3, 'Very satisfied with the performance, worth every penny.'),
    (132, 15, 132, 3.8, 'Satisfactory quality, but expected more for the price.'),
    (133, 37, 50, 4.6, 'Excellent value for money, would recommend to others.'),
    (134, 24, 91, 4.1, 'Happy with the purchase, performs well.'),
    (135, 10, 135, 4.0, 'Good quality product, meets expectations.'),
    (136, 45, 25, 3.5, 'Fair product, could improve durability.'),
    (137, 28, 60, 4.3, 'Impressed with the features and performance.'),
    (138, 18, 79, 3.8, 'Satisfied with the purchase, but delivery was slow.'),
    (139, 42, 145, 4.5, 'Excellent product, worth every penny.'),
    (140, 4, 37, 3.6, 'Average quality, meets basic requirements.'),
    (141, 55, 93, 4.2, 'Great value for money, satisfied with the product.'),
    (142, 22, 130, 3.9, 'Good product, but could have better durability.'),
    (143, 35, 37, 4.6, 'Very satisfied with the purchase, exceeded expectations.'),
    (144, 7, 70, 4.1, 'Overall happy with the product, performs well.'),
    (145, 13, 108, 3.7, 'Satisfied with the purchase, but could improve durability.'),
    (146, 48, 52, 4.5, 'Excellent quality, meets expectations.'),
    (147, 32, 73, 3.9, 'Good value for money, but could improve durability.'),
    (148, 53, 131, 4.2, 'Impressed with the features and performance.'),
    (149, 23, 40, 3.6, 'Average product, meets basic requirements.'),
    (150, 38, 84, 4.3, 'Very satisfied with the performance, worth every penny.'),
    (151, 16, 133, 3.8, 'Satisfactory quality, but expected more for the price.'),
    (152, 36, 51, 4.6, 'Excellent value for money, would recommend to others.'),
    (153, 25, 92, 4.1, 'Happy with the purchase, performs well.'),
    (154, 11, 136, 4.0, 'Good quality product, meets expectations.'),
    (155, 46, 26, 3.5, 'Fair product, could improve durability.');
	
select * from reviews;


INSERT INTO Discount (DiscountID, ProductID, DiscountAmount)
VALUES
    (1, 1, 10),
    (2, 5, 5),
    (3, 4, 10),
	(4, 8, 15),
	(5, 22, 3),
	(6, 14, 11),
	(7, 44, 10),
	(8, 24, 12),
	(9, 2, 25),
	(10, 59, 7),
	(11, 18, 10),
	(12, 14, 20),
	(13, 34, 21),
	(14, 28, 28),
	(15, 15, 15),
	(16, 32, 16),
	(17, 12, 5),
	(18, 42, 14),
	(19, 20, 10),
	(20, 3, 8);
	
INSERT INTO Coupan (CoupanID, DiscountAmout)
VALUES
    (1, 10),
    (2, 15)
	(3,15)
	(4,20);

INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (1, 457, '2022-01-05', '2022-01-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (2, 234, '2022-01-10', '2022-01-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (3, 781, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (4, 938, '2022-01-20', '2022-02-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (5, 657, '2022-01-25', '2022-02-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (6, 165, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (7, 722, '2022-02-04', '2022-02-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (8, 334, '2022-02-09', '2022-02-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (9, 100, '2022-02-14', '2022-03-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (10, 896, '2022-02-19', '2022-03-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (11, 555, '2022-02-24', '2022-03-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (12, 340, '2022-03-01', '2022-03-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (13, 672, '2022-03-06', '2022-03-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (14, 201, '2022-03-11', '2022-03-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (15, 923, '2022-03-16', '2022-04-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (16, 480, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (17, 802, '2022-03-26', '2022-04-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (18, 176, '2022-03-31', '2022-04-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (19, 812, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (20, 302, '2022-04-10', '2022-04-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (21, 929, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (22, 604, '2022-04-20', '2022-05-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (23, 843, '2022-04-25', '2022-05-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (24, 189, '2022-04-30', '2022-05-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (25, 708, '2022-05-05', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (26, 514, '2022-05-10', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (27, 265, '2022-05-15', '2022-05-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (28, 809, '2022-05-20', '2022-06-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (29, 622, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (30, 937, '2022-05-30', '2022-06-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (31, 271, '2022-06-04', '2022-06-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (32, 863, '2022-06-09', '2022-06-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (33, 140, '2022-06-14', '2022-07-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (34, 502, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (35, 729, '2022-06-24', '2022-07-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (36, 958, '2022-06-29', '2022-07-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (37, 145, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (38, 865, '2022-07-09', '2022-07-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (39, 670, '2022-07-14', '2022-07-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (40, 479, '2022-07-19', '2022-08-04');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (41, 330, '2022-07-24', '2022-08-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (42, 192, '2022-07-29', '2022-08-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (43, 935, '2022-08-03', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (44, 679, '2022-08-08', '2022-08-24');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (45, 543, '2022-08-13', '2022-08-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (46, 277, '2022-08-18', '2022-09-04');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (47, 943, '2022-08-23', '2022-09-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (48, 796, '2022-08-28', '2022-09-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (49, 158, '2022-09-02', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (50, 429, '2022-09-07', '2022-09-24');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (51, 827, '2022-09-12', '2022-09-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (52, 375, '2022-09-17', '2022-10-04');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (53, 210, '2022-09-22', '2022-10-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (54, 690, '2022-09-27', '2022-10-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (55, 348, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (56, 602, '2022-10-07', '2022-10-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (57, 784, '2022-10-12', '2022-10-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (58, 152, '2022-10-17', '2022-11-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (59, 913, '2022-10-22', '2022-11-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (60, 474, '2022-10-27', '2022-11-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (61, 822, '2022-11-01', '2022-11-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (62, 625, '2022-11-06',NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (63, 843, '2022-11-11', '2022-11-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (64, 267, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (65, 590, '2022-11-21', '2022-12-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (66, 728, '2022-11-26', '2022-12-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (67, 962, '2022-12-01', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (68, 347, '2022-12-06', '2022-12-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (69, 187, '2022-12-11', '2022-12-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (70, 546, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (71, 839, '2022-12-21', '2023-01-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (72, 372, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (73, 902, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (74, 618, '2023-01-06', '2023-01-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (75, 254, '2023-01-11', '2023-01-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (76, 748, '2023-01-16', '2023-02-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (77, 392, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (78, 837, '2023-01-26', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (79, 675, '2023-01-31', '2023-02-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (80, 295, '2023-02-05', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (81, 948, '2023-02-10', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (82, 703, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (83, 541, '2023-02-20', '2023-03-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (84, 132, '2023-02-25', '2023-03-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (85, 887, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (86, 619, '2023-03-07', '2023-03-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (87, 498, '2023-03-12', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (88, 267, '2023-03-17', '2023-04-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (89, 739, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (90, 940, '2023-03-27', '2023-04-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (91, 572, '2023-04-01', '2023-04-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (92, 875, '2023-04-06', '2023-04-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (93, 399, '2023-04-11', '2023-04-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (94, 826, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (95, 221, '2023-04-21', '2023-05-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (96, 756, '2023-04-26', '2023-05-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (97, 599, '2023-05-01', '2023-05-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (98, 378, '2023-05-06', '2023-05-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (99, 993, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (100, 784, '2023-05-16', '2023-06-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (101, 621, '2023-05-21', '2023-06-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (102, 419, '2023-05-26', '2023-06-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (103, 893, '2023-05-31', '2023-06-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (104, 275, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (105, 762, '2023-06-10', '2023-06-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (106, 108, '2023-06-15', '2023-07-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (107, 887, '2023-06-20', '2023-07-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (108, 303, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (109, 546, '2023-06-30', '2023-07-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (110, 731, '2023-07-05', '2023-07-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (111, 229, '2023-07-10', '2023-07-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (112, 947, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (113, 623, '2023-07-20', '2023-08-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (114, 408, '2023-07-25',NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (115, 871, '2023-07-30', '2023-08-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (116, 158, '2023-08-04', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (117, 532, '2023-08-09', '2023-08-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (118, 797, '2023-08-14',NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (119, 306, '2023-08-19', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (120, 610, '2023-08-24', '2023-09-09');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (121, 927, '2023-08-29', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (122, 274, '2023-09-03', '2023-09-20');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (123, 563, '2023-09-08', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (124, 829, '2023-09-13', '2023-09-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (125, 142, '2023-09-18', '2023-10-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (126, 479, '2023-09-23', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (127, 796, '2023-09-28', '2023-10-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (128, 259, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (129, 648, '2023-10-08', '2023-10-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (130, 923, '2023-10-13', '2023-10-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (131, 312, '2023-10-18', '2023-11-04');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (132, 687, '2023-10-23', '2023-11-09');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (133, 958, '2023-10-28', '2023-11-14');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (134, 511, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (135, 802, '2023-11-07', '2023-11-24');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (136, 309, '2023-11-12', '2023-11-29');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (137, 689, '2023-11-17', '2023-12-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (138, 417, '2023-11-22', '2023-12-07');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (139, 850, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (140, 109, '2023-12-02', '2023-12-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (141, 748, '2023-12-07', '2023-12-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (142, 240, '2023-12-12', '2023-12-27');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (143, 591, '2023-12-17', '2024-01-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (144, 860, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (145, 365, '2023-12-27', '2024-01-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (146, 962, '2024-01-01', '2024-01-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (147, 563, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (148, 823, '2024-01-11', '2024-01-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (149, 249, '2024-01-16', '2024-02-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (150, 719, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (151, 354, '2024-01-26', '2024-02-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (152, 629, '2024-01-31', '2024-02-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (153, 945, '2024-02-05', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (154, 293, '2024-02-10', '2024-02-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (155, 684, '2024-02-15', '2024-03-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (156, 849, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (157, 126, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (158, 582, '2024-03-01', '2024-03-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (159, 793, '2024-03-06', '2024-03-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (160, 248, '2024-03-11', '2024-03-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (161, 447, '2024-03-16', '2024-04-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (162, 702, '2024-03-21', '2024-04-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (163, 914, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (164, 176, '2024-03-31', '2024-04-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (165, 372, '2024-04-05', '2024-04-20');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (166, 607, '2024-04-10', '2024-04-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (167, 823, '2024-04-15', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (168, 124, '2024-04-20', '2024-05-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (169, 386, '2024-04-25', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (170, 589, '2024-04-30', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (171, 752, '2024-05-05', '2024-05-20');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (172, 955, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (173, 137, '2024-05-15', '2024-05-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (174, 389, '2024-05-20', '2024-06-04');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (175, 682, '2024-05-25', '2024-06-09');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (176, 926, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (177, 207, '2024-06-04', '2024-06-19');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (178, 477, '2024-06-09', '2024-06-24');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (179, 789, '2024-06-14', '2024-06-29');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (180, 943, '2024-06-19', '2024-07-04');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (181, 222, '2024-06-24', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (182, 514, '2024-06-29', '2024-07-14');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (183, 799, '2024-07-04', '2024-07-19');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (184, 967, '2024-07-09', '2024-07-24');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (185, 153, '2024-07-14', '2024-07-29');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (186, 366, '2024-07-19', '2024-08-03');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (187, 648, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (188, 893, '2024-07-29', '2024-08-13');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (189, 171, '2024-08-03', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (190, 447, '2024-08-08', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (191, 726, '2024-08-13', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (192, 958, '2024-08-18', '2024-09-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (193, 234, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (194, 514, '2024-08-28', '2024-09-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (195, 795, '2024-09-02', '2024-09-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (196, 146, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (197, 387, '2024-09-12', '2024-09-27');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (198, 682, '2024-09-17', '2024-10-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (199, 967, '2024-09-22',NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (200, 235, '2024-09-27', '2024-10-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (201, 515, '2024-10-02', '2024-10-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (202, 798, '2024-10-07', '2024-10-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (203, 978, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (204, 252, '2024-10-17', '2024-11-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (205, 452, '2024-10-22', '2024-11-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (206, 735, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (207, 956, '2024-11-01', '2024-11-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (208, 185, '2024-11-06', '2024-11-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (209, 384, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (210, 688, '2024-11-16', '2024-12-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (211, 979, '2024-11-21', '2024-12-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (212, 246, '2024-11-26', '2024-12-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (213, 531, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (214, 758, '2024-12-06', '2024-12-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (215, 946, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (216, 167, '2024-12-16', '2024-12-31');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (217, 377, '2024-12-21', '2025-01-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (218, 634, '2024-12-26', '2025-01-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (219, 849, '2024-12-31', '2025-01-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (220, 101, '2025-01-05', '2025-01-20');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (221, 298, '2025-01-10', '2025-01-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (222, 533, '2025-01-15', '2025-01-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (223, 716,NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (224, 953, '2025-01-25', '2025-02-09');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (225, 152, '2025-01-30', '2025-02-14');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (226, 368, '2025-02-04', '2025-02-19');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (227, 647, '2025-02-09', '2025-02-24');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (228, 862, '2025-02-14', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (229, 109, '2025-02-19', '2025-03-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (230, 314, '2025-02-24', '2025-03-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (231, 551, '2025-03-01', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (232, 746, '2025-03-06', '2025-03-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (233, 965, '2025-03-11', '2025-03-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (234, 138, '2025-03-16', '2025-04-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (235, 384, '2025-03-21', '2025-04-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (236, 662, '2025-03-26', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (237, 887, '2025-04-01', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (238, 145, '2025-04-06', '2025-04-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (239, 359, '2025-04-11', '2025-04-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (240, 623, '2025-04-16', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (241, 836, '2025-04-21', '2025-05-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (242, 109, '2025-04-26', '2025-05-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (243, 314, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (244, 567, '2025-05-06', '2025-05-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (245, 759, '2025-05-11', '2025-05-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (246, 989, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (247, 253, '2025-05-21', '2025-06-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (248, 473, '2025-05-26', '2025-06-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (249, 726, '2025-05-31', '2025-06-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (250, 999, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (251, 227, '2025-06-10', '2025-06-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (252, 421, '2025-06-15',NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (253, 684, '2025-06-20', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (254, 912, '2025-06-25', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (255, 191, '2025-06-30', '2025-07-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (256, 392, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (257, 655, '2025-07-10', '2025-07-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (258, 849, '2025-07-15', '2025-07-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (259, 128, '2025-07-20', '2025-08-04');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (260, 325, '2025-07-25', '2025-08-09');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (261, 587, '2025-07-30', '2025-08-14');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (262, 789, '2025-08-04', '2025-08-19');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (263, 976, '2025-08-09', '2025-08-24');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (264, 163, '2025-08-14', '2025-08-29');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (265, 356, '2025-08-19', '2025-09-03');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (266, 621, '2025-08-24', '2025-09-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (267, 835, '2025-08-29', '2025-09-13');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (268, 113, '2025-09-03', '2025-09-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (269, 312, '2025-09-08', '2025-09-23');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (270, 567, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (271, 753, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (272, 946, '2025-09-23', '2025-10-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (273, 168, '2025-09-28', '2025-10-13');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (274, 373, '2025-10-03', '2025-10-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (275, 629, '2025-10-08',NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (276, 827, '2025-10-13', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (277, 121, '2025-10-18', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (278, 315, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (279, 577, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (280, 781, '2025-11-02', '2025-11-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (281, 992, '2025-11-07', '2025-11-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (282, 196, '2025-11-12',NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (283, 401, '2025-11-17', '2025-12-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (284, 653, '2025-11-22', '2025-12-07');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (285, 852, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (286, 146, '2025-12-02', '2025-12-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (287, 359, '2025-12-07', '2025-12-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (288, 613, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (289, 817, '2025-12-17', '2026-01-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (290, 101, '2025-12-22', '2026-01-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (291, 308, '2025-12-27', '2026-01-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (292, 554, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (293, 753, '2026-01-06', '2026-01-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (294, 967, '2026-01-11', '2026-01-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (295, 188, '2026-01-16', '2026-01-31');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (296, 409, '2026-01-21', '2026-02-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (297, 673, '2026-01-26', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (298, 887, '2026-01-31', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (299, 143, '2026-02-05', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (300, 386, '2026-02-10', '2026-02-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (301, 642, '2026-02-15', '2026-03-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (302, 853, '2026-02-20', '2026-03-07');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (303, 116, '2026-02-25', '2026-03-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (304, 389, '2026-03-02', '2026-03-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (305, 651, '2026-03-07', '2026-03-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (306, 854, '2026-03-12', '2026-03-27');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (307, 102, '2026-03-17', '2026-04-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (308, 315, '2026-03-22', '2026-04-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (309, 578, '2026-03-27', '2026-04-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (310, 792, NULL,NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (311, 997, '2026-04-06', '2026-04-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (312, 234, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (313, 478, '2026-04-16', '2026-05-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (314, 742, '2026-04-21', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (315, 955, '2026-04-26', '2026-05-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (316, 179, '2026-05-01', '2026-05-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (317, 433, '2026-05-06', '2026-05-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (318, 717, '2026-05-11', '2026-05-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (319, 932, '2026-05-16', '2026-05-31');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (320, 176, '2026-05-21', '2026-06-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (321, 391, '2026-05-26', '2026-06-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (322, 655, '2026-05-31', '2026-06-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (323, 859, '2026-06-05', '2026-06-20');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (324, 114, '2026-06-10', '2026-06-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (325, 378, '2026-06-15', '2026-06-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (326, 672, '2026-06-20', '2026-07-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (327, 897, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (328, 151, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (329, 376, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (330, 641, '2026-07-10', '2026-07-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (331, 855, '2026-07-15', '2026-07-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (332, 110, '2026-07-20', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (333, 345, '2026-07-25', '2026-08-09');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (334, 609, '2026-07-30', '2026-08-14');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (335, 814, '2026-08-04', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (336, 976, '2026-08-09', '2026-08-24');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (337, 148, '2026-08-14', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (338, 383, '2026-08-19', '2026-09-03');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (339, 647, '2026-08-24', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (340, 862, '2026-08-29', '2026-09-13');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (341, 223, '2026-09-03', '2026-09-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (342, 442, '2026-09-08', '2026-09-23');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (343, 689, '2026-09-13', '2026-09-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (344, 966, '2026-09-18', '2026-10-03');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (345, 155, '2026-09-23', '2026-10-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (346, 374, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (347, 623, '2026-10-03', '2026-10-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (348, 902, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (349, 211, '2026-10-13', '2026-10-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (350, 530, '2026-10-18', '2026-11-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (351, 799, '2026-10-23', '2026-11-07');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (352, 118, '2026-10-28', '2026-11-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (353, 437, '2026-11-02', '2026-11-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (354, 796, '2026-11-07', '2026-11-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (355, 185, '2026-11-12', '2026-11-27');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (356, 504, '2026-11-17', '2026-12-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (357, 823, '2026-11-22', '2026-12-07');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (358, 192, '2026-11-27', '2026-12-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (359, 561, '2026-12-02', '2026-12-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (360, 870, '2026-12-07', '2026-12-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (361, 301, '2026-12-12', '2026-12-27');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (362, 672, '2026-12-17', '2027-01-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (363, 983, '2026-12-22', '2027-01-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (364, 364, '2026-12-27', '2027-01-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (365, 737, '2027-01-01', '2027-01-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (366, 150, '2027-01-06', '2027-01-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (367, 563, '2027-01-11',NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (368, 928, '2027-01-16', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (369, 343, '2027-01-21', '2027-02-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (370, 818, '2027-01-26', '2027-02-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (371, 255, '2027-01-31', '2027-02-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (372, 690, '2027-02-05', '2027-02-20');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (373, 175, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (374, 652, '2027-02-15', '2027-03-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (375, 167, '2027-02-20', '2027-03-07');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (376, 666, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (377, 223, '2027-03-02', '2027-03-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (378, 754, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (379, 345, '2027-03-12', '2027-03-27');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (380, 981, '2027-03-17', '2027-04-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (381, 209, '2027-03-22', '2027-04-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (382, 542, '2027-03-27', '2027-04-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (383, 904, '2027-04-01', '2027-04-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (384, 297, '2027-04-06', '2027-04-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (385, 689, '2027-04-11', '2027-04-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (386, 123, '2027-04-16', '2027-05-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (387, 543, '2027-04-21', '2027-05-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (388, 921, '2027-04-26', '2027-05-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (389, 339, '2027-05-01', '2027-05-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (390, 754, '2027-05-06', '2027-05-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (391, 190, '2027-05-11',NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (392, 639, '2027-05-16', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (393, 117, '2027-05-21', '2027-06-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (394, 549, '2027-05-26', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (395, 992, '2027-05-31', '2027-06-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (396, 468, '2027-06-05', '2027-06-20');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (397, 937, '2027-06-10', '2027-06-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (398, 447, '2027-06-15', '2027-06-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (399, 953, '2027-06-20', '2027-07-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (400, 472, '2027-06-25', '2027-07-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (401, 990, '2027-06-30', '2027-07-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (402, 468, '2027-07-05', '2027-07-20');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (403, 958, '2027-07-10', '2027-07-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (404, 487, '2027-07-15', '2027-07-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (405, 975, '2027-07-20', '2027-08-04');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (406, 934, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (407, 885, '2027-07-30', '2027-08-14');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (408, 973, '2027-08-04', '2027-08-19');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (409, 972, '2027-08-09', '2027-08-24');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (410, 965, '2027-08-14', '2027-08-29');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (411, 956, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (412, 947, '2027-08-24', '2027-09-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (413, 938, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (414, 929, '2027-09-03', '2027-09-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (415, 920, '2027-09-08', '2027-09-23');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (416, 911, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (417, 902, '2027-09-18',NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (418, 893, '2027-09-23', '2027-10-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (419, 884, '2027-09-28', '2027-10-13');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (420, 875, '2027-10-03', '2027-10-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (421, 866, '2027-10-08', '2027-10-23');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (422, 857, '2027-10-13', '2027-10-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (423, 848, '2027-10-18', '2027-11-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (424, 839, '2027-10-23', '2027-11-07');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (425, 830, '2027-10-28', '2027-11-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (426, 821, '2027-11-02', '2027-11-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (427, 812, '2027-11-07', '2027-11-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (428, 803, '2027-11-12', '2027-11-27');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (429, 794, '2027-11-17', '2027-12-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (430, 785, '2027-11-22', '2027-12-07');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (431, 776, '2027-11-27', '2027-12-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (432, 767, '2027-12-02', '2027-12-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (433, 758, '2027-12-07', '2027-12-22');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (434, 749, '2027-12-12', '2027-12-27');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (435, 740, '2027-12-17', '2028-01-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (436, 731, '2027-12-22', '2028-01-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (437, 722, '2027-12-27', '2028-01-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (438, 713, '2028-01-01', '2028-01-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (439, 704, '2028-01-06', '2028-01-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (440, 695, '2028-01-11', '2028-01-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (441, 686, '2028-01-16', '2028-02-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (442, 677, '2028-01-21', '2028-02-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (443, 668, '2028-01-26', '2028-02-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (444, 659, '2028-02-01', '2028-02-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (445, 650, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (446, 641, '2028-02-11', '2028-02-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (447, 632, '2028-02-16',NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (448, 623, '2028-02-21', NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (449, 614, '2028-02-26', '2028-03-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (450, 605, '2028-03-02', '2028-03-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (451, 596, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (452, 587, '2028-03-12', '2028-03-27');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (453, 578, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (454, 569, '2028-03-22', '2028-04-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (455, 560, '2028-03-27', '2028-04-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (456, 551, '2028-04-01', '2028-04-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (457, 542, '2028-04-06', '2028-04-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (458, 533, NULL, NULL);
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (459, 524, '2028-04-16', '2028-05-01');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (460, 515, '2028-04-21', '2028-05-06');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (461, 506, '2028-04-26', '2028-05-11');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (462, 497, '2028-05-01', '2028-05-16');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (463, 488, '2028-05-06', '2028-05-21');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (464, 479, '2028-05-11', '2028-05-26');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (465, 470, '2028-05-16', '2028-05-31');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (466, 461, '2028-05-21', '2028-06-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (467, 452, '2028-05-26', '2028-06-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (468, 443, '2028-05-31', '2028-06-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (469, 434, '2028-06-05', '2028-06-20');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (470, 425, '2028-06-10', '2028-06-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (471, 416, '2028-06-15', '2028-06-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (472, 407, '2028-06-20', '2028-07-05');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (473, 398, '2028-06-25', '2028-07-10');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (474, 389, '2028-06-30', '2028-07-15');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (475, 380, '2028-07-05', '2028-07-20');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (476, 371, '2028-07-10', '2028-07-25');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (477, 362, '2028-07-15', '2028-07-30');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (478, 353, '2028-07-20', '2028-08-04');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (479, 344, '2028-07-25', '2028-08-09');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (480, 335, '2028-07-30', '2028-08-14');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (481, 326, '2028-08-04', '2028-08-19');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (482, 317, '2028-08-09', '2028-08-24');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (483, 308, '2028-08-14', '2028-08-29');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (484, 299, '2028-08-19', '2028-09-03');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (485, 290, '2028-08-24', '2028-09-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (486, 281, '2028-08-29', '2028-09-13');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (487, 272, '2028-09-03', '2028-09-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (488, 263, '2028-09-08', '2028-09-23');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (489, 254, '2028-09-13', '2028-09-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (490, 245, '2028-09-18', '2028-10-03');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (491, 236, '2028-09-23', '2028-10-08');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (492, 227, '2028-09-28', '2028-10-13');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (493, 218, '2028-10-03', '2028-10-18');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (494, 209, '2028-10-08', '2028-10-23');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (495, 200, '2028-10-13', '2028-10-28');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (496, 191, '2028-10-18', '2028-11-02');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (497, 182, '2028-10-23', '2028-11-07');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (498, 173, '2028-10-28', '2028-11-12');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (499, 164, '2028-11-02', '2028-11-17');
INSERT INTO Shiping (ShipingID, OrderID, ShipDate, DeliveryDate) VALUES (500, 155, '2028-11-07', '2028-11-22');



SELECT ORDERID,COUNT(ORDERID) AS CNT FROM SHIPING
GROUP BY ORDERID
ORDER BY CNT DESC

SELECT COUNT(DISTINCT ORDERID) FROM SHIPING

select * from categories
select * from coupan
select * from customers
select * from discount
select * from orderdetails
select * from orders
select * from products
select * from reviews
select * from shiping















