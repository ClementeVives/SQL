/*In this SQL, I'm querying a database with multiple tables in it to quantify statistics about customer and order data*/

/*RETURN how many orders placed in January*/

SELECT COUNT(orderid) FROM BIT_DB.JanSales
WHERE length(orderid) = 6 
AND orderid <> 'Order ID'

/*RETIRN How many of those orders were for an iPhone*/
  
SELECT COUNT(orderid) FROM BIT_DB.JanSales
WHERE Product='iPhone'
AND length(orderid) = 6 
AND orderid <> 'Order ID'

/*RETURN customer account numbers for all the orders that were placed in February*/
  
SELECT distinct acctnum FROM BIT_DB.customers cust
INNER JOIN BIT_DB.FebSales Feb
ON cust.order_id=FEB.orderid
WHERE length(orderid) = 6 
AND orderid <> 'Order ID'

/*RETURN which product was the cheapest one sold in January, and what was the price*/
  
SELECT distinct product, price FROM BIT_DB.JanSales 
ORDER BY price ASC LIMIT 1

/*RETURN total revenue for each product sold in January*/
  
SELECT sum(quantity)*price as revenue ,product FROM BIT_DB.JanSales
GROUP BY product

/*RETURN which products were sold in February at 548 Lincoln St, Seattle, WA 98101, how many of each were sold, and what was the total revenue*/
  
SELECT sum(Quantity), product, sum(quantity)*price as revenue FROM BIT_DB.FebSales 
WHERE location = '548 Lincoln St, Seattle, WA 98101'
GROUP BY product

/*RETURN customers that ordered more than 2 products at a time, and what was the average amount spent for those customers*/
  
SELECT count(cust.acctnum), avg(quantity*price) FROM BIT_DB.FebSales Feb
LEFT JOIN BIT_DB.customers cust
ON FEB.orderid = cust.order_id
WHERE Feb.Quantity>2
AND length(orderid) = 6 
AND orderid <> 'Order ID'

/*RETURN products sold in Los Angeles in February, and include how many of each were sold*/

SELECT Product, SUM(quantity), location FROM BIT_DB.FebSales
WHERE location LIKE '%Los Angeles%'
GROUP BY Product;

/*RETURN how many products where sold in a specific period of time*/

SELECT sum(quantity) FROM BIT_DB.FebSales 
WHERE orderdate like '02/18/19%';


