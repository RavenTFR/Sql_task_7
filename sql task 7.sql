create table sales(
sale_id varchar,
product_id varchar,
date date,
quantity_sold int,
total_revenue int,
discount int
)

select * from sales

drop table customers

create table customers(
customer_id varchar,
customer_name varchar,
email varchar,
phone bigint,
address varchar,
total_purchase int,
total_spent int,
	loyalty_points int,
	average_order_value int
)

select * from customers

create table products(
product_id varchar,
product_name varchar,
category varchar,
	price int,
	stock_quantity int,
	ratings int
)
	
select * from products

--join op

select p.product_name, s.quantity_sold, c.customer_name
from sales s
join products p on s.product_id = p.product_id
join customers c on c.customer_id = c.customer_id;

select p.product_name, s.quantity_sold
from products p
left join sales s on p.product_id = s.product_id
where s.quantity_sold is null;

--group by

select * from products

select category, count(*) as num_products, avg(price) as avg_price
from products
group by category;

select category, AVG(price) as avg_price, sum(stock_quantity) as total_stock
FROM products
group by category;

select category,
      count(*) as num_products,
       sum(case when price > 100 THEN 1 ELSE 0 END) AS high_price_count
from products
group by category;


--having 

select category, avg(price) as avg_price
from products
group by category
having avg(price) > 50;

select category, count(*) as num_products, avg(price) as avg_price
from products
group by category
having count(*) > 10;

select category, avg(price) as avg_price
from products
group by category
having avg(price) between 70 and 1800;

--union

select * from products

select * from sales	

select product_id as id, product_name as name, price as value
from products
union all
select customer_id as id, customer_name as name, total_spent as value
from customers;

select 'Products' as data_source, count(*) as count
from products
union all
select 'Sales' as data_source, count(*) as count
from sales;


select product_id as id, product_name as name, price as value
from products
where category = 'Electronics'
union all
select product_id as id, product_name as name, price as value
from products
where category = 'Clothing';

--task 7 end
