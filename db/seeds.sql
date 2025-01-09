-- Then add in proper order:
INSERT INTO department (name) VALUES 
('Sales'),
('Engineering'),
('Finance'),
('Legal');

-- Wait for department insert to complete, then:
INSERT INTO role (title, salary, department_id) VALUES
('Sales Lead', 110000, 1),
('Salesperson', 85000, 1),
('Lead Engineer', 1500000, 2),
('Software Engineer', 230000, 2),
('Accountant', 135000, 3),
('Legal Team Lead', 220000, 4),
('Lawyer', 215000, 4);

-- Finally add employees
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES
('Eva', 'Valentine', 1, NULL),
('Cindy', 'Franklin', 2, 1),
('Brendan', 'Palmer', 3, NULL),
('Franklin ', 'Cole', 4, 3),
('Hayden', 'Lawson', 5, 3),
('Scarlett', 'Meadows', 5, 3),
('Chelsea', 'Jimenez', 6, NULL),
('Jennifer', 'Fulton', 7, 7);
