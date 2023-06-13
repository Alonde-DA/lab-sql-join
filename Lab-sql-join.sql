-- List the number of films per category

select count(title) as total_movies, category_id
from film
join film_category
on film.film_id = film_category.film_id
group by category_id;

-- Display the first and the last names, as well as the address, of each staff member

select staff.first_name, staff.last_name, address.address
from staff
join address
on staff.address_id = address.address_id;

-- Display the total amount rung up by each staff member in August 2005

select sum(amount), staff.last_name, staff.first_name, staff.staff_id
from payment
join staff
on staff.staff_id = payment.staff_id
where MONTH(payment_date) = 8 AND YEAR(payment_date) = 2005
group by staff.staff_id;

-- List all films and the number of actors who are listed for each film

select count(film_actor.actor_id) as total_actors, title, film.film_id
from film
join film_actor
on film_actor.film_id = film.film_id
group by film_id
order by film_id;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names

select sum(amount) as total_paid, last_name, customer.customer_id
from customer
join payment
on payment.customer_id = customer.customer_id
group by customer_id
order by last_name;
