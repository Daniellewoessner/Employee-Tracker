import express from 'express';
import { pool, connectToDb } from './connection.js';
import { QueryResult } from 'pg';

await connectToDb();

const PORT = process.env.PORT || 3001;
const app = express();

// Express middleware
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Select All Employees

    pool.query('SELECT id, first_name, last_name FROM employee', (err: Error, result: QueryResult) => {
        if (err) {
            console.log(err);
        } else if (result) {
            console.log(result.rows);
        }
    });

    


// Delete an employee

   pool.query(`DELETE FROM employee WHERE id = $1`, (err: Error, result: QueryResult) => {
    if (err) {
        console.log(err);
    } else if (result) {
        console.log(result.rows);
    }
});

// Read list of all employees and roles using LEFT JOIN
pool.query('SELECT e.id, e.first_name, e.last_name, r.title AS role FROM employee e LEFT JOIN role r ON e.role_id = r.id ORDER BY e.last_name, e.first_name', (err: Error, result: QueryResult) => {
    if (err) {
        console.log(err);
    } else if (result) {
        console.log(result.rows);
    }
});

// Update employee role

    pool.query(`UPDATE employee SET role_id = $1 WHERE id = $2`, (err: Error, result: QueryResult) => {
        if (err) {
            console.log(err);
        } else if (result.rowCount === 0) {
            console.log('Employee not found');
        } else {
            console.log('Success!');
        }
    });


// Default response for any other request (Not Found)
app.use((req, res) => {
    res.status(404).end();
});

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
