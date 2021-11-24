USE sql_store; 				-- select a specific database, terminate each script;

Select * 				-- retrieve all customers  
From customers		
Where last_name like '%ey%'
Order by last_name
Limit 1000;

Select * 				-- order customers by last name
From Customers
Order by last_name;

-- Select, From, Where, Order By 

SELECT 					-- Select Clause 29:45 
    first_name, 
    last_name, 
    points, 
    (points * 1) / 100 AS discount_factor
FROM
    customers;
    
Select distinct state 			-- select only unique values which are... distinct 
From customers; 

Select 					-- increase product price by 10% 
	products.name, 
    unit_price, 
    unit_price * 1.1 as new_price 	-- (), *, /, +, -
From products;
	
Select *				-- Operators: >, >=, <, <=, =, !=, <>		
From customers 
Where state = "VA" 			-- text
	or points > 3000; 		-- int

Select *			
From customers 
Where birth_date > '1990-01-01' 	-- year, month, day

SELECT * 				-- AND has higher priority over OR, use paranthesis ()
FROM Customers
WHERE
    birth_date > '1990-01-01' OR 
    (points > 1000 AND state = 'VA') 
    
-- select those which are NOT born after 1990... born before 1990
-- and they dont have more than 1000 points... and have less than 1000 points
SELECT *
FROM Customers
WHERE NOT (birth_date > '1990-01-01' OR points > 1000) 
Where birth_date <= '1990-01-01' AND points <+ 1000
    
SELECT *  
FROM order_items
Where order_id = 6 AND unit_price * quantity > 30 		-- total price over $30

SELECT * 
FROM sql_store.customers
where state = 'VA' or state = 'GA' or state = 'FL'
where state in ('VA', 'GA', 'FL') 				-- IN operator, text

SELECT * 
FROM sql_store.products
Where quantity_in_stock in (49, 38, 72)				-- IN operator, integers

SELECT * 
FROM sql_store.customers 	
Where points >= 1000 AND points <=3000				-- AND
Where points between 1000 and 3000				-- Between 

SELECT * 
FROM sql_store.customers
Where birth_date between '1990-01-01' and '2000-01-01' 		-- Date, year, month, day

SELECT * 
FROM sql_store.customers		-- % any number of characters... _ single character
Where last_name like 'b%' 		-- like... starts with 'b'
where last_name like '%e%'		-- like... somewhere have an 'e'
where last_name like '%y'		-- like... end with 'd'
where last_name like '_____y'		-- like... last name have 6 characters, each ends with y
where last_name like 'b____y' 		-- like... start with b- - - -y

SELECT * 
FROM sql_store.customers 	
Where address like "%trail%" or address like "%avenue%" 

SELECT * 
FROM sql_store.customers 	
Where phone NOT like "%Avenue%" 	-- NOT like

SELECT * 
FROM sql_store.customers 	
Where last_name like "%field%" or last_name like "%mac%" or last_name like "%rose%"
Where last_name RegExp 'field|mac|rose' 			-- RegExp 	

SELECT * 
FROM sql_store.customers 	
Where last_name RegExp '[a-z]e' 				-- ^start, end$, |or, [abcd], [a-d]

SELECT * 
FROM sql_store.customers 	
-- Where first_name RegExp 'elka|ambur'
where last_name RegExp '^my|se' 				-- start with 'my' or contain 'se'

SELECT * 
FROM sql_store.customers 					-- NULL ... absence of value
Where phone is NULL
Where phone is NOT NULL

SELECT * 
FROM sql_store.orders 						-- NULL ... orders not shipped yet
where shipped_date is NULL

-- in relational database a unique Primary Key identifies the values in that Table
SELECT * 
FROM sql_store.customers 					-- Order by... state, first_name
order by State, first_name ASC

SELECT *, quantity * unit_price as Total_Price
FROM sql_store.order_items
where order_id = 2
order by quantity * unit_price DESC				-- Order by... Total Price

SELECT *, quantity * unit_price as Total_Price
FROM sql_store.order_items
Limit 6, 5		-- skip the first 6, show the next 3

SELECT 								-- INNER JOIN
    order_id, 
	orders.customer_id					-- customer_id is in both Tables, so pick one
    first_name, 
    last_name, 
FROM sql_store.orders 		   JOIN customers 
			ON orders.customer_id = customers.customer_id

SELECT 								-- simplify by using O for orders and C for customers
    order_id, 
    first_name, 
    last_name, 
    O.customer_id						-- customer_id is in both Tables, so pick one
FROM sql_store.orders O JOIN customers C 			-- make the Alies here
			ON O.customer_id = C.customer_id
            
SELECT * 							-- joing across databases
FROM order_items o  JOIN 	sql_inventory.products p 
		ON o.product_id = p.product_id
	
Use sql_store;
-- Left Join... returns all records from Left table 
-- and only those matching from Right table
SELECT p.product_id, p.name, oi.quantity
From products p Left Join order_items oi 
	ON p.product_id = oi.product_id
 
								-- Join... combine columns ||
								-- Union... combine rows = ... aka Records 
SELECT  				
	order_id,
    order_date,
    'Active' as Status
FROM orders
Where order_date >= '2019-01-01' -- terminate 
	Union
SELECT  				
	order_id,
    order_date,
    'Archive' as Status
FROM orders
Where order_date < '2019-01-01'


Select customer_id, first_name, points, 'Bronze' as Type
From customers
Where points < 2000
	Union
Select customer_id, first_name, points, 'Silver' as Type
From customers
Where points between 2000 and 3000
	Union
Select customer_id, first_name, points, 'Gold' as Type
From customers
Where points > 3000
order by first_name

-- insert
Insert INTO customers
Values (
	default, 
    'Vasile', 
    'T', 
    NULL,
    default,
    '11416',
    'Ozone Park',
    'NY',
    Default) 
    
    
