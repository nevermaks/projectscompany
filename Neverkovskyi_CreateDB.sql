-- Create the database
CREATE DATABASE Task1;

-- Use the Task1 database
USE Task1;

-- Create the schema
CREATE SCHEMA ts
AUTHORIZATION dbo;


-- Create tables 
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(255),
    Email VARCHAR(255)
);

CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    Name VARCHAR(100),
    CreationDate DATE,
    State VARCHAR(20),
    CloseDate DATE
);

CREATE TABLE EmployeeProject (
    id INT PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    EmployeeRole VARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);

CREATE TABLE Task (
    TaskID INT PRIMARY KEY,
    ProjectID INT,
    Taskdescp TEXT,
    AssignmentDate DATE,
    Status VARCHAR(20),
    ChangeDate DATE,
    EmployeeID INT,
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

