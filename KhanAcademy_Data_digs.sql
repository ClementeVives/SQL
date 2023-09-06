/*Earned Badges
This table contains badges earned by a user, including the most recent date achieved, the type, the name, the # of energy points earned, and the activity earned from.
Collected by: https://www.khanacademy.org/profile/chopsor/
*/

CREATE TABLE badges (id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT,
    badge_type TEXT,
    badge_name TEXT,
    energy_points INTEGER);

INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/12", "Sun", "Oracle", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/28", "Earth", "Incredible Inspiration", 5000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 01/29", "Challenge Patch", "Intro to JS: Drawing & Animation Mastery", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2014, 12/05", "Meteorite", "Thumbs Up", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/28", "Moon", "1000 Kelvin", 1000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/25", "Earth", "299,792,458 Meters per Second", 5000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/20", "Sun", "Da Vinci", 200000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/02", "Sun", "Newton", 150000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/02", "Sun", "Hypatia", 125000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/24", "Sun", "Kepler", 125000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/24", "Sun", "Copernicus", 80000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/07", "Sun", "Sally Ride", 35000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 01/06", "Sun", "Magellan", 30000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/24", "Earth", "Guru", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2014, 12/29", "Earth", "Work Horse", 14000);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2014, 10/20", "Moon", "Redwood", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2013, 10/20", "Meteorite", "Cypress", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 03/18", "Sun", "Millionaire", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 02/27", "Earth", "Five Times Ten to the Fifth", 0);
INSERT INTO badges (date, badge_type, badge_name, energy_points) VALUES ("2015, 04/04", "Earth", "Investigator", 0);

/*Return all badge_names that are related to the badge_type selected ordered by energy_points*/

SELECT badge_name, energy_points FROM badges WHERE badge_type IN ('Sun', 'Earth') 
ORDER BY energy_points DESC
LIMIT 10;

SELECT badge_name, energy_points FROM badges WHERE badge_type IN ("Meteorite", "Moon","Challenge Patch")
ORDER BY badge_type DESC
LIMIT 10;

/*Return all badge_name that have the greater values*/

SELECT badge_name FROM badges WHERE (badge_type='Sun' AND energy_points >150000);

/*Return SUM of all badge_types*/

SELECT badge_type, SUM(energy_points) as sum_points FROM badges
GROUP BY badge_type
ORDER BY sum_points 
desc; 

/*Return AVG of all badge_types*/

SELECT badge_type, AVG(energy_points) as avg_points FROM badges
GROUP BY badge_type
ORDER BY avg_points 
desc;

/*Return each energy_grade depending on the amount of energy_points*/

  SELECT energy_points,
  CASE 
  WHEN energy_points > 100000 THEN "A"
  WHEN energy_points > 50000 THEN "B"
  WHEN energy_points > 10000 THEN "C"
  ELSE 'D'
  END as "energy_grade" FROM badges
  GROUP BY "energy_grade"
  ORDER BY energy_grade;


/*Return count of each energy_grade depending on the amount of energy_points*/ 

SELECT COUNT(*),
  CASE 
  WHEN energy_points > 100000 THEN "A"
  WHEN energy_points > 50000 THEN "B"
  WHEN energy_points > 10000 THEN "C"
  ELSE 'D'
  END as "energy_grade" FROM badges
  GROUP BY "energy_grade"
  ORDER BY energy_grade;
