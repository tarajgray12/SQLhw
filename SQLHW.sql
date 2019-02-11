use sakila;

select * from actor;

select concat(first_name, ' ', last_name) as 'Actor Name'
from actor;

select * from actor
where first_name = 'JOE';

select * from actor
where last_name like '%GEN%';

select * from actor
where last_name like '%LI%' order by last_name;

select * from country
where country in ('Afghanistan', 'Bangladesh', 'China');

ALTER TABLE actor
ADD description blob;

alter table actor
drop description;

select last_name, count(last_name)
from actor
group by last_name;

select last_name, count(*)
from actor
group by last_name having count(*) > 1;

update actor
set first_name = 'HARPO'
where first_name = 'GROUCHO' and last_name = 'WILLIAMS';

update actor
set first_name = 'GROUCHO'
where first_name = 'HARPO';

SHOW CREATE TABLE address;

select staff.first_name, staff.last_name, address.address
from staff
join address
on staff.address_id=address.address_id;

#6b
#select payment.staff_id, 

select film.title, count(film_actor.actor_id)
from film_actor
inner join film
on film_actor.film_id = film.film_id
group by film.title;

SELECT count(inventory_id) as 'number of copies'
  FROM inventory
  WHERE film_id
      in(
      SELECT film_id
      FROM film
      WHERE title = 'HUNCHBACK IMPOSSIBLE');
select customer.last_name, sum(payment.amount)
from payment
join customer
on payment.customer_id = customer.customer_id
group by payment.customer_id
order by customer.last_name;