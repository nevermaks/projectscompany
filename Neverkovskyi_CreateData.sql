-- Insert data into Employee table
INSERT INTO Employee VALUES (1, 'John Doe', 'john.doe@google.com');
INSERT INTO Employee VALUES (2, 'Jane Smith', 'jane.smith@google.com');
INSERT INTO Employee VALUES (3, 'Mike Johnson', 'mike.johnson@google.com');
INSERT INTO Employee VALUES (4, 'Sara Williams', 'sara.williams@google.com');
INSERT INTO Employee VALUES (5, 'Alex Johnson', 'alex.johnson@google.com');
INSERT INTO Employee VALUES (6, 'Emily Brown', 'emily.brown@google.com');
INSERT INTO Employee VALUES (7, 'William Davis', 'william.davis@google.com');
INSERT INTO Employee VALUES (8, 'Olivia Wilson', 'olivia.wilson@google.com');
INSERT INTO Employee VALUES (9, 'Ethan Miller', 'ethan.miller@google.com');

-- Insert data into Project table
INSERT INTO Project VALUES (1, 'Project A', '2024-01-01', 'Open', NULL);
INSERT INTO Project VALUES (2, 'Project B', '2024-02-01', 'Closed', '2024-03-01');
INSERT INTO Project VALUES (3, 'Project C', '2024-03-01', 'Open', NULL);
INSERT INTO Project VALUES (4, 'Project D', '2024-04-01', 'Open', NULL);

-- Insert data into EmployeeProject table
INSERT INTO EmployeeProject VALUES (1, 1, 1, 'Developer'); 
INSERT INTO EmployeeProject VALUES (2, 1, 2, 'Manager');   
INSERT INTO EmployeeProject VALUES (3, 2, 2, 'Tester');    
INSERT INTO EmployeeProject VALUES (4, 2, 3, 'Designer');  
INSERT INTO EmployeeProject VALUES (5, 3, 3, 'Analyst');   
INSERT INTO EmployeeProject VALUES (6, 3, 4, 'Developer'); 
INSERT INTO EmployeeProject VALUES (7, 4, 4, 'Designer');  
INSERT INTO EmployeeProject VALUES (8, 4, 1, 'Tester');    
INSERT INTO EmployeeProject VALUES (9, 5, 1, 'Manager');   
INSERT INTO EmployeeProject VALUES (10, 6, 3, 'Developer'); 
INSERT INTO EmployeeProject VALUES (11, 7, 4, 'Designer');  
INSERT INTO EmployeeProject VALUES (12, 8, 1, 'Tester');   
INSERT INTO EmployeeProject VALUES (13, 9, 2, 'Manager');   

-- Insert data into Task table
INSERT INTO Task VALUES (1, 1, 'Task 1', '2024-01-05', 'Done', '2024-01-10', 1);
INSERT INTO Task VALUES (2, 2, 'Task 2', '2024-02-10', 'Accepted', '2024-02-12', 2);
INSERT INTO Task VALUES (3, 3, 'Task 3', '2024-03-02', 'Done', '2024-02-05', 2);
INSERT INTO Task VALUES (4, 3, 'Task 4', '2024-03-10', 'Need Work', '2024-03-15', 3);
INSERT INTO Task VALUES (5, 4, 'Task 5', '2024-04-15', 'Open', '2024-04-20', 3);
INSERT INTO Task VALUES (6, 4, 'Task 6', '2024-04-25', 'Done', '2024-04-28', 4);
INSERT INTO Task VALUES (7, 4, 'Task 7', '2024-05-01', 'Need Work', '2024-05-06', 7);
INSERT INTO Task VALUES (8, 2, 'Task 8', '2024-02-13', 'Accepted', '2024-02-15', 1);
INSERT INTO Task VALUES (9, 1, 'Task 9', '2024-01-05', 'Open', '2024-01-10', 8);
INSERT INTO Task VALUES (10, 1, 'Task 11', '2024-02-05', 'Done', '2024-02-01', 4);
INSERT INTO Task VALUES (11, 1, 'Task 13', '2024-03-05', 'Done', '2024-03-10', 5);
INSERT INTO Task VALUES (12, 2, 'Task 10', '2024-02-17', 'Accepted', '2024-03-01', 1);
INSERT INTO Task VALUES (13, 3, 'Task 12', '2024-03-18', 'Need Work', '2024-02-21', 6);
INSERT INTO Task VALUES (14, 4, 'Task 14', '2024-04-18', 'Open', '2024-04-22', 3);
INSERT INTO Task VALUES (15, 1, 'Task 15', '2024-04-05', 'Open', '2024-04-10', 1);
