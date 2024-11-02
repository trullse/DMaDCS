SELECT * FROM "user";

SELECT "name", "surname" FROM "user";

SELECT "content", "rate" FROM "feedback" WHERE "pharmacy_dep_id" = 2;

SELECT * FROM "category";

INSERT INTO "user" ("name", "surname", "birth_date", "role_id", "pharmacy_dep_id", "login", "password")
VALUES ('New', 'User', '1995-01-01', 1, 1, 'user', 'password');

INSERT INTO "feedback" ("user_id", "rate", "content", "pharmacy_dep_id")
VALUES (1, 7, 'Good service', 1);

UPDATE "user" SET "name" = 'UpdatedName' WHERE "id" = 1;

UPDATE "feedback" SET "rate" = 8 WHERE "id" = 3;

DELETE FROM "user" WHERE "id" = 4;

DELETE FROM "feedback" WHERE "id" = 1;

SELECT * FROM "user" ORDER BY "name" DESC;

