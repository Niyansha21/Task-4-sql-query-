use customer_db;
-- used select ,order by and group by

SELECT category, COUNT(*) as total_issues
from customer_support_data
group by category
order by total_issues desc;

-- used inner join

select t1.order_id ,
t1.category as category_1,
t2.category as category_2
from customer_support_data as t1
inner join customer_support_data as t2
on t1.category = t2.category
and t1.order_id <> t2.order_id
order by t1.category;

-- used  left join

select t1.order_id ,
t1.category as category_1,
t2.category as category_2
from customer_support_data as t1
left join customer_support_data as t2
on t1.category = t2.category
and t1.order_id <> t2.order_id
order by t1.category;

-- used right join

select t1.order_id ,
t1.category as category_1,
t2.category as category_2
from customer_support_data as t1
right join customer_support_data as t2
on t1.category = t2.category
and t1.order_id <> t2.order_id
order by t1.category;

-- sum  and avg functions

select category,
sum(item_price) as total_price,
avg(item_price) as avg_price
from customer_support_data
group by category
order by total_price desc;

-- created view (virtual table)

create view category_price_summary as
select category,
count(*) as total_orders,
sum(item_price) as total_price,
avg(item_price) as avg_price
from customer_support_data
group by category
order by total_price desc;

select* from category_price_summary;

-- use sub queries

select category, total_price, avg_price
from category_price_summary
where avg_price > (select avg(avg_price) from category_price_summary);