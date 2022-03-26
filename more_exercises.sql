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
/* b. Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, 
and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.) */
select payment_id, amount, payment_date from payment
where date(payment_date) in ('2005-05-25','2005-05-27','2005-05-29');
/* c. Select all columns from the film table for films rated G, PG-13 or NC-17. */
select * from film
where rating in ('g','pg-13','nc-17');

/* 5. BETWEEN operator */
/* a. Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before 
midnight 05/26/2005. */
select * from payment
where payment_date between '2005-05-25 23:59:59' and '2005-05-26 23:59:59';
/* b. Select the film_id, title, and descrition columns from the film table for films where the length of the description 
is between 100 and 120. */
select film_id, title, description, length(description) as length from film
where length(description) between 100 and 120;

/* LIKE operator */
/* a. Select the following columns from the film table for rows where the description begins with "A Thoughtful". */
select * from film
where description like 'a thoughtful%';
/* b. Select the following columns from the film table for rows where the description ends with the word "Boat". */
select * from film
where description like '%boat';
/* c. Select the following columns from the film table where the description contains the word "Database" and the 
length of the film is greater than 3 hours. */
select * from film
where description like '%database%';

/* 7. LIMIT operator */
/* a. Select all columns from the payment table and only include the first 20 rows. */
select * from payment
limit 20;
/* b. Select the payment date and amount columns from the payment table for rows where 
the payment amount is greater than 5, and only select rows whose zero-based index in the result set is between 1000-2000. */
select payment_id, payment_date, amount from payment
where amount > 5 and payment_id between 1000 and 2000;
/* c. Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200. */
select * from customer
where customer_id between 101 and 200;

/* 8. ORDER BY statement */
/* a. Select all columns from the film table and order rows by the length field in ascending order. */
select * from film
order by length;
/* b. Select all distinct ratings from the film table ordered by rating in descending order. */
select distinct rating from film
order by rating desc;
/* c. Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order. */
select payment_date, amount from payment
order by amount desc
limit 20;
/* d. Select the title, description, special features, length, and rental duration columns from the film table for the first 10 films with behind the 
scenes footage under 2 hours in length and a rental duration between 5 and 7 days, ordered by length in descending order. */
select title, description, special_features, length, rental_duration from film
where length < 120 and rental_duration between 5 and 7
order by length desc
limit 10;

/* 9. JOINs */
/* a. Select customer first_name/last_name and actor first_name/last_name columns from performing a left join between the customer and actor column 
on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
Label customer first_name/last_name columns as customer_first_name/customer_last_name
Label actor first_name/last_name columns in a similar fashion.
returns correct number of records: 620 */
select c.first_name as customer_first_name, c.last_name as customer_last_name, a.first_name as actor_first_name, a.last_name as actor_last_name from customer as c
left join actor as a on c.last_name = a.last_name;
/* b. Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join between the customer and 
actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
returns correct number of records: 200 */
select c.first_name as customer_first_name, c.last_name as customer_last_name, a.first_name as actor_first_name, a.last_name as actor_last_name from customer as c
right join actor as a on c.last_name = a.last_name;
/* c. Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join between the customer and actor column 
on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
returns correct number of records: 43 */
select c.first_name as customer_first_name, c.last_name as customer_last_name, a.first_name as actor_first_name, a.last_name as actor_last_name from customer as c
inner join actor as a on c.last_name = a.last_name;
/* d. Select the city name and country name columns from the city table, performing a left join with the country table to get the country name column.
Returns correct records: 600 */
select ci.city, co.country from city as ci
left join country as co on ci.country_id = co.country_id;
/* e. Select the title, description, release year, and language name columns from the film table, performing a left join with the language table 
to get the "language" column. Label the language.name column as "language"
Returns 1000 rows */
select f.title, f.description, f.release_year, l.name from film as f
left join language as l on f.language_id = l.language_id;
/* f. Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table, 
performing 2 left joins with the address table then the city table to get the address and city related columns.
returns correct number of rows: 2 */
select s.first_name, s.last_name, a.address, c.city, a.district, a.postal_code from staff as s
left join address as a on s.address_id = a.address_id
left join city as c on a.city_id = c.city_id;

