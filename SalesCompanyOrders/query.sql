use SalesCompanyOrders;

select name
from orders as O
         natural right outer join company as C
select s.name
from orders as O
         natural right outer join company as C
         left join salesperson s on O.sales_id = s.sales_id
where C.name != 'RED'

