USE sql_store; 	-- select a specific database

Select * 		-- retrieve all customers  
From customers
Limit 1000;

Select * 		-- order customers by last name
From Customers
Order by last_name;

Select, From, Where, Order By 