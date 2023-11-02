--List all customers who live in Texas (use JOINS)
select * from customer
select * from address

select customer.first_name, customer.last_name, customer.address_id, address.address, address.district
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas';

--Get all payments above $6.99 with the Customer's Full Name
select * from payment
select * from customer

select customer.first_name, customer.last_name, payment.amount
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

--Show all customers names who have made payments over $175(use subqueries)
select customer.first_name, customer.last_name, payment.amount
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 175;

select *
from customer
where customer_id in (select customer_id from payment where amount > 175)

--List all customers that live in Nepal (use the city table)
select * from customer
select * from city
select * from address
select * from country

select customer.first_name, customer.last_name, country.country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on country.country_id = city.country_id
where country = 'Nepal';

--Which staff member had the most transactions?
select * from staff
select * from payment
select * from rental

select first_name, last_name, count(payment.staff_id)
from staff
inner join payment
on payment.staff_id = staff.staff_id
group by first_name, last_name
order by count(payment.staff_id)

--How many movies of each rating are there?
select * from film

select rating, count(rating) as movie_count
from film
group by rating
order by rating desc;


--Show all customers who have made a single payment above $6.99 (Use Subqueries)
select * from payment
	
select *
from customer
where customer_id in (select customer_id from payment where amount > 6.99)

--How many free rentals did our stores give away?
select * from rental
select * from payment


select sum(rental_count) from
	(select count(rental_id)as rental_count
	from payment
	where amount <= 0
	group by rental_id)sub

	
select rental_id, count(rental_id)as rental_count
	from payment
	where amount <= 0
	group by rental_id
