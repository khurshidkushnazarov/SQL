
select * from Products

select *  from Products 
where StockQuantity > 50

select *  from Products
where StockQuantity >= 100 and price < 500

select distinct category from Products

select category,count(ProductName) as total_products from Products
group by category


--- har bir kategoriya

select category,sum(Price * StockQuantity) as total_sale from Products
group by category



---- savdosi 50 dan kup, narxi 400 dan kichik 5 tadan kup kategoriyalarni topish

select category,count(ProductName)  from Products
where StockQuantity>50 and Price<400
group by category
having count(productid)>=5


----narxlarni 3 taga bulamiz, 500 kichik low, 500<1000< middle, else high

select
	*,
	case 
	when Price < 500 then 'low sales'
	when Price < 1000 then 'Medium sales' else 'High sales' end as Pricecategory
from Products
