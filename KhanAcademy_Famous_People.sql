/*In this project, you’re going to make your own table with some small set of “famous people”, then make more tables about things they do and join those to create nice human readable lists.

For example, here are types of famous people and the questions your data could answer:

Movie stars: What movies are they in? Are they married to each other?
Singers: What songs did they write? Where are they from?
Authors: What books did they write?
Fictional characters: How are they related to other characters? What books do they show up in?*/

CREATE TABLE actors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fullname TEXT,
    age INTEGER);
    
INSERT INTO actors (fullname, age) VALUES ("Tom Holland", "27");
INSERT INTO actors (fullname, age) VALUES ("Zendaya", "27");
INSERT INTO actors (fullname, age) VALUES ("Ryan Reynolds", "45");
INSERT INTO actors (fullname, age) VALUES ("Blake Lively", "35");
INSERT INTO actors (fullname, age) VALUES ("Leonardo DiCaprio", "48");

CREATE table movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person_id INTEGER,
    name TEXT);
    
INSERT INTO movies (person_id, name) VALUES (1, "The Amazing Spider-man");
INSERT INTO movies (person_id, name) VALUES (1, "Uncharted");
INSERT INTO movies (person_id, name) VALUES (2, "Dune");
INSERT INTO movies (person_id, name) VALUES (2, "Frenemies");
INSERT INTO movies (person_id, name) VALUES (3, "Deadpool");
INSERT INTO movies (person_id, name) VALUES (3, "The Proposal");
INSERT INTO movies (person_id, name) VALUES (4, "Hick");
INSERT INTO movies (person_id, name) VALUES (4, "All i see is you");
INSERT INTO movies (person_id, name) VALUES (5, "Inceptio");
INSERT INTO movies (person_id, name) VALUES (5, "Titanic");

CREATE table couples (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person1_id INTEGER,
    person2_id INTEGER);

INSERT INTO couples (person1_id, person2_id)
    VALUES (1, 2);
INSERT INTO couples (person1_id, person2_id)
    VALUES (3, 4);
INSERT INTO couples (person1_id)
    VALUES (5);

/*Return actors matching the movies they are in*/
    
SELECT p.fullname, h.name FROM actors AS p
JOIN movies AS h
ON p.id = h.person_id;

/*Return couples between the actors*/

SELECT a.fullname AS actors, b.fullname AS actress FROM couples 
JOIN actors AS a
ON a.id=couples.person1_id
LEFT OUTER JOIN actors AS b
ON b.id=couples.person2_id;
