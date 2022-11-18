create table Reviews(
   listing_id int,
   id int,
   date date,
   reviewer_id int,
   reviewer_name varchar(100),
   comments text,
   Primary Key(id)
);