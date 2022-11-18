--CREATE HOST TABLE

SELECT DISTINCT "Listings2".host_id  as id,
"Listings2".host_url as url, 
"Listings2".host_name as name, 
"Listings2".host_since as since, 
"Listings2".host_location as location, 
"Listings2".host_about as about,
"Listings2".host_response_time as response_time ,
"Listings2".host_response_rate as response_rate, 
"Listings2".host_acceptance_rate as acceptance_rate,
"Listings2".host_is_superhost as is_superhost,
"Listings2".host_thumbnail_url as thumbnail_url, 
"Listings2".host_picture_url as picture_url , 
"Listings2".host_neighbourhood as neighbourhood, 
"Listings2".host_listings_count as listings_count,
"Listings2".host_total_listings_count as total_listings_count, 
"Listings2".host_verifications as verifications, 
"Listings2".host_has_profile_pic as has_profile_pic, 
"Listings2".host_identity_verified as identity_verified,
"Listings2".calculated_host_listings_count  INTO "Host"
FROM "Listings2";


--DROP THE COPIES FROM LISTINGS2

ALTER TABLE "Listings2" 
DROP host_url, 
DROP host_name, 
DROP host_since, 
DROP host_location,
DROP host_about,
DROP host_response_time,
DROP host_response_rate,
DROP host_acceptance_rate, 
DROP host_is_superhost,
DROP host_thumbnail_url,
DROP  host_picture_url,
DROP  host_neighbourhood,
DROP host_listings_count,
DROP host_total_listings_count, 
DROP host_verifications, 
DROP host_has_profile_pic, 
DROP host_identity_verified,
DROP calculated_host_listings_count;


--SET PRIMARY KEY ON HOST

ALTER TABLE "Host" ADD PRIMARY KEY(id);

--SET FOREIGN KEY ON LISTINGS2 BY REFERENCING THE ID COLUMN ON HOST

ALTER TABLE "Listings2" ADD FOREIGN KEY (host_id) REFERENCES "Host" (id);