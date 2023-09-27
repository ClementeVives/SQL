/*In this SQL, I'm querying a database with multiple tables in it to quantify statistics about customers, employees, invoices, and order data.*/

/*RETURN Customers who are not in the US*/

SELECT CustomerId, FirstName, Country FROM chinook.customers
WHERE Country <> "USA";

/*RETURN Customers from Brazil*/

SELECT FirstName, Country FROM chinook.customers
WHERE Country = "Brazil"
ORDER BY FirstName;

/*RETURN Invoices of customers who are from Brazil. showing the customer's full name, Invoice ID, Date of the invoice, and billing country*/

SELECT i.InvoiceDate, c.FirstName, i.InvoiceId, i.BillingCountry FROM customers AS c
JOIN invoices AS i
ON c.CustomerId = i.CustomerId
WHERE BillingCountry = "Brazil"
ORDER BY i.InvoiceDate desc;

/*RETURN Employees who are Sales Agents*/

SELECT * FROM employees
WHERE Title = "Sales Support Agent";

/*RETURN unique/distinct list of billing countries from the Invoice table*/

SELECT DISTINCT BillingCountry FROM Invoices;

/*RETURN invoices associated with each sales agent*/

SELECT e.LastName, e.FirstName, i.InvoiceId FROM employees AS e
JOIN customers AS c
ON c.SupportRepId = e.EmployeeId
JOIN invoices as i
ON i.InvoiceId = c.CustomerId;

/*RETURN Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers*/

SELECT c.LastName AS cx_LastName, c.FirstName AS cx_FirstName, c.Country, e.LastName AS agent_LastName, e.FirstName AS agent_FirstName, i.total FROM employees AS e
JOIN customers AS c
ON c.SupportRepId = e.EmployeeId
JOIN invoices as i
ON i.InvoiceId = c.CustomerId;

/*RETURN total Invoices in 2009*/

SELECT COUNT(*) FROM invoices 
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

/*RETURN total sales for 2009*/

SELECT ROUND(SUM(total),2) AS SUM_TOTAL FROM invoices 
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

/*RETURN purchased track name with each invoice line ID*/

SELECT t.Name, i.InvoiceLineId
FROM Invoice_items AS i
JOIN Tracks AS t 
ON i.TrackId = t.TrackId;

/*RETURN purchased track name with artist name and each invoice line ID*/

SELECT ar.name AS Artist, t.Name AS Track, i.InvoiceLineId
FROM Invoice_items AS i
LEFT JOIN tracks AS t 
ON i.TrackID = t.TrackID
INNER JOIN albums AS a
ON a.AlbumID = t.AlbumID
LEFT JOIN artists AS ar
ON ar.ArtistID = a.ArtistID;

/*RETURN all the Tracks with  Album name, Media type, and Genre*/

SELECT t.Name AS 'Track Name', a.Title AS 'Album Title', m.Name AS 'Media Type', g.Name AS 'Genre'
FROM tracks AS t
JOIN Albums AS a 
ON a.AlbumId = t.AlbumId
JOIN Media_Types AS m
ON m.MediaTypeId = t.MediaTypeId
JOIN Genres ASg
ON g.GenreId = t.GenreId;

/*RETURN total sales made by each sales agent*/

SELECT e.FirstName, e.LastName, ROUND(SUM(i.Total), 2) AS 'Total Sales' 
FROM Employees AS e
JOIN Customers AS c 
ON c.SupportRepId = e.EmployeeId
JOIN Invoices AS i 
ON i.CustomerId = c.CustomerId
WHERE e.Title = 'Sales Support Agent' 
GROUP BY e.FirstName;

/*RETURN sales agent that made the most dollars in sales in 2009*/

SELECT e.FirstName, e.LastName, ROUND(SUM(i.Total), 2) AS 'Total Sales' 
FROM Employees AS e
JOIN Customers AS c 
ON c.SupportRepId = e.EmployeeId
JOIN chinook.Invoices AS i 
ON i.CustomerId = c.CustomerId
WHERE e.Title = 'Sales Support Agent' 
AND i.InvoiceDate LIKE '2009%' 
GROUP BY e.FirstName
ORDER BY (round(sum(i.Total), 2))  DESC LIMIT 1;
