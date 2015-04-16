/* Create a test database */

CREATE DATABASE test;

use test;

CREATE TABLE person
(person_id smallint unsigned,
 fname varchar(20),
 lname varchar(20),
 gender char(1),
 birth_date DATE, 
 street VARCHAR(30),
 city VARCHAR(20),
 state varchar(20),
 country varchar(20),
 postal_code varchar(20),
 CONSTRAINT pk_person PRIMARY KEY (person_id)
);

ALTER table person MODIFY gender ENUM('M','F');

DESC person;

ALTER TABLE person MODIFY person_id SMALLINT UNSIGNED auto_incremeperson_idnt;

CREATE table favorite_food
	(person_id smallint unsigned,
     food VARCHAR(20),
     CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food),
     CONSTRAINT fk_fav_food_person_id FOREIGN KEY (person_id)
		REFERENCES person (person_id)
	);

DESC favorite_food;


     
