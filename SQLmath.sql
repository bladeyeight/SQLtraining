use classicmodels;
select 
	productName,
	quantityInStock,
	buyPrice,
	buyPrice + 10 as discount_factor
from products ;