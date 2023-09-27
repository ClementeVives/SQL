/*In this SQL, I'm querying a database with multiple tables in it to quantify statistics about customers, employees, invoices, and order data.*/


SELECT CustomerId, FirstName, Country FROM chinook.customers
WHERE Country <> "USA";

SELECT FirstName, Country FROM chinook.customers
WHERE Country = "Brazil"
ORDER BY FirstName;

SELECT i.InvoiceDate, c.FirstName, i.InvoiceId, i.BillingCountry FROM customers AS c
JOIN invoices AS i
ON c.CustomerId = i.CustomerId
WHERE BillingCountry = "Brazil"
ORDER BY i.InvoiceDate desc;

SELECT * FROM employees
WHERE Title = "Sales Support Agent";

SELECT DISTINCT BillingCountry FROM Invoices;

SELECT e.LastName, e.FirstName, i.InvoiceId FROM employees AS e
JOIN customers AS c
ON c.SupportRepId = e.EmployeeId
JOIN invoices as i
ON i.InvoiceId = c.CustomerId;


SELECT c.LastName AS cx_LastName, c.FirstName AS cx_FirstName, c.Country, e.LastName AS agent_LastName, e.FirstName AS agent_FirstName, i.total FROM employees AS e
JOIN customers AS c
ON c.SupportRepId = e.EmployeeId
JOIN invoices as i
ON i.InvoiceId = c.CustomerId;

SELECT COUNT(*) FROM invoices 
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

SELECT ROUND(SUM(total),2) AS SUM_TOTAL FROM invoices 
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';



SELECT t.Name, i.InvoiceLineId
FROM Invoice_items AS i
JOIN Tracks AS t 
ON i.TrackId = t.TrackId;


SELECT ar.name AS Artist, t.Name AS Track, i.InvoiceLineId
FROM Invoice_items AS i
LEFT JOIN tracks AS t 
ON i.TrackID = t.TrackID
INNER JOIN albums AS a
ON a.AlbumID = t.AlbumID
LEFT JOIN artists AS ar
ON ar.ArtistID = a.ArtistID;


SELECT t.Name AS 'Track Name', a.Title AS 'Album Title', m.Name AS 'Media Type', g.Name AS 'Genre'
FROM chinook.tracks AS t
JOIN chinook.Albums AS a 
ON a.AlbumId = t.AlbumId
JOIN chinook.Media_Types AS m
ON m.MediaTypeId = t.MediaTypeId
JOIN chinook.Genres ASg
ON g.GenreId = t.GenreId;


SELECT e.FirstName, e.LastName,
ROUND(SUM(i.Total), 2) AS 'Total Sales' 
FROM Employees AS e
JOIN Customers AS c 
ON c.SupportRepId = e.EmployeeId
JOIN Invoices AS i 
ON i.CustomerId = c.CustomerId
WHERE e.Title = 'Sales Support Agent' 
GROUP BY e.FirstName;

 
SELECT e.FirstName, e.LastName,
ROUND(SUM(i.Total), 2) AS 'Total Sales' 
FROM Employees AS e
JOIN Customers AS c 
ON c.SupportRepId = e.EmployeeId
JOIN chinook.Invoices AS i 
ON i.CustomerId = c.CustomerId
WHERE e.Title = 'Sales Support Agent' 
AND i.InvoiceDate LIKE '2009%' 
GROUP BY e.FirstName
ORDER BY (round(sum(i.Total), 2))  DESC LIMIT 1;
