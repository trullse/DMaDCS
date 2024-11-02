INSERT INTO "role" ("id", "name") VALUES
(1, 'User'),
(2, 'Employee');

INSERT INTO "pharmacy_department" ("id", "address") VALUES
(1, '123 Elm St'),
(2, '456 Oak St'),
(3, '789 Maple St'),
(4, '101 Pine St'),
(5, '202 Cedar St');

INSERT INTO "supplier" ("id", "name", "address") VALUES
(1, 'Best supplier', '789 Elm St'),
(2, 'SuppLy', '101 Oak St'),
(3, 'Arhimed', '202 Maple St'),
(4, 'Nuget', '303 Pine St'),
(5, 'AnthonySup', '404 Cedar St');

INSERT INTO "medicine" ("id", "name", "description", "supplier_id") VALUES
(1, 'Paracetamol', 'Pain reliever', 1),
(2, 'Ibuprofen', 'Anti-inflammatory', 2),
(3, 'Amoxicillin', 'Antibiotic', 3),
(4, 'Loratadine', 'Antihistamine', 4),
(5, 'Omeprazole', 'Acid reducer', 5);

INSERT INTO "user" ("id", "name", "surname", "birth_date", "role_id", "pharmacy_dep_id", "login", "password") VALUES
(1, 'John', 'Doe', '1990-01-15', 1, 1, 'john.doe', 'password123'),
(2, 'Jane', 'Smith', '1985-05-20', 2, 2, 'jane.smith', 'pass123'),
(3, 'Alice', 'Johnson', '1988-09-12', 2, 3, 'alice.johnson', 'pass456'),
(4, 'Bob', 'Williams', '1995-03-28', 2, 4, 'bob.williams', 'pass789'),
(5, 'Eva', 'Brown', '1992-07-04', 2, 5, 'eva.brown', 'passabc');

INSERT INTO "feedback" ("id", "user_id", "rate", "content", "pharmacy_dep_id") VALUES
(1, 1, 5, 'Good service', 1),
(2, 2, 8, 'Excellent products', 2),
(3, 3, 7, 'Friendly staff', 3),
(4, 4, 6, 'Prompt delivery', 4),
(5, 5, 9, 'High quality', 5);

INSERT INTO "category" ("id", "name") VALUES
(1, 'Pain Relief'),
(2, 'Cold & Flu'),
(3, 'Antibiotics'),
(4, 'Allergy'),
(5, 'Digestive');

INSERT INTO "sale" ("id", "date", "user_id", "pharmacy_dep_id", "is_complete") VALUES
(1, '2023-10-01', 1, 1, true),
(2, '2023-10-02', 2, 2, false),
(3, '2023-10-03', 3, 3, true),
(4, '2023-10-04', 4, 4, false),
(5, '2023-10-05', 5, 5, true);

INSERT INTO "sale_medicine" ("id", "sale_id", "medicine_id") VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO "supplier_delivery" ("id", "pharmacy_dep_id", "supplier_id", "date") VALUES
(1, 1, 1, '2023-10-06'),
(2, 2, 2, '2023-10-07'),
(3, 3, 3, '2023-10-08'),
(4, 4, 4, '2023-10-09'),
(5, 5, 5, '2023-10-10');

INSERT INTO "category_medicine" ("id", "category_id", "medicine_id") VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO "log" ("id", "user_id", "date", "action") VALUES
(1, 1, '2023-10-11', 'Login'),
(2, 2, '2023-10-12', 'Logout'),
(3, 3, '2023-10-13', 'Login'),
(4, 4, '2023-10-14', 'Logout'),
(5, 5, '2023-10-15', 'Login');

