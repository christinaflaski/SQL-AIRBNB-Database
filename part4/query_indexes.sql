
--QUERY 1

CREATE INDEX index2 on "Listing"(host_id);

DROP INDEX index2;

--QUERY 2

CREATE INDEX index_price on "Price"(price,guests_included,listing_id)
WHERE guests_included > 5 AND price > 40;

DROP INDEX index_price;

--QUERY 3

CREATE INDEX index_room on "Room"(accommodates,listing_id)
WHERE accommodates>8;
CREATE INDEX  index_price2 on "Price"(price,listing_id)
WHERE price<=100;

DROP INDEX index_room;
DROP INDEX index_price2;

--QUERY 4

CREATE INDEX index_host on "Host"(url,name);

DROP INDEX index_host;

--QUERY 5

CREATE  INDEX  index_listing on "Listing"(property_type)
WHERE property_type='Apartment' ;

DROP INDEX index_listing;

--QUERY 6

CREATE INDEX index_location ON "Location"(neighbourhood_cleansed,listing_id);

CREATE INDEX index_price3 ON "Price"(listing_id,price);

DROP INDEX index_price3;

DROP INDEX index_location;


--QUERY 7

CREATE INDEX index_room2 ON "Room"(listing_id,bedrooms)
WHERE bedrooms>2;

CREATE INDEX index_price4 ON "Price"(listing_id,price)
WHERE price<100;


DROP INDEX index_price4;

DROP INDEX index_room2;
