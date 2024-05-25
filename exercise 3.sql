-- How many distinct (different) actors' last names are there?
select count(distinct(last_name)) from sakila.actor

-- In how many different languages where the films originally produced? (Use the column language_id from the film table)
select count(distinct(language_id)) from sakila.film

-- How many movies were released with "PG-13" rating?
Select count(rating) from sakila.film
where rating="PG-13"

-- Get 10 the longest movies from 2006.

Select title,length from sakila.film
where release_year=2006 
order by length desc
limit 10

-- How many days has been the company operating (check DATEDIFF() function)?
select datediff(max(return_date),min(rental_date)) as company_operating_days
from sakila.rental

-- Show rental info with additional columns month and weekday. Get 20.

select *, month (rental_date) as month , weekday(rental_date) as weekday
from sakila.rental
limit 20

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select *, month (rental_date) as month , weekday(rental_date) as weekday, 
case 
	when weekday(rental_date) <5 then "weekday"
	else "weekend"
	end as day_type
from sakila.rental


-- How many rentals were in the last month of activity?
select month(max(return_date)), year(max(return_date))
from sakila.rental

select count(rental_id)
from sakila.rental
where month(rental_date)=9 and year(rental_date)=2005

-- we can see that no rental where made on the last month of operation however 62 movies where returned on the last month.(see below)

select count(rental_id)
from sakila.rental
where month(return_date)=9 and year(return_date)=2005

