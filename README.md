# DMaDCS
Database models and database control systems labs

## Functional requirements
* User authorithation
* Role system (client, employee)
* Logging user actions
### For unathorised user:
* watching medicines list
* wathcing medicines categories
### For authorised user:
* Make an order
* Add feedback
### For employee:
* Medicine management
* Medicine category management
* Supplier_delivery management
* Sale management

## Entities
### user
<pre>
    "id" BIGINT PRIMARY KEY NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "surname" VARCHAR(255) NOT NULL,
    "birth_date" DATE NOT NULL,
    "role_id" BIGINT NOT NULL -> role,
    "pharmacy_dep_id" BIGINT NULL -> pharmacy_department,
    "login" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL
</pre>
### role
<pre>
    "id" BIGINT PRIMARY KEY NOT NULL,
    "name" VARCHAR(255) NOT NULL
</pre>
### pharmacy_department
<pre>
    "id" BIGINT PRIMARY KEY NOT NULL,
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
    "user_id" BIGINT NOT NULL -> user
</pre>
### Log
<pre>
    "id" BIGINT PRIMARY KEY NOT NULL,
    "user_id" BIGINT NOT NULL,
    "date" DATE NOT NULL,
    "action" VARCHAR(255) NOT NULL
</pre>

## Block-scheme
![final](https://github.com/trullse/DMaDCS/assets/93009588/3f6fe8a2-42ac-4432-9936-3413aa21da59)


