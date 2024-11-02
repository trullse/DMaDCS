CREATE OR REPLACE FUNCTION price_trigger_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
BEGIN
   IF (SELECT total_price FROM sale WHERE sale.id = NEW.sale_id) IS NULL THEN
    UPDATE sale
    SET total_price = (SELECT price FROM medicine WHERE medicine.id = NEW.medicine_id)
    WHERE id = NEW.sale_id;
  ELSE
    UPDATE sale
    SET total_price = total_price + (SELECT price FROM medicine WHERE medicine.id = NEW.medicine_id)
    WHERE id = NEW.sale_id;
  END IF;
  RETURN NEW;
END;
$$

CREATE TRIGGER sale_total_price_trigger
AFTER INSERT ON sale_medicine
FOR EACH ROW
	EXECUTE FUNCTION price_trigger_function();

CREATE OR REPLACE PROCEDURE update_total_price(in_sale_id INT)
language plpgsql
AS $$
BEGIN
  DECLARE
    total_price_local FLOAT;
  BEGIN
    SELECT SUM(medicine.price)
    INTO total_price_local
    FROM sale_medicine
    INNER JOIN medicine ON medicine.id = sale_medicine.medicine_id
    WHERE sale_medicine.sale_id = in_sale_id;

    UPDATE sale
    SET total_price = total_price_local
    WHERE id = in_sale_id;
  END;
END; $$


INSERT INTO "sale" ("id", "date", "user_id", "pharmacy_dep_id", "is_complete") VALUES
(11, '2023-12-06', 4, 4, true);

INSERT INTO "sale" ("id", "date", "user_id", "pharmacy_dep_id", "is_complete") VALUES
(12, '2023-12-06', 5, 2, true);

INSERT INTO "sale_medicine" ("id", "sale_id", "medicine_id") VALUES
(17, 11, 3);

INSERT INTO "sale_medicine" ("id", "sale_id", "medicine_id") VALUES
(18, 11, 2);

CREATE OR REPLACE FUNCTION log_function() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
DECLARE
  message text := TG_ARGV[0]::text;
BEGIN
  INSERT INTO log (user_id, date, action)
  VALUES (NEW.user_id, NOW(), message);
  RETURN NEW;
END;
$$

CREATE OR REPLACE FUNCTION log_function_no_user() 
   RETURNS TRIGGER 
   LANGUAGE PLPGSQL
AS $$
DECLARE
  message text := TG_ARGV[0]::text;
BEGIN
  INSERT INTO log (user_id, date, action)
  VALUES (null, NOW(), message);
  RETURN NEW;
END;
$$

CREATE TRIGGER sale_after_insert
AFTER INSERT ON sale
FOR EACH ROW
	EXECUTE FUNCTION log_function('Добавлена новая продажа');
	
CREATE TRIGGER sale_medicine_after_insert
AFTER INSERT ON sale_medicine
FOR EACH ROW
	EXECUTE FUNCTION log_function_no_user('Добавлен новый товар в продажу');
	
CREATE TRIGGER category_after_insert
AFTER INSERT ON category
FOR EACH ROW
	EXECUTE FUNCTION log_function_no_user('Добавлена новая категория');

CREATE TRIGGER feedback_after_insert
AFTER INSERT ON feedback
FOR EACH ROW
	EXECUTE FUNCTION log_function('Добавлена новый отзыв');
	
CREATE TRIGGER medicine_after_insert
AFTER INSERT ON medicine
FOR EACH ROW
	EXECUTE FUNCTION log_function_no_user('Добавлено новое лекарство');


CREATE OR REPLACE FUNCTION get_average_sale_cost() RETURNS table(address VARCHAR(255), avearage_sum numeric)
language plpgsql
AS $$
BEGIN
	RETURN QUERY
	SELECT pharmacy_department.address AS adress, 
		AVG(sale.total_price) AS average_sale_price
	FROM pharmacy_department
	INNER JOIN sale ON pharmacy_department.id = sale.pharmacy_dep_id
	GROUP BY pharmacy_department.address;
END;
$$
		
CREATE OR REPLACE PROCEDURE insert_sale("new_date" DATE, "new_user_id" BIGINT, "new_pharmacy_dep_id" BIGINT, "new_is_complete" BOOLEAN)
language sql
AS $$
INSERT INTO sale ("date", "user_id", "pharmacy_dep_id", "is_complete", "total_price") 
VALUES ("new_date", "new_user_id", "new_pharmacy_dep_id", "new_is_complete", 0);
$$

CREATE OR REPLACE PROCEDURE insert_sale_medicine("new_sale_id" BIGINT, "new_medicine_id" BIGINT)
language sql
AS $$
INSERT INTO sale_medicine ("sale_id", "medicine_id") 
VALUES ("new_sale_id", "new_medicine_id");
$$

CALL insert_sale_medicine(13, 3)
CALL insert_sale('2023-12-19', 1, 3, false)






