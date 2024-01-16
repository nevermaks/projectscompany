-- Use the Task1 database
USE Task1;


-- Task 1: Retrieve a list of all roles with the number of employees for each role
SELECT *
FROM EmployeeProject

SELECT EmployeeRole, COUNT(EmployeeID) AS EmployeeCount
FROM EmployeeProject
GROUP BY EmployeeRole;


-- Task 2: Get roles with no employees assigned
--Create temporary table
CREATE TABLE #Role (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50) UNIQUE
);


INSERT INTO #Role VALUES (1, 'Developer');
INSERT INTO #Role VALUES (2, 'Manager');
INSERT INTO #Role VALUES (3, 'Tester');
INSERT INTO #Role VALUES (4, 'Designer');
INSERT INTO #Role VALUES (5, 'Analyst');
INSERT INTO #Role VALUES (6, 'Statistician');

SELECT *
FROM EmployeeProject
SELECT *
FROM #Role

SELECT r.RoleName, s.EmployeeCount
FROM #Role AS r
LEFT JOIN (SELECT EmployeeRole, COUNT(EmployeeID) AS EmployeeCount
FROM EmployeeProject
GROUP BY EmployeeRole) as s
ON r.RoleName = s.EmployeeRole
WHERE s.EmployeeCount IS NULL


-- Task 3: Get projects list with roles and the number of employees
SELECT *
FROM EmployeeProject
SELECT *
FROM Project

SELECT p.Name as Project_name, e.EmployeeRole, COUNT(e.EmployeeID) as number_employees
FROM EmployeeProject AS e
INNER JOIN Project AS p
ON e.ProjectID = p.ProjectID
GROUP BY p.Name, e.EmployeeRole
ORDER BY Project_name


-- Task 4: For every project, count the average number of tasks assigned to each employee
SELECT *
FROM Project
SELECT *
FROM Employee

SELECT p.Name, e.EmployeeName, COUNT(t.TaskID) as TasksPerEmployee
FROM Task as t
INNER JOIN Project as p
ON t.ProjectID = p.ProjectID
INNER JOIN Employee as e
ON t.EmployeeID = e.EmployeeID
GROUP BY p.Name, e.EmployeeName


-- Task 5: Determine the duration for each project
SELECT *
FROM Project
SELECT *
FROM Task

SELECT p1.name, DATEDIFF(day, CreationDate, lastdate) AS durationbydays
FROM Project as p1
INNER JOIN 
(SELECT ProjectID, MAX(ChangeDate) as lastdate 
FROM Task
GROUP BY ProjectID) as t1
ON p1.ProjectID = t1.ProjectID


-- Task 6: Identify employees with the lowest number of tasks with non-closed statuses
SELECT *
FROM Project
SELECT *
FROM Employee;

WITH cte (EmployeeName,TasksPerEmployee)  AS (SELECT e.EmployeeName as EmployeeName, COUNT(t.TaskID) as TasksPerEmployee
FROM Task as t
INNER JOIN Project as p
ON t.ProjectID = p.ProjectID
INNER JOIN Employee as e
ON t.EmployeeID = e.EmployeeID
WHERE t.Status <> 'Accepted'
GROUP BY e.EmployeeName)
SELECT EmployeeName, TasksPerEmployee
FROM (SELECT EmployeeName, TasksPerEmployee, RANK () OVER(ORDER BY TasksPerEmployee) as ranks
FROM cte) as t2
WHERE ranks = 1


-- Task 7: Identify employees with the most tasks with non-closed statuses and failed deadlines
SELECT *
FROM Task
SELECT *
FROM Employee;

WITH NonClosedFailedTasks AS (
    SELECT t.EmployeeID, e.EmployeeName, COUNT(t.TaskID) AS NonClosedFailedTaskCount
    FROM Task t
    JOIN Employee e 
	ON t.EmployeeID = e.EmployeeID
    WHERE t.Status <> 'Accepted' AND t.ChangeDate > t.AssignmentDate
    GROUP BY t.EmployeeID, e.EmployeeName)
SELECT EmployeeName
FROM NonClosedFailedTasks
WHERE NonClosedFailedTaskCount = (SELECT MAX(NonClosedFailedTaskCount) FROM NonClosedFailedTasks);


-- Task 8: Move forward deadline for non-closed tasks by 5 days
SELECT *
FROM Task

UPDATE Task
SET ChangeDate = DATEADD(DAY, 5, ChangeDate)
WHERE Status <> 'Closed';

SELECT *
FROM Task


-- Task 9: For each project, count the number of tasks that were not started yet
SELECT *
FROM Project
SELECT *
FROM Task

SELECT
    p.ProjectID,
    p.Name AS ProjectName,
    COUNT(t.TaskID) AS NotStartedTaskCount
FROM Project p
LEFT JOIN Task t ON p.ProjectID = t.ProjectID
WHERE t.Status = 'Open'
GROUP BY p.ProjectID, p.Name;


-- Task 10: For each project with all tasks marked as closed, move status to closed(accepted)- because it has already been closed
SELECT *
FROM Project

UPDATE Project
SET State = 'Closed(accepted)', CloseDate = t.LastAcceptedTaskChangeDate
FROM (
    SELECT
        p.ProjectID,
        MAX(t.ChangeDate) AS LastAcceptedTaskChangeDate
    FROM Project p
    JOIN Task t ON p.ProjectID = t.ProjectID
    WHERE t.Status = 'Accepted'
    GROUP BY p.ProjectID
) t
WHERE Project.ProjectID = t.ProjectID;

SELECT *
FROM Project


-- Task 11: Determine employees across all projects with no non-closed tasks assigned
SELECT*
FROM Employee

SELECT e.EmployeeID, e.EmployeeName
FROM Employee e
WHERE NOT EXISTS (
    SELECT 1
    FROM Task t
    WHERE e.EmployeeID = t.EmployeeID
      AND t.Status <> 'Closed'
);


-- Task 12: Assign a given project task to an employee with the minimum number of tasks with open status
SELECT *
FROM Task;

WITH cte (EmployeeName,TasksPerEmployee)  AS (SELECT e.EmployeeName as EmployeeName, COUNT(t.TaskID) as TasksPerEmployee
FROM Task as t
INNER JOIN Project as p
ON t.ProjectID = p.ProjectID
INNER JOIN Employee as e
ON t.EmployeeID = e.EmployeeID
WHERE t.Status = 'Open'
GROUP BY e.EmployeeName)
SELECT TOP 1 EmployeeName, TasksPerEmployee
FROM (SELECT EmployeeName, TasksPerEmployee, RANK () OVER(ORDER BY TasksPerEmployee) as ranks
FROM cte) as t2
WHERE ranks = 1

INSERT INTO Task (TaskID, ProjectID, Taskdescp, AssignmentDate, Status, ChangeDate, EmployeeID)
VALUES (16, 1, 'Task 16', '2024-05-01', 'Open', '2024-05-15', 1);
SELECT *
FROM Task