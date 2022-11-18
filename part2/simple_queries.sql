/*List all the AIRBNB houses that have from 2 to 6 beds, 2 bedrooms and 2 bathrooms*/

SELECT "Listings".beds ,"Listings".name ,"Listings".listing_url
FROM "Listings"
WHERE  ("Listings".beds BETWEEN 2 AND 6) AND ("Listings".bedrooms = 2) AND ("Listings".bathrooms='2.0')
ORDER BY "Listings".beds;

--rows:451


/*Show the url for the AIRBNB house and the comment for every review that contains the word clean since 2019, show more recent first*/

SELECT "Reviews".comments ,"Reviews".date,"Listings".listing_url
FROM "Reviews"
INNER JOIN "Listings" ON "Listings".id = "Reviews".listing_id
WHERE  "Reviews".comments like '%clean%' and "Reviews".date >= '2019-01-01'
ORDER BY "Reviews".date DESC;

--rows:42.489

/*Find how many AIRBNB houses in every neighbourhood have 1 minimum night and are available */

SELECT COUNT("Neighbourhoods".neighbourhood),"Neighbourhoods".neighbourhood
FROM "Neighbourhoods"
INNER JOIN "Listings"
ON "Listings".neighbourhood_cleansed = "Neighbourhoods".neighbourhood
WHERE "Listings".minimum_nights=1 AND "Listings".has_availability=true
GROUP BY "Neighbourhoods".neighbourhood;

--rows:44

/*Find all the AIRBNB houses that a couple can rent for more than a week with only one bedroom */

SELECT "Listings".id, "Listings".maximum_nights, "Listings".listing_url
FROM "Listings"
WHERE  "Listings".maximum_nights >= 7 AND "Listings".accommodates =2 
ORDER BY "Listings".maximum_nights;


--rows:2257

/*Show the comments of the AIRBNB houses that the price is 20$ and can stay more than 4 people*/

SELECT "Reviews".comments, "Listings".listing_url, "Listings".price
FROM "Reviews" 
INNER JOIN "Listings"
ON "Listings".id= "Reviews".listing_id
WHERE "Listings".price LIKE '$20.00' AND "Listings".accommodates>4;


--rows:512

/*Show how many AIRBNB houses in each neighbourhood have in their amenities both kitchen and Wifi*/

SELECT COUNT("Neighbourhoods".neighbourhood),"Neighbourhoods".neighbourhood
from "Neighbourhoods" INNER JOIN "Listings"
ON "Listings".neighbourhood_cleansed = "Neighbourhoods".neighbourhood
WHERE "Listings".amenities like '%kitchen%' AND "Listings".amenities like '%Wifi%'
GROUP BY "Neighbourhoods".neighbourhood
ORDER BY COUNT("Neighbourhoods".neighbourhood);

--rows:34

/*Show the average price in each neighbourhood*/

SELECT "Neighbourhoods".neighbourhood,ROUND(AVG("Listings_summary".price)) AS AVERAGE_PRICE_PER_NEIGHBOURHOOD
FROM "Neighbourhoods" INNER JOIN "Listings_summary"
ON "Listings_summary".neighbourhood = "Neighbourhoods".neighbourhood
GROUP BY "Neighbourhoods".neighbourhood
ORDER BY AVG("Listings_summary".price);


--rows:45

/*Find all the AIRBNB houses that are located in Acropolis and show some important information about them, ordered by price*/

SELECT "Listings".price,  "Listings".name, "Listings".listing_url, "Listings".description
FROM "Listings" LEFT OUTER JOIN "Geolocation"
ON "Geolocation".properties_neighbourhood = "Listings".neighbourhood_cleansed
WHERE "Geolocation".properties_neighbourhood LIKE '%¡ —œ–œÀ«%'
ORDER BY round(TRANSLATE("Listings".price, ',$', '')::numeric);

--rows:386

/*Find the top 100 cheapest AIRBNB houses(without removing the limit)*/

SELECT DISTINCT "Calendar".listing_id, "Listings".listing_url, MIN(TRANSLATE("Calendar".price, ',$', '')::numeric) AS MIN_PRICE ,MAX(TRANSLATE("Calendar".price, ',$', '')::numeric) AS MAX_PRICE
FROM "Calendar" FULL OUTER JOIN "Listings"
ON "Listings".id="Calendar".listing_id
GROUP BY "Calendar".listing_id, "Listings".listing_url
ORDER BY MIN(TRANSLATE("Calendar".price, ',$', '')::numeric), MAX(TRANSLATE("Calendar".price, ',$', '')::numeric)
LIMIT 100;

--rows:100
--rows:11541 if we remove the limit 100

/*Show the average rating of every neighbourhood, if a neighbourhood is not included means there are not any ratings*/

SELECT "Neighbourhoods".neighbourhood, ROUND(AVG("Listings".review_scores_rating::numeric)) AS RATING
FROM "Neighbourhoods" INNER JOIN "Listings"
ON "Listings".neighbourhood_cleansed = "Neighbourhoods".neighbourhood
WHERE "Listings".review_scores_rating IS NOT NULL
GROUP BY "Neighbourhoods".neighbourhood
ORDER BY RATING DESC;


--rows:44

/*Find AIRBNB houses in the range of the neighbourhoods "–œÀ’√ŸÕœ-√ ’∆…- ’ÿ≈À«" with monthly price and are available*/

SELECT "Listings".listing_url, "Listings".neighbourhood_cleansed, TRANSLATE("Listings".monthly_price ,',$', '')::numeric AS monthly_price
FROM "Listings"
WHERE ("Listings".neighbourhood_cleansed LIKE '–œÀ’√ŸÕœ' OR "Listings".neighbourhood_cleansed LIKE '√ ’∆…'OR "Listings".neighbourhood_cleansed LIKE ' ’ÿ≈À«') AND monthly_price IS NOT NULL AND "Listings".has_availability=true
ORDER BY monthly_price ;


--rows:18

/*Show the names of the hosts who are also reviewers*/

SELECT DISTINCT "Listings".host_id, "Listings".host_name
FROM "Listings"
INNER JOIN "Reviews" ON "Reviews".reviewer_id="Listings".host_id
WHERE "Reviews".reviewer_id="Listings".host_id
ORDER BY "Listings".host_name;


--rows:469