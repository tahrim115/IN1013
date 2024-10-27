-- DROP DATABASE IF EXISTS pet_database;
-- CREATE DATABASE pet_database;
-- USE pet_database;

-- DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (
  petname VARCHAR(45) PRIMARY KEY,
  owner VARCHAR(45),
  species VARCHAR(20),
  gender VARCHAR(1),
  birth date,
  death date
);

CREATE TABLE petEvent (
  petname VARCHAR(45),
  eventdate date,
  eventtype VARCHAR(45),
  remark VARCHAR(25),
  FOREIGN KEY (petname) REFERENCES petPet,
  PRIMARY KEY (petname, eventdate)
);