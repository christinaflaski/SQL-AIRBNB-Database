--CREATE ROOM TABLE

SELECT DISTINCT "Listings2".id as listing_id, "Listings2".accommodates, 
"Listings2".bathrooms, "Listings2".bedrooms, "Listings2".beds, "Listings2".bed_type, 
"Listings2".amenities, "Listings2".square_feet, "Listings2".price, "Listings2".weekly_price, 
"Listings2".monthly_price, "Listings2".security_deposit INTO "Room"
FROM "Listings2";

--DROP THE COPIES FROM LISTINGS2

ALTER TABLE "Listings2"
DROP accommodates,
DROP bathrooms, 
DROP bedrooms, 
DROP beds, 
DROP bed_type,
DROP amenities, 
DROP square_feet, 
DROP price, 
DROP weekly_price, 
DROP monthly_price, 
DROP security_deposit;

--SET FOREIGN KEY ON LISTINGS2 BY REFERENCING THE ID COLUMN ON ROOM

ALTER TABLE "Room" ADD FOREIGN KEY (listing_id) REFERENCES "Listings2" (id);