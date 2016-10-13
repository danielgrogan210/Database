-- 1 --
Select name, city
from customers
where city in (
				Select city
				from	(
						select city, count(city) as numberofproducts
						from products
						group by city
						order by numberofproducts DESC
						limit 1 
						)  as mostproducts 
				) ;
-- 2 --
select name
from products
where priceUSD < 	(
					Select avg(priceUSD) as average
					from products
					)
order by name DESC;
-- 3 --
select customers.name, orders.pid, orders.totalUSD
from orders
join customers
on orders.cid = customers.cid
order by totalUSD ASC;
-- 4 --
select name, coalesce(customertotalsUSD, 0) as totalUSDpercustomer
from	(
		Select customers.name, customers.cid, sum(orders.totalUSD) as customertotalsUSD
		from orders
		full outer join customers
		on orders.cid = customers.cid
		group by customers.name, customers.cid
		order by customers.name AsC
		) as totalorder ;
-- 5 --
select distinct customers.name, products.name, agents.name
from orders
	full outer join customers
		on orders.cid = customers.cid
	full outer join agents
		on orders.aid = agents.aid
	full outer join products
		on orders.pid = products.pid
where agents.city = 'New York' ;
-- 6 --
select *
from 	(
		select 	orders.*,
				round((((100-customers.discount)/100)*(products.priceUSD*orders.qty)), 2) as actualtotalUSD
		FROM orders
		join customers
		on customers.cid = orders.cid
		join products
		on products.pid = orders.pid
		) as comparetotal
where totalUSD != actualtotalUSD;