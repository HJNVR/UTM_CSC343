/*1. The select statement 
	select <column_name>, <column_name> from <table_name>
	e.g. select pro_id, prod_name, prod_price from Products; 
*/
	select * from Products;
	select * from Products limit 5;

/*2. Ways to constrain the numebr of results
  (3) distinct qualifier  -- this will output distince data within the table
	with distinct: 
*/
		select distinct vend_id from products;
		select distinct vend_id, pro_price from products;
		-- always put distinct before any column and it will apply to all the following columns.
#  (4) where clause

/*3. Comments
(1) -- after two hyphens, it will be a comment
(2) # this make an entire line comment
(3) /* */ 
*/

/*Practice 1.1: 
# schemas = database
1. select all colums from table orders and only display 5 records 
*/
	sol'n: selsect * from orders;
# 2. only want to check city and province from table orders
	sol'n: select city, province form orders
# 3. want to check different city in table orders
	sol'n: select distinct city form orders: 
# 4. comment out one of the query you juse wrote down
	sol'n: use # or -- or /* */ 

/*4. sort by using order by 
	* order by clause: 
		(1) make sure the order by clause is the last cluse 
			e.g select prod_name from Products order by prod_name
		(2) sorty by multiple columns
			e.g select prod_id, prod_price, prod_name
			    from Products 
			    order by prod_price, prod_name; -- write line by line is very clear
		(3) sort by column position
			-- this means 
			e.g select prod_id, prod_price, prod_name
			form Products
			order by 2,3;
		(4) specify sort direction 
			by default, it is ascending sort order
			or we can have descending sort order
			select city from orders order by 1 desc;
		
*/

/*5. filter data by using where caluse
	e.g select city form orders where city="北京市"
	* make sure that oder by comes after the where 
		* where clause operators 
			see the database new1 -> where_operators
	(1)  we use single quote delimit a string, and is case-sensitive
		e.g select * from orders where city <> '北京市';
	(2) we use <between and> to represnt range
		e.g I want to find the order_id form 2 to 10 inclusive.
		select * from orders
		where order_id between 2 and 10;
	(3) check for no value - IS NULL 
		select * from products where firs_name is NULL
*/		

/* practice 1.2:
	1. Display the top 5 citys with the most order_pieces from orders
		 select * from orders order by order_pieces desc;
	2. Rank the city by descending order_value and rank by ascending id
		select * from orders order by order_value desc, order_id;
	3. List the cities with order_pieces>=10 and randk by ascending id;
		select * from orders order by order_pieces >= 10 order by order_id;
	4. List cities with order_value between 1000 and 2000 inclusive
		select * from orders where order_value between 1000 and 2000;
	5. 
		 
