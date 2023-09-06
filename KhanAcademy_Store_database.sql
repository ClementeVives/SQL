 CREATE TABLE products (id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER, price INTEGER, spice_level TEXT, flavor_type TEXT);

INSERT INTO products VALUES
(1, 'potato_chips', 20, 1.50, 'low', 'cheese'),
(2, 'ramen', 50, 2.50, 'medium', 'shrimp'),
(3, 'eggs', 36, 0.5, 'none', 'soy'),
(4, 'takkis', 23, 5, 'high', 'hot'),
(5, 'pasta', 10, 1.25, 'none', 'flour'),
(6, 'doritos', 80, 3, 'medium', 'bbq'),
(7, 'cheetos', 20, 2.50, 'low', 'flaming_hot'),
(8, 'ruffles', 15,1, 'low', 'onion'),
(9, 'tacos', 20, 6.50, 'high', 'mexican'),
(10, 'topoqui', 36, 1.25, 'extreme', 'rice'),
(11, 'pringle', 10,2.50, 'none', 'garlic'),
(12, 'philadelphia', 10,6, 'none', 'onion_and_chieves'),
(13, 'bread', 54, 21, 'none', 'butter'),
(14, 'dumplings', 100, 3, 'low', 'pork'),
(15, 'fried_rice', 10,6, 'medium', 'chinese');

/*Return all products*/

SELECT * FROM products;

/*Return AVG price from all prodcuts*/

SELECT AVG(price) FROM products;

/*Return all products where proce is greater or equal to the AVG price*/

SELECT * FROM products
WHERE price >=4.23
ORDER BY price desc;

/*Return SUM the quantity of all products*/

SELECT SUM(quantity) FROM products;
