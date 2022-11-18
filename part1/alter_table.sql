alter table "Geolocation" 
add FOREIGN KEY (properties_neighbourhood) REFERENCES "Neighbourhoods"(neighbourhood);

alter table "Reviews" 
add FOREIGN KEY (listing_id) REFERENCES "Listings" (id);

alter table "Calendar"
add FOREIGN KEY (listing_id) REFERENCES "Listings"(id);

alter table "Listings"
add FOREIGN KEY (neighbourhood_cleansed) REFERENCES "Neighbourhoods"(neighbourhood);

alter table "Listings_summary"
add FOREIGN KEY(id) REFERENCES "Listings"(id);

alter table "Reviews_summary"
add FOREIGN KEY (listing_id) REFERENCES "Listings"(id);