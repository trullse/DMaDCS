# DMaDCS
Database models and database control systems labs

## Functional requirements
* User authorithation
* Role system (user, admin)
* Logging user actions
### For unathorised user:
* watching medicines list
* wathcing medicines categories
### For authorised user:
* Sale management
* Add feedback
### For admin:
* User management
* Medicine management
* Medicine category management
* Supplier management
* Department management
* Feedback management

## Entities
### user
<pre>
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "surname" VARCHAR(255) NOT NULL,
    "birth_date" DATE NOT NULL,
    "role_id" BIGINT NOT NULL -> role,
    "pharmacy_dep_id" BIGINT NULL -> pharmacy_department
</pre>
### role
<pre>
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL
</pre>
### pharmacy_department
<pre>
    "id" BIGINT NOT NULL,
    "address" VARCHAR(255) NOT NULL
</pre>
### feedback
<pre>
    "id" BIGINT PRIMARY KEY NOT NULL,
    "user_id" BIGINT NOT NULL -> user,
    "rate" INTEGER NOT NULL,
    "content" VARCHAR(255) NULL,
    "pharmacy_dep_id" BIGINT NOT NULL -> pharmacy_department
</pre>
### supplier
<pre>
    "id" BIGINT PRIMARY KEY NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "address" VARCHAR(255) NOT NULL
</pre>
### supplier_delivery
<pre>
    "id" BIGINT PRIMARY KEY NOT NULL,
    "pharmacy_dep_id" BIGINT NOT NULL -> pharmacy_department,
    "supplier_id" BIGINT NOT NULL -> supplier,
    "date" DATE NULL
</pre>
### category
<pre>
    "id" BIGINT NOT NULL,
    "name" VARCHAR(255) NOT NULL
</pre>
### medicine
<pre>
    "id" BIGINT PRIMARY KEY NOT NULL,
    "name" BIGINT NOT NULL,
    "description" BIGINT NOT NULL,
    "supplier_id" BIGINT NOT NULL -> supplier
</pre>
### sale
<pre>
    "id" BIGINT PRIMARY KEY NOT NULL,
    "date" DATE NOT NULL,
    "pharmacy_dep_id" BIGINT NOT NULL -> pharmacy_department,
    "cashier_id" BIGINT NOT NULL -> user
</pre>
### Log
<pre>
    "id" BIGINT PRIMARY KEY NOT NULL,
    "user_id" BIGINT NOT NULL,
    "date" DATE NOT NULL,
    "action" VARCHAR(255) NOT NULL
</pre>

## Block-scheme

![drawSQL-pharmacy-export-2023-09-25 (1)](https://github.com/trullse/DMaDCS/assets/93009588/2e86ee50-1985-4e4c-8d70-4713cc628bd8)
