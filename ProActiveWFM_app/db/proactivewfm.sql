DROP TABLE locations;
DROP TABLE organisations;
DROP TABLE departments;
DROP TABLE teams;
DROP TABLE jobTitles;
DROP TABLE employees;
DROP TABLE shifts;

CREATE TABLE locations (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE organisations (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE departments (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE teams (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE jobTitles (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  isSupervisor BOOLEAN
);

CREATE TABLE employees (
  id SERIAL8 PRIMARY KEY,
  firstName VARCHAR(255) NOT NULL,
  surName VARCHAR(255) NOT NULL,
  email VARCHAR(80),
  contractedHrs DECIMAL,
  startDate DATE,
  dateOfBirth DATE,
  locationId INT4,
  organisationId INT4,
  departmentId INT4,
  teamId INT4,
  jobtitleId INT4,
  shiftId INT4
);

CREATE TABLE shifts (
  id SERIAL8 PRIMARY KEY,
  label VARCHAR(255) NOT NULL,
  shiftDate DATE,
  shiftStartTime TIME,
  shiftEndTime TIME,
  shiftDuration DECIMAL,
  breakStartTime TIME,
  breakEndTime TIME,
  breakDuration DECIMAL
);
