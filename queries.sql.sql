-- Decode Labs Project 3 - orders

Name: Sakshi Kumari
Date: 18-06-2026

-- Query1 : Data Cleaning Queries
-- Check Null Values

 SELECT 
    COUNT(*) AS Total Rows,
    SUM(CASE WHEN orderid IS NULL THEN 1 ELSE 0 END) AS Null_ Order ID,
    SUM(CASE WHEN customerid IS NULL THEN 1 ELSE 0 END) AS Null_ Customer ID,
    SUM(CASE WHEN totalprice IS NULL THEN 1 ELSE 0 END) AS Null_ Price,
    SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS Null_ Date
FROM ORDERS;



-- Query 2: Top 5 Product

SELECT product, SUM(quantity) AS Total _Sold, ROUND(SUM(total- price),2)
FROM ORDERS WHERE order status NOT IN ('Cancelled', 'Returned')
GROUP BY product ORDER BY Total_ Sold DESC LIMIT 5;


-- Query 3: Payment Method Wise Order Count
SELECT payment method, COUNT(order id) AS Total_ Orders
FROM ORDERS 
GROUP BY payment method 
ORDER BY Total_ Orders DESC;


-- Query 4: Month Wise Sales
SELECT substr(date,7,4) || '-'|| substr(date,4,2) AS Month,
   COUNT(order id) AS Orders
   FROM ORDERS WHERE order status ='Delivered'
   GROUP BY Month ORDER BY Month;

-- Query 5: Referral Source ORDERS
SELECT referral source, COUNT(DISTINCT customer id)AS Customers,
 ROUND(SUM(total price),2)AS Revenue
 FROM ORDERS WHERE order status NOT IN('Cancelled' , 'Returned')
 
 GROUP BY referral source ORDER BY Revenue DESC;
  
--Query 6: Coupon Analysis ORDERS

SELECT coupon code,
  COUNT(order id) AS Times _ Used,
  ROUND(SUM(total _price),2) AS Revenue _ Generate
  FROM ORDERS
  WHERE order status NOT IN ('Cancelled', 'Returned')
  AND coupon code IS NOT NULL
  AND coupon code!=''
  GROUP BY coupon code
  ORDER BY Times _Used DESC
  LIMIT 10;

