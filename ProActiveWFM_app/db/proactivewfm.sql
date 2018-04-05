DROP TABLE employees;
DROP TABLE locations;
DROP TABLE campaigns;
DROP TABLE departments;
DROP TABLE teams;
DROP TABLE jobtitles;
DROP TABLE shifts;

CREATE TABLE locations (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE campaigns (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE departments (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE teams (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE jobtitles (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) NOT NULL UNIQUE,
  supervisor BOOLEAN NOT NULL
);

CREATE TABLE shifts (
  id SERIAL8 PRIMARY KEY,
  label VARCHAR(255) NOT NULL UNIQUE,
  shiftdate DATE,
  shiftstarttime TIME,
  shiftendtime TIME,
  shiftduration DECIMAL,
  breakstarttime TIME,
  breakendtime TIME,
  breakduration DECIMAL
);

CREATE TABLE employees (
  id SERIAL8 PRIMARY KEY,
  firstname VARCHAR(255) NOT NULL,
  surname VARCHAR(255) NOT NULL,
  email VARCHAR(80),
  contractedhrs DECIMAL,
  dateofbirth DATE,
  startdate DATE,
  locationid INT4 REFERENCES locations(id),
  campaignid INT4 REFERENCES campaigns(id),
  departmentid INT4 REFERENCES departments(id),
  teamid INT4 REFERENCES teams(id),
  jobtitleid INT4 REFERENCES jobtitles(id),
  shiftid INT4 REFERENCES shifts(id)
);
