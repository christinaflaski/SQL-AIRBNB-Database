--CREATE THE TABLE PRICE

SELECT distinct "Listings2".id AS listing_id, "Listings2".price, "Listings2".weekly_price, "Listings2".monthly_price, 
"Listings2".security_deposit, "Listings2".cleaning_fee,
"Listings2".guests_included, "Listings2".extra_people, "Listings2".minimum_nights, "Listings2".maximum_nights,
"Listings2".minimum_minimum_nights, "Listings2".maximum_minimum_nights, "Listings2".minimum_maximum_nights,
"Listings2".maximum_maximum_nights, "Listings2".minimum_nights_avg_ntm, "Listings2".maximum_nights_avg_ntm INTO "Price"
FROM "Listings2";


--DROP THE COPIES FROM LISTINGS2

 ALTER TABLE "Listings2" 
drop cleaning_fee,
drop guests_included, 
drop extra_people, 
drop minimum_nights, 
drop maximum_nights,
drop minimum_minimum_nights, 
drop maximum_minimum_nights,
drop minimum_maximum_nights,
drop maximum_maximum_nights, 
drop minimum_nights_avg_ntm, 
drop maximum_nights_avg_ntm

--SET FOREIGN KEY THE LISTING_ID

ALTER TABLE "Price" ADD FOREIGN KEY (listing_id) REFERENCES "Listings2" (id);

--REPLACE THE '$' ','
 
UPDATE  "Price"
SET 
price = REPLACE(price,'$',''),
weekly_price = REPLACE(weekly_price,'$',''),
monthly_price = REPLACE(monthly_price,'$',''),
security_deposit = REPLACE(security_deposit,'$',''),
extra_people = REPLACE(price,'$',''),
cleaning_fee = REPLACE(cleaning_fee,'$','');

UPDATE  "Price"
SET 
price = REPLACE(price,',',''),
weekly_price = REPLACE(weekly_price,',',''),
monthly_price = REPLACE(monthly_price,',',''),
security_deposit = REPLACE(security_deposit,',',''),
extra_people = REPLACE(price,',',''),
cleaning_fee = REPLACE(cleaning_fee,',','');

--SET THE TYPE AS NUMERIC

ALTER TABLE "Price"
ALTER COLUMN price TYPE numeric(10,2) USING price::numeric,
ALTER COLUMN weekly_price TYPE numeric(10,2) USING weekly_price::numeric,
ALTER COLUMN monthly_price TYPE numeric(10,2) USING monthly_price::numeric,
ALTER COLUMN security_deposit TYPE numeric(10,2) USING security_deposit::numeric,
ALTER COLUMN cleaning_fee TYPE numeric(10,2) USING cleaning_fee::numeric,
ALTER COLUMN extra_people TYPE numeric(10,2) USING extra_people::numeric,
ALTER COLUMN minimum_nights_avg_ntm TYPE numeric(10,2) USING minimum_nights_avg_ntm::numeric,
ALTER COLUMN maximum_nights_avg_ntm TYPE numeric(10,2) USING maximum_nights_avg_ntm::numeric;