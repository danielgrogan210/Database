-- Lab 4 --
-- Dan Grogan --

-- 1 --
SELECT city
FROM agents
WHERE aid IN (
	SELECT aid
	FROM orders
	WHERE cid = 'c006'
) ;

-- 2 --
SELECT DISTINCT pid
FROM orders
WHERE aid IN (
	SELECT aid
	FROM orders
	WHERE cid IN (
		SELECT cid
		FROM customers
		WHERE city = 'Kyoto'
	)
)
ORDER BY pid DESC ;

-- 3 --
SELECT cid, name
FROM customers
WHERE cid NOT IN (
	SELECT cid
	FROM orders
	WHERE aid = 'a03'
) ;

-- 4 --
SELECT DISTINCT cid
FROM orders
WHERE pid = 'p01'

INTERSECT

SELECT DISTINCT cid
FROM orders
WHERE pid = 'p07' ;

-- 5 --
SELECT DISTINCT pid
FROM orders
WHERE cid NOT IN (
	SELECT cid
	FROM orders
	WHERE aid = 'a08'
)
ORDER BY pid DESC ;

-- 6 --
SELECT name, discount, city
FROM customers
WHERE cid IN (
	SELECT cid
	FROM orders
	WHERE aid IN (
		SELECT aid
		FROM agents
		WHERE city = 'Dallas' OR city = 'New York'
	)
) ;
-- 7 --
SELECT cid, name, city
FROM customers
WHERE discount IN (
	SELECT discount
	FROM customers
	WHERE city = 'Dallas' OR city = 'London'
) ;