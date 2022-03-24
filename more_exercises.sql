use sakila;

/* 1. SELECT statements */
/* a. Select all columns from the actor table. */
select * from actor;
/* b. Select only the last_name column from the actor table. */
select last_name from actor;
/* c. Select only the film_id, title, and release_year columns from the film table. */
select film_id, title, release_year from film;

/* 2. DISTINCT operator */
/* a. Select all distinct (different) last names from the actor table. */
select distinct last_name from actor;
/* b. Select all distinct (different) postal codes from the address table. */
select distinct postal_code from address;
/* c. Select all distinct (different) ratings from the film table. */
select distinct rating from film;

/* 3. WHERE clause */
/* a. Select the title, description, rating, movie length columns from the films table that last 3 hours or longer. */
select title, description, rating, length from film
where length/60 > 3;
/* b. Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005. */
select payment_id, amount, payment_date from payment
where payment_date >= '2005-05-27';
/* c. Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005. */
select payment_id, amount, payment_date from payment
where payment_date like '2005-05-27%';
/* d. Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N. */
select * from customer
where last_name like 's%' and first_name like '%n';
/* e. Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M". */
select * from customer
where active = 0 or last_name like 'm%';
/* f. Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T. */
select * from category
where category_id > 4 and name like 'c%' or name like 's%' or name like 't%';
/* g. Select all columns minus the password column from the staff table for rows that contain a password. */
select staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update from staff
where password is not null;
/* h. Select all columns minus the password column from the staff table for rows that do not contain a password. */
select staff_id, first_name, last_name, address_id, picture, email, store_id, active, username, last_update from staff
where password is null;

/* 4. IN operator */
/* a. Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java. */
select phone, district from address
where district in ('california', 'england', 'taipei', 'west java');
/* b. Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. 
(Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.) */
select payment_id, amount, payment_date from payment
where date(payment_date) in ('2005-05-25','2005-05-27','2005-05-29');
/* c. Select all columns from the film table for films rated G, PG-13 or NC-17. */
select * from film
where rating in ('g','pg-13','nc-17');

/* 5. BETWEEN operator */
/* a. Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005. */
select * from payment
where payment_date between '2005-05-25 23:59:59' and '2005-05-26 23:59:59';
/* b. Select the film_id, title, and descrition columns from the film table for films where the length of the description is between 100 and 120. */
select film_id, title, description, length(description) as length from film
where length(description) between 100 and 120;