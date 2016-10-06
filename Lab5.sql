-- 1 --
select agents.city
From agents
join orders
on  agents.aid = orders.aid
where orders.cid = 'c006' ;
-- 2 --
select distinct orders.pid
from orders
join customers
on orders.cid = customers.cid
where customers.city in ('Kyoto')
order by orders.pid Desc ;
-- 3 --
select name
from customers
where cid not in (
	select distinct cid
	from orders
) ;
-- 4 --
select customers.name
from customers
full outer join orders
on customers.cid = orders.cid
where orders.cid is null ;
-- 5 --
select distinct customers.name, agents.name
from orders
	FULL outer join customers
		on orders.cid = customers.cid
	full outer join agents
		on orders.aid = agents.aid 
where customers.city = agents.city ;
-- 6 --
select distinct customers.name, agents.name, customers.city
from customers
join agents
on customers.city = agents.city ;
-- 7 --
select customers.name, customers.city, count(products.city) as NumberOfProducts
from products
join customers
on customers.city = products.city
group by customers.name, customers.city;