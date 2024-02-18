-- EDA

ALTER TABLE Orders
ADD Column Month varchar(20)

ALTER TABLE Orders
ADD Column Year INT


-- Adding new column month and year to analyze the month sales
UPDATE Orders 
SET month = TO_CHAR(OrderDate, 'Month');

UPDATE Orders 
SET Year = EXTRACT(YEAR FROM OrderDate);

SELECT * FROM Orders


-- Q1 Finding Month Which Brought Highest Number Of Saeles

SELECT Month,COUNT(Month) as Total
FROM Orders
GROUP BY Month
ORDER BY Total DESC

-- Q2 Finding Year wise Saeles

SELECT Year,COUNT(Year) as Total
FROM Orders
GROUP BY Year
ORDER BY Total DESC

-- Q3 Finding the customers which orders the most

select name,orders.customerid,count(orders.customerid) as total_orders
from orders
join customers on orders.customerid=customers.customerid
group by orders.customerid,name
order by total_orders desc
LIMIT 10


-- Q4 Finding produts which were sold the most

SELECT Products.name,count(Products.name) as total FROM Orders
JOIN OrderDetails on Orders.OrderID = OrderDetails.OrderID
join products on OrderDetails.ProductID = Products.ProductID
group by Products.name
order by total desc
limit 10

-- Q5 Finding which category brings most customers to the website

SELECT categories.categoryname as name,count(categories.categoryname) as total FROM Orders
JOIN OrderDetails on Orders.OrderID = OrderDetails.OrderID
join products on OrderDetails.ProductID = Products.ProductID
join categories on products.categoryID = categories.categoryID
group by categories.categoryname
order by total desc;

-- Q6 Finding which proudct brought the highest sale in a particular month

SELECT month,name,count(name),
	   dense_rank() over(partition by month order by count(name) desc) as rnk
FROM Orders
JOIN OrderDetails on Orders.OrderID = OrderDetails.OrderID
join products on OrderDetails.ProductID = Products.ProductID
group by name,month


-- Q7 Finding which proudct category the highest sale in a particular month

with cte as (
SELECT month,categoryname,count(categoryname),
	   dense_rank() over(partition by month order by count(categoryname) desc) as rnk
FROM Orders
JOIN OrderDetails on Orders.OrderID = OrderDetails.OrderID
join products on OrderDetails.ProductID = Products.ProductID
join categories on products.categoryID=categories.categoryID
group by categoryname,month) select * from cte where rnk = 1


-- Q8 Finding total quantity of each products sold through the website

select name,orderdetails.ProductID,SUM(Quantity) as TotalQty from OrderDetails
join products on OrderDetails.productid = Products.productid
group by orderdetails.productid,name
order by orderdetails.productid;


-- Q9 Finding Products whose sales were very low i.e. <120

with cte as (select name,orderdetails.ProductID,SUM(Quantity) as TotalQty from OrderDetails
join products on OrderDetails.productid = Products.productid
group by orderdetails.productid,name
order by totalQty) select * from cte where TotalQty <= 120


-- Q10 Products which are there in inventory

with cte as
(select name,stock_quantity,SUM(quantity) as Qty_ordered FROM Orderdetails
join products on OrderDetails.productid = Products.productid
group by name,stock_quantity) select * from cte where stock_quantity>qty_ordered


-- Q11 Products which are outofstock

with cte as
(select name,stock_quantity,SUM(quantity) as Qty_ordered FROM Orderdetails
join products on OrderDetails.productid = Products.productid
group by name,stock_quantity) select * from cte where stock_quantity<qty_ordered


-- Q12 Orders which were not delivered yet

select name,shipdate,deliverydate from shiping
join orderdetails on shiping.orderid=orderdetails.orderid
join products on orderdetails.productid=products.productid
where deliverydate is NULL;

-- Q13 Orders whose shping has not yet started

select name,shipdate,deliverydate from shiping
join orderdetails on shiping.orderid=orderdetails.orderid
join products on orderdetails.productid=products.productid
where deliverydate is NULL and shipdate is NULL;


-- Q14 Finding average deliver time of each products

with cte as
(select name,shipdate,deliverydate,(deliverydate-shipdate) as timetodeliver from shiping
join orderdetails on shiping.orderid=orderdetails.orderid
join products on orderdetails.productid=products.productid
where deliverydate is NOT NULL and shipdate is NOT NULL)
select name,ROUND(AVG(timetodeliver),2) from cte
group by name


-- Q15 which product brought the maximum revenue

select name,SUM(price*quantity) as revenue from products
join orderdetails on products.productid = orderdetails.productid
group by name
order by revenue desc
limit 10


-- Q16 which category brought the maximum revenue

select categoryname,SUM(price*quantity) as revenue from products
join orderdetails on products.productid = orderdetails.productid
join categories on products.categoryid=categories.categoryid
group by categoryname
order by revenue desc


-- Q17 finding which product in each category brought the highest revenue

with cte as
(select categoryname,name,SUM(price*quantity) as revenue,
rank() over(partition by categoryname order by SUM(price*quantity) desc) as rnk
from products
join orderdetails on products.productid = orderdetails.productid
join categories on products.categoryid=categories.categoryid
group by categoryname,name) select categoryname,name,revenue from cte where rnk = 1


-- Q18 Findin selling price of each product

select name,discountamount,price as ap,ROUND((price-(price*discountamount)/100),2) as sp from products
join discount on products.productid=discount.productid

-- Q19 Finding products which gets more reviews

select name,COUNT(comment) as total_reviews,string_agg(comment,',') as All_reviews from reviews
join products on reviews.productid=products.productid
group by name 
order by total_reviews desc





 






