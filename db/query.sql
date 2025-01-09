-- View all departments
SELECT * FROM department;

-- View all roles with department names
SELECT r.id, r.title, d.name as department, r.salary 
FROM role r
JOIN department d ON r.department_id = d.id;

-- View all employees with their roles, departments, and managers
SELECT 
    e.id,
    e.first_name,
    e.last_name,
    r.title,
    d.name as department,
    r.salary,
    CONCAT(m.first_name, ' ', m.last_name) as manager
FROM employee e
LEFT JOIN role r ON e.role_id = r.id
LEFT JOIN department d ON r.department_id = d.id
LEFT JOIN employee m ON e.manager_id = m.id;

-- View total budget by department
SELECT 
    d.name as department,
    SUM(r.salary) as total_budget
FROM employee e
JOIN role r ON e.role_id = r.id
JOIN department d ON r.department_id = d.id
GROUP BY d.name;