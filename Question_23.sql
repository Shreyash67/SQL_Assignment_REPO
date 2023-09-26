/*Q23.Write an SQL query to find the average selling price for each product. average_price should be rounded
to 2 decimal places*/

select p.product_id, round(sum(u.units*p.price)/sum(u.units),2) as average_price
from prices p left join unitssold u
on p.product_id = u.product_id
where u.purchase_date >= start_date and u.purchase_date <= end_date
group by product_id
order by product_id;