create or replace function decrease_listings()
	returns trigger as
	$$
	begin
		update "Host" set listings_count = listings_count - 1
		from "Listing" where "Listing".id = "Host".listing_id;
		update "Host" set total_listings_count = total_listings_count - 1
		from "Listing" where "Listing".id = "Host".listing_id;
		return null;
	end;
	$$

	language plpgsql;

create trigger list_del
after delete on "Listing"
for each row
execute procedure decrease_listings();


create or replace function increase_listings()
	returns trigger as
	$$
	begin
		update "Host" set listings_count = listings_count + 1
		from "Listing" where "Listing".id = "Host".listing_id;
		update "Host" set total_listings_count = total_listings_count + 1
		from "Listing" where "Listing".id = "Host".listing_id;
		return null;
	end;
	$$

	language plpgsql;

create trigger list_ins
after insert on "Listing"
for each row
execute procedure increase_listings();

-------------------------------------------------------------------------------------
/*the custom trigger
When a new review is added into the Review table
then automaticly it will increase the number of reviews 
in the listing that the review was for*/

create or replace function inc_number_of_reviews()
	returns trigger as
	$$
	begin
		update "Listing" set number_of_reviews = number_of_reviews + 1
		from "Review" where  "Review".listing_id="Listing".id;
		return null;
	end;
	$$

	language plpgsql;

create trigger review_inc
after insert on "Review"
for each row
execute procedure inc_number_of_reviews();