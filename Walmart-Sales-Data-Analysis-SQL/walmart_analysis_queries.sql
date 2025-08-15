--------------------------------------------------------------
------------------ feature engineering -------------------------
--- time_of_day
select time,
(case
when time between "00:00:00" and "12:00:00" then "Morning"
when time between "12:01:00" and "16:00:00" then "Afternoon"
else "Evening"
end
) as time_of_date
from sales;

------- day_name ------
select
date,
dayname(date)
from sales;

------- month_name --------
select date,monthname(date) from sales;

-------------------------------------------------------------------------------------
----- how_many_unique_cities_does_the_data_have ---------------------
select distinct city from sales;

select distinct city, branch from sales;

--------- how many unique_product lines_ does the data_have? --------
select distinct product_line from sales;

-------- what is the most common payment method? -------
select payment,count(payment) from sales group by payment;

----- what is the most selling product line --------
select product_line,count(product_line) from sales group by product_line;

------- what_is the total revenue by_month ----------
select
month_name as month,
SUM(total) as total_revenue
from sales group by month_name
order by total_revenue desc;

-------------- what month had the largest cogs ------------
select
month_name as month,
sum(cogs) as cogs from sales
group by month_name order by cogs;

--------- what product_line had the largest revenue ---------
select product_line, sum(total) as total_revenue
from sales
group by product_line
order by total_revenue desc;

--------- what is_ the city with_ the largest revenue -----
select branch,city,sum(total) as total_revenue
from sales
group by city,branch order by total_revenue desc;

--------- what product_line had the largest vat? ------
select product_line, avg(vat) as avg_tax
from sales group by product_line order by avg_tax desc;

-- fetch each product line and add a coloumn to those product line showing"good" , "bad". good if its greather than average sales ---
--- which branch sold more product than_ avraege product sold? -----
select branch,sum(quantity) as qty
from sales group by branch having sum(quantity) > (select avg(quantity) from sales);

---- what is the most common product line by gender? -----
select gender,product_line,count(gender) as total_cnt
from sales group by gender,product_line order by total_cnt desc;

------ what is_ the avrage rating of_ each_ product line -----
select avg(rating) as avg_rating,product_line
from sales group by product_line order by avg_rating desc;