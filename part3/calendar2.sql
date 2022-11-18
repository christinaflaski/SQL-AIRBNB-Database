--REPLACE THE ',' '$'

UPDATE  "Calendar2"
SET 
price = REPLACE(price,'$',''),
adjusted_price = REPLACE(adjusted_price,'$','');

UPDATE  "Calendar2"
SET 
adjusted_price = REPLACE(adjusted_price,',',''),
price = REPLACE(price,',','');

--SET THE TYPE AS NUMERIC

ALTER TABLE "Calendar2"
ALTER COLUMN price TYPE numeric(10,2) USING price::numeric,
ALTER COLUMN adjusted_price TYPE numeric(10,2) USING adjusted_price::numeric;

--onomasame to arxeio calendar2 epeidh yparxei hdh to calendar arxeio apo prohgoymenh ergasia