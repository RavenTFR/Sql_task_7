
--creating a view

create view customer_view as
select customer_id, customer_name, last_name, age
from customer
where state = 'Washington';

select * from customer_view

drop view customer_view
	
--updating the view
update  customer_view 
set customer_name = upper(customer_name),
    age = age + 2
where age  >20;

--altering the view
alter view customer_view rename age to customer_age

select * from customer_view

commit
rollback
	
--delete funtn	
create view customer_view2 as
select customer_id, customer_name, last_name, age
from customer
where age > 60;

select * from customer_view2;

delete from customer_view2
where age =61;

select * from customer_view2 where age =61;

drop view customer_view2

