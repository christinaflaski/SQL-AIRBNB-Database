--CREATE LOCATION TABLE

SELECT distinct "Listings2".id AS listing_id,
"Listings2".street, 
"Listings2".neighbourhood, 
"Listings2".neighbourhood_cleansed, 
"Listings2".city, 
"Listings2".state,
"Listings2".zipcode, 
"Listings2".market, 
"Listings2".smart_location, 
"Listings2".country_code, 
"Listings2".country, 
"Listings2".latitude, 
"Listings2".longitude,
"Listings2".is_location_exact INTO "Location"
FROM "Listings2";

--DROP THE FOREIGN KEY BETWEEN NEIGHBOURHOOD2 AND LISTINGS2

ALTER TABLE "Listings2" DROP CONSTRAINT "Listings2_neighbourhood_cleansed_fkey";

--DROP THE COPIES FROM LISTINGS2

ALTER TABLE "Listings2"
DROP  street,
DROP  neighbourhood,
DROP  neighbourhood_cleansed,
DROP  city,
DROP  state,
DROP zipcode,
DROP  market,
DROP  smart_location,
DROP  country_code,
DROP  country,
DROP  latitude,
DROP  longitude,
DROP  is_location_exact;

--SET FOREIGN KEY THE LISTING_ID

ALTER TABLE "Location" ADD FOREIGN KEY (listing_id) REFERENCES "Listings2" (id);

--CONNECT THE LOCATION TABLE WITH THE NEIGHBOURHOOD2 TABLE

ALTER TABLE "Location" ADD FOREIGN KEY (neighbourhood_cleansed) 
REFERENCES "Neighbourhoods"(neighbourhood);