DROP TABLE IF EXISTS "category_medicine";
DROP TABLE IF EXISTS "sale_medicine";
DROP TABLE IF EXISTS "log";
DROP TABLE IF EXISTS "feedback";
DROP TABLE IF EXISTS "sale";
DROP TABLE IF EXISTS "category";
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS "supplier_delivery";
DROP TABLE IF EXISTS "medicine";
DROP TABLE IF EXISTS "supplier";
DROP TABLE IF EXISTS "pharmacy_department";
DROP TABLE IF EXISTS "role";

CREATE TABLE "role"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "name" VARCHAR(255) NOT NULL
);

CREATE TABLE "pharmacy_department"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "address" VARCHAR(255) NOT NULL
);
CREATE TABLE "supplier"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL
);
CREATE TABLE "medicine"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "supplier_id" BIGINT REFERENCES "supplier"("id") NOT NULL
);
CREATE TABLE "user"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "surname" VARCHAR(255) NOT NULL,
    "birth_date" DATE NOT NULL,
    "role_id" BIGINT REFERENCES "role"("id") NOT NULL,
    "pharmacy_dep_id" BIGINT REFERENCES "pharmacy_department"("id") NULL,
    "login" VARCHAR(255) UNIQUE NOT NULL,
    "password" VARCHAR(255) NOT NULL
);
CREATE TABLE "feedback"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "user_id" BIGINT REFERENCES "user"("id") NOT NULL,
    "rate" INTEGER CHECK ("rate" BETWEEN 1 AND 10) NOT NULL,
    "content" VARCHAR(255) NULL,
    "pharmacy_dep_id" BIGINT REFERENCES "pharmacy_department"("id") NOT NULL
);
CREATE TABLE "category"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
CREATE UNIQUE INDEX "name_indx" ON "category" ("name");
CREATE TABLE "sale"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "date" DATE NOT NULL,
    "user_id" BIGINT REFERENCES "user"("id") NOT NULL,
    "pharmacy_dep_id" BIGINT REFERENCES "pharmacy_department"("id") NOT NULL,
    "is_complete" BOOLEAN NOT NULL
);
CREATE TABLE "sale_medicine"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "sale_id" BIGINT REFERENCES "sale"("id") NOT NULL,
    "medicine_id" BIGINT REFERENCES "medicine"("id") NOT NULL
);
CREATE TABLE "supplier_delivery"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "pharmacy_dep_id" BIGINT REFERENCES "pharmacy_department"("id") NOT NULL,
    "supplier_id" BIGINT REFERENCES "supplier"("id") NOT NULL,
    "date" DATE NULL
);
CREATE TABLE "category_medicine"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "category_id" BIGINT REFERENCES "category"("id") NOT NULL,
    "medicine_id" BIGINT REFERENCES "medicine"("id") NOT NULL
);
CREATE TABLE "log"(
    "id" BIGINT PRIMARY KEY NOT NULL,
    "user_id" BIGINT REFERENCES "user"("id") NOT NULL,
    "date" DATE NOT NULL,
    "action" VARCHAR(255) NOT NULL
);
