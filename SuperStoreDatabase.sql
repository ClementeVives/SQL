/*This project utilized data from the Superstore database stored at http://sqlfiddle.com/#!5/ce3dc3*/

CREATE TABLE superstore (
    item_id INTEGER PRIMARY KEY,
    item_name TEXT,
    category TEXT,
    price DECIMAL(10, 2),
    stock_quantity INTEGER,
    average_rating DECIMAL(3, 2)
);

INSERT INTO superstore (item_id, item_name, category, price, stock_quantity, average_rating)
VALUES
    (1, 'Stainless Steel Cookware Set', 'Kitchen Supplies', 89.99, 50, 4.6),
    (2, 'Memory Foam Mattress', 'Furnishings', 499.99, 30, 4.8),
    (3, 'Smart LED TV', 'Electronics', 549.00, 20, 4.5),
    (4, 'Robot Vacuum Cleaner', 'Appliances', 199.50, 40, 4.3),
    (5, 'Wireless Bluetooth Speaker', 'Electronics', 39.99, 60, 4.2),
    (6, 'Non-Stick Baking Set', 'Kitchen Supplies', 29.95, 80, 4.4),
    (7, 'Cotton Bedding Set', 'Furnishings', 89.00, 25, 4.7),
    (8, 'Smart Home Security Camera', 'Electronics', 79.95, 15, 4.1),
    (9, 'Air Purifier', 'Appliances', 129.50, 35, 4.6),
    (10, 'Premium Coffee Maker', 'Kitchen Supplies', 79.99, 50, 4.9),
    (11, 'Ergonomic Office Chair', 'Furnishings', 189.00, 20, 4.5),
    (12, 'Wireless Earbuds', 'Electronics', 49.99, 75, 4.3),
    (13, 'Slow Cooker', 'Appliances', 49.95, 30, 4.7),
    (14, 'Cutlery Set', 'Kitchen Supplies', 34.50, 40, 4.4),
    (15, 'Cozy Throw Blanket', 'Furnishings', 24.99, 100, 4.2);

/*RETURN all products*/

SELECT * FROM superstore;

/*RETURN order of the items by price*/

SELECT item_name, price FROM superstore
ORDER BY price desc;

/*RETURN MAX price of the items*/

SELECT item_name, max(price) FROM superstore;
  
/*RETURN AVG price from all prodcuts*/

SELECT AVG(price) FROM superstore;

/*RETURN all products where proce is greater or equal to the AVG price*/

SELECT * FROM superstore
WHERE price >=142.35
ORDER BY price desc;

/*RETURN SUM the stock_quantity of all products*/

SELECT SUM(stock_quantity) FROM superstore;

/*RETURN SUM price for items in the category of Kitchen Supplies*/

SELECT SUM(price), item_name FROM superstore
WHERE category='Kitchen Supplies'
ORDER BY item_name

/*RETURN ALTER an existing table by adding a new row AS price_rating*/

ALTER TABLE superstore ADD price_rating TEXT; 

UPDATE superstore SET price_rating = "EXPENSIVE"
WHERE price >= 200;

UPDATE superstore SET price_rating = "AVERAGE"
WHERE price >= 75;

UPDATE superstore SET price_rating = "CHEAP"
WHERE price < 75;

/*RETURN INSERT new data into the new row*/

INSERT INTO superstore (item_id, item_name, category, price, stock_quantity, average_rating, price_rating)
    VALUES 
    (16,'Cast Iron Cookware Set', 'Kitchen Supplies', 83.32, 20, 4.5, "AVERAGE");

/*RETURN DELETE data from the table WHERE iten name is "Cast Iron Cookware Set"*/

DELETE FROM superstore WHERE item_name = "Cast Iron Cookware Set";