/* ADDITIONAL EXERCISES */
/* 1. Display the first and last names in all lowercase of all the actors. */
select lower(first_name) as first_name, lower(last_name) as last_name from actor;
/* 2. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." 
What is one query would you could use to obtain this information? */
select actor_id, first_name, last_name from actor
where first_name = 'joe';
/* 3. Find all actors whose last name contain the letters "gen": */
select first_name, last_name from actor
where last_name like '%gen%';
/* 4. Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order. */
select first_name, last_name from actor
where last_name like '%li%'
order by last_name, first_name;
/* 5. Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China: */
select country_id, country from country
where country in ('Afghanistan', 'Bangladesh', 'China');
/* 6. List the last names of all the actors, as well as how many actors have that last name. */
select distinct(last_name), count((last_name)) from actor
group by last_name;
/* 7. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors */
select last_name, count(*) from actor
group by last_name
having count(*) > 1;
/* 8. You cannot locate the schema of the address table. Which query would you use to re-create it? */

/* 9. Use JOIN to display the first and last names, as well as the address, of each staff member. */
select s.first_name, s.last_name, a.address from staff as s
join address as a on s.address_id = a.address_id;
/* 10. Use JOIN to display the total amount rung up by each staff member in August of 2005. */
select s.staff_id, sum(p.amount) as amount from staff as s
join payment as p on s.staff_id = p.staff_id
group by staff_id;
/* 11. List each film and the number of actors who are listed for that film. */
select f.title, count(fa.actor_id) as actor_count from film as f
join film_actor as fa on f.film_id = fa.film_id
group by title;

select * from film
where title = 'baked cleopatra';

select * from film_actor
where film_id = 50;

select * from actor
where actor_id = 70;
/* 12. How many copies of the film Hunchback Impossible exist in the inventory system? */
select f.title, count(i.film_id) from film as f
join inventory as i on f.film_id = i.film_id
group by i.film_id
having title = 'Hunchback Impossible';
/* 13. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q 
have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English. */
select title from film
where title like 'q%' or title like 'k%';
/* 14. Use subqueries to display all actors who appear in the film Alone Trip. */
select f.title, a.first_name, a.last_name from film as f
join film_actor as fa on f.film_id = fa.film_id
join actor as a on fa.actor_id = a.actor_id
where title in (select title from film
where title = 'Alone Trip');
/* 15. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. */
select c.first_name, c.last_name, c.email, co.country from customer as c
join address as a on c.address_id = a.address_id
join city as ci on a.city_id = ci.city_id
join country as co on ci.country_id = co.country_id
where country = 'canada';
/* 16. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films. */
select f.title, c.name from film as f
join film_category as fc on f.film_id = fc.film_id
join category as c on fc.category_id = c.category_id
where name = 'family';
/* 17. Write a query to display how much business, in dollars, each store brought in. */
select s.store_id, sum(p.amount) as dollars from store as s
join staff as st on s.store_id = st.store_id
join payment as p on st.staff_id = p.staff_id
group by store_id;
/* 18. Write a query to display for each store its store ID, city, and country. */
select s.store_id, c.city, co.country from store as s
join address as a on s.address_id = a.address_id
join city as c on a.city_id = c.city_id
join country as co on c.country_id = co.country_id;
/* 19. List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, 
inventory, payment, and rental.) */
select cat.name, sum(p.amount) as gross_revenue from rental as r
join payment as p on r.rental_id = p.rental_id
join inventory as i on r.inventory_id = i.inventory_id
join film_category as f on i.film_id = f.film_id
join category as cat on f.category_id = cat.category_id
group by cat.name
order by gross_revenue desc
limit 5;