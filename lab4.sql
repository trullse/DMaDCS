SELECT *
FROM sale
WHERE "date" BETWEEN '2023-01-01' AND '2023-12-31'
AND is_complete = TRUE;

SELECT "name", "description", "price" FROM "medicine"
WHERE "category_id" = 2
ORDER BY "name";

SELECT "name", "description", "price" FROM "medicine"
WHERE "price" BETWEEN 200 AND 400
ORDER BY "name";

SELECT "rate", "content" FROM "feedback"
WHERE "rate" >= 6;

--------------------------------------------------------------

SELECT * FROM "sale"
WHERE "pharmacy_dep_id" IN (SELECT "pharmacy_dep_id" FROM "feedback" WHERE "rate" < 7);

SELECT "pharmacy_dep_id", AVG("rate") FROM "feedback"
WHERE pharmacy_dep_id IN (SELECT pharmacy_dep_id FROM "user"
						 WHERE "user".role_id = 2)
GROUP BY 1
ORDER BY "pharmacy_dep_id"

--------------------------------------------------------------

SELECT "user".name, COUNT(feedback.id) AS total_feedback FROM "user"
LEFT JOIN feedback ON "user".id = feedback.user_id
GROUP BY "user".name;

SELECT sale.id, sale.date, sale.user_id, medicine.name, medicine.price, SUM("price") 
OVER(PARTITION BY sale.id) AS total_price  FROM sale
INNER JOIN sale_medicine ON sale.id = sale_medicine.sale_id
INNER JOIN medicine ON sale_medicine.medicine_id = medicine.id
ORDER BY sale.id;

SELECT category.name, medicine.name FROM medicine
RIGHT JOIN category ON medicine.category_id = category.id;

-----------------------------------------------------------------

SELECT medicine.name, COUNT(*) AS total_sales
FROM sale
INNER JOIN sale_medicine ON sale.id = sale_medicine.sale_id
INNER JOIN medicine ON sale_medicine.medicine_id = medicine.id
WHERE sale.date BETWEEN '2023-10-01' AND '2023-10-05'
GROUP BY medicine.name;

SELECT user_id, rate, "content" FROM feedback
WHERE user_id = 1
UNION
SELECT user_id, rate, "content" FROM feedback
WHERE user_id = 2

----------------------------------------------------------------

SELECT medicine.name, medicine.price, COUNT(sale_medicine.medicine_id) AS "total sales",
CASE
	WHEN COUNT(sale_medicine.sale_id) = 0 THEN 'bad medicine'
	WHEN COUNT(sale_medicine.sale_id) < 3 THEN 'average medicine'
	ELSE 'good medicine'
END AS "information"
FROM medicine
LEFT JOIN sale_medicine ON medicine.id = sale_medicine.medicine_id
GROUP BY medicine.id

SELECT category.name FROM category
WHERE EXISTS
(
  SELECT 1 FROM medicine
  WHERE category_id = category.id
);


