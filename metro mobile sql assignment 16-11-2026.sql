use metro_mobiles ;

-- 1. Show everything stored in the phones table.
select * from phones ;

-- 2. The owner has some changes. After each one, show the table to check the result:
-- • The price of the Redmi Note 12 is now 14999.00.
update phones set price = 14999.00 where model = 'note 12' ;

-- • The stock of the Vivo Y28 is now 20.
update phones set stock = 20 where phone_id = 4 ;

-- • The Oppo A58 has a new price of 13999.00 and new stock of 15. Change both in one command.
update phones set price = 13999.00 , stock =15 where phone_id = 5;

-- • Increase the price of every phone by 500.
update phones set price = price + 500 ;

-- 3. The Vivo Y28 has been discontinued. Remove it from the table and show the table.
delete from phones where phone_id = 4;
select *from phones;

-- 4. The shop has stopped selling Oppo phones. Remove all Oppo phones and show the table.
DELETE FROM phones
WHERE brand = 'Oppo';

SELECT * FROM phones;
-- 5. Remove all rows from old_stock in a way that is fast and keeps the table. Show the table and
-- check its structure to confirm it still exists.
TRUNCATE TABLE old_stock;
SELECT * FROM old_stock;
DESCRIBE old_stock;

-- 6. Remove all rows from temp_list in a way that would also let you choose which rows to remove. Show the table and check its structure.
DELETE FROM temp_list;
SELECT * FROM temp_list;
DESCRIBE temp_list;

-- 7. Remove the temp_list table completely. Then try to show its data and write down the error you get.
DROP TABLE temp_list;
SELECT * FROM temp_list;
-- 8. At the end of your file, write one line each as comments on how DELETE, TRUNCATE andDROP are different.
-- DELETE: Removes selected or all rows from a table using WHERE conditions.
-- TRUNCATE: Removes all rows quickly but keeps the table structure.
-- DROP: Completely deletes the table, including its structure and data.
