const express = require('express');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const con = require('./db'); // Database connection module
const app = express();
const cors = require('cors');
app.use(cors());


const JWT_KEY = 'P0rjeCtM0b1le';

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

function verifyUser(req, res, next) {
    let token = req.headers['authorization'] || req.headers['x-access-token'];
    if (token == undefined || token == null) {
        // no token
        return res.status(400).send('No token');
    }
    // token found
    if (req.headers.authorization) {
        const tokenString = token.split(' ');
        if (tokenString[0] == 'Bearer') {
            token = tokenString[1];
        }
    }
    jwt.verify(token, JWT_KEY, (err, decoded) => {
        if (err) {
            res.status(401).send('Incorrect token');
        }
        else if (decoded.role != 'borrower') {
            res.status(403).send('Forbidden to access the data');
        }
        else {
            req.decoded = decoded;
            next();
        }
    });
}

// Endpoint to hash a raw password for testing purposes
app.get('/password/:raw', async (req, res) => {
    const raw = req.params.raw;
    try {
        const hash = await bcrypt.hash(raw, 10);
        res.json({ hash });
    } catch (err) {
        console.error('Error hashing password:', err);
        res.status(500).json({ message: 'Error Hashing Password' });
    }
});

// Login endpoint
app.post('/login', async (req, res) => {
    const { username, password } = req.body;
    console.log('Received login data:', req.body);

    if (!username || !password) {
        return res.status(400).json({ message: 'Username and password are required' });
    }

    const sql = "SELECT * FROM users WHERE username = ?";
    con.query(sql, [username], async (err, results) => {
        if (err) {
            console.error('Database query error:', err);
            return res.status(500).json({ message: 'Server error while querying database' });
        }

        console.log('Query results:', results);

        if (results.length === 0) {
            console.warn('No user found with this username');
            return res.status(401).json({ message: 'Incorrect username or password' });
        }

        const user = results[0];
        const storedHash = user.password;

        console.log('Stored hash from database:', storedHash);
        console.log('Password to compare:', password);

        try {
            const isMatch = await bcrypt.compare(password, storedHash);
            if (!isMatch) {
                console.warn('Password does not match for username:', username);
                return res.status(401).json({ message: 'Incorrect username or password' });
            }

            // Successful login
            const user_id = user.id;
            const role = user.role || 'unknown';
            const payload = { user_id, username, role };

            // Generate JWT token
            const token = jwt.sign(payload, JWT_KEY, { expiresIn: '1d' });

            console.log('User ID:', user_id);
            console.log('Role:', role);
            console.log('Token:', token);

            // Return JSON response with token and user info
            return res.json({
                message: 'Login successful',
                token,
                user: {
                    id: user_id,
                    username,
                    role,
                }
            });
        } catch (err) {
            console.error('Error comparing password hash:', err);
            return res.status(500).json({ message: 'Error comparing password hash' });
        }
    });
});

app.post('/register', async (req, res) => {
    const { name, username, password } = req.body;

    if (!name || !username || !password) {
        return res.status(400).json({ message: 'Name, username and password are required' });
    }

    try {
        // Check if the username already exists
        const checkUserSql = "SELECT * FROM users WHERE username = ?";
        con.query(checkUserSql, [username], async (err, results) => {
            if (err) {
                console.error('Database query error:', err);
                return res.status(500).json({ message: 'Server error while checking username' });
            }

            if (results.length > 0) {
                console.warn('Username already taken:', username);
                return res.status(409).json({ message: 'Username already taken' });
            }

            // Hash the password
            const hashedPassword = await bcrypt.hash(password, 10);

            // Insert the new user into the database
            const insertUserSql = "INSERT INTO users (name, username, password, role) VALUES (?, ?, ?, 'borrower')";
            con.query(insertUserSql, [name, username, hashedPassword], (err, result) => {
                if (err) {
                    console.error('Error inserting user into database:', err);
                    return res.status(500).json({ message: 'Server error while registering user' });
                }

                console.log('User registered with ID:', result.insertId);
                res.status(201).json({ message: 'User registered successfully', user_id: result.insertId });
            });
        });
    } catch (err) {
        console.error('Error hashing password:', err);
        res.status(500).json({ message: 'Error hashing password' });
    }
});

app.post('/books', verifyUser,(req, res) => {
    const sql = "SELECT * FROM book";

    con.query(sql, (err, results) => {
        if (err) {
            console.error('Database query error:', err);
            return res.status(500).json({ message: 'Server error while fetching books' });
        }

        res.status(200).json({ books: results });
    });
});

app.post('/borrower/history', verifyUser, (req, res) => {
    const { user_id, role } = req.body;
    console.log('Received ID: ', user_id);
    console.log('Received Role: ', role);

    if (!user_id || role !== 'borrower') {
        return res.status(400).json({ message: 'Invalid id or role' });
    }

    // Query to retrieve borrowing history for the specific user
    const query = `
        SELECT h.history_id, h.book_id, h.borrow_date, h.return_date, h.approver_id, h.staff_id,
               CASE 
                   WHEN h.approver_id IS NULL AND h.staff_id IS NULL THEN 'pending'
                   WHEN h.approver_id IS NOT NULL AND h.staff_id IS NULL THEN 'borrowed'
                   WHEN h.approver_id IS NOT NULL AND h.staff_id IS NOT NULL THEN 'available'
                   ELSE 'available'
               END AS book_status,
               b.book_name, b.book_details
        FROM history h
        JOIN book b ON h.book_id = b.book_id
        WHERE h.borrower_id = ?
    `;

    con.query(query, [user_id], (err, results) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({ message: 'Database error' });
        }

        if (results.length === 0) {
            return res.status(404).json({ message: 'No borrowing history found' });
        }

        return res.status(200).json({ history: results });
    });
});

app.post('/lender/history', (req, res) => {
    const { user_id, role } = req.body;
    console.log('Received ID: ', user_id);
    console.log('Received Role: ', role);

    if (!user_id || role !== 'lender') {
        return res.status(400).json({ message: 'Invalid id or role' });
    }

    // Query to retrieve books requested by borrowers
    const query = `
        SELECT h.history_id, h.book_id, h.borrow_date, h.return_date, h.approver_id, h.staff_id,
               CASE 
                   WHEN h.approver_id IS NULL AND h.staff_id IS NULL THEN 'pending'
                   WHEN h.approver_id IS NOT NULL AND h.staff_id IS NULL THEN 'borrowed'
                   WHEN h.approver_id IS NOT NULL AND h.staff_id IS NOT NULL THEN 'available'
                   ELSE 'available'
               END AS book_status,
               b.book_name, b.book_details
        FROM history h
        JOIN book b ON h.book_id = b.book_id
        WHERE h.approver_id = ?
    `;

    con.query(query, [user_id], (err, results) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({ message: 'Database error' });
        }

        if (results.length === 0) {
            return res.status(404).json({ message: 'No pending requests found' });
        }

        return res.status(200).json({ history: results });
    });
});

app.post('/staff/history', (req, res) => {
    const { role } = req.body;

    console.log('Received role:', role);

    if (role !== 'staff') {
        return res.status(400).json({ message: 'Invalid role' });
    }

    const sql = `
        SELECT 
            book.book_name,
            book_image,
            history.borrow_date,
            history.return_date,
            history.approve_date,
            borrower.username AS borrower_name,
            approver.username AS approver_name,
            reclaimer.username AS asset_reclaimer_name,
            CASE
                WHEN history.approve_date IS NULL THEN 'pending'
                WHEN history.return_date IS NULL THEN 'Approved'
                ELSE 'Returned'
            END AS book_status
        FROM history
        JOIN book ON history.book_id = book.book_id
        LEFT JOIN users AS borrower ON history.borrower_id = borrower.id
        LEFT JOIN users AS approver ON history.approver_id = approver.id
        LEFT JOIN users AS reclaimer ON history.staff_id = reclaimer.id;
    `;

    con.query(sql, (err, results) => {
        if (err) {
            console.error("Database error:", err);
            return res.status(500).json({ message: 'Database error while fetching history' });
        }
        if (results.length === 0) {
            return res.status(404).json({ message: 'No history found' });
        }
        res.json(results);
    });
});

app.get('/dashboard', (req, res) => {
    const sql = `
      SELECT 
        COUNT(CASE WHEN status = 'available' THEN 1 END) AS available,
        COUNT(CASE WHEN status = 'pending' THEN 1 END) AS pending,
        COUNT(CASE WHEN status = 'borrowed' THEN 1 END) AS borrowed,
        COUNT(CASE WHEN status = 'disabled' THEN 1 END) AS disabled
      FROM book;
    `;

    // Execute the query
    con.query(sql, (err, results) => {
        if (err) {
            console.error('Error executing query:', err);
            return res.status(500).json({ message: 'Database error' });
        }

        // Extract the data from the results and send it as a response
        const { available, pending, borrowed, disabled } = results[0];
        return res.status(200).json({
            dashboard: {
                available,
                pending,
                borrowed,
                disabled
            }
        });
    });
});

app.get('/borrower/status', verifyUser, (req, res) => {
    // Extract token from the Authorization header
    const token = req.headers.authorization?.split(' ')[1];
    
    if (!token) {
        return res.status(401).json({ message: 'Authorization token required' });
    }

    try {
        // Verify token and extract payload
        const decoded = jwt.verify(token, JWT_KEY);
        const user_id = decoded.user_id;

        console.log('Decoded user ID:', user_id);

        const sql = `
            SELECT book.book_name, book.status, history.borrow_date
            FROM book
            JOIN history ON book.book_id = history.book_id
            WHERE history.borrower_id = ?
        `;

        con.query(sql, [user_id], (err, results) => {
            if (err) {
                console.error('Database error:', err);
                return res.status(500).json({ message: 'Database server error' });
            }

            // If no records found
            if (results.length === 0) {
                return res.status(404).json({ message: 'No books found for this user' });
            }

            // Return the results as a JSON response
            return res.status(200).json({
                message: 'Borrowed books retrieved successfully',
                books: results
            });
        });
    } catch (err) {
        console.error('Token verification error:', err);
        return res.status(403).json({ message: 'Invalid or expired token' });
    }
});

app.post('/request', verifyUser,(req, res) => {
    const { user_id, book_id } = req.body;
    console.log('Received User ID:', user_id);
    console.log('Received Book ID:', book_id);

    if (!user_id || !book_id) {
        return res.status(400).json({ message: 'User ID and Book ID are required' });
    }

    // Step 1: Check if the book is already in 'pending' or 'disabled' status
    const checkStatusSql = `
        SELECT status
        FROM book
        WHERE book_id = ?
    `;

    con.query(checkStatusSql, [book_id], (err, results) => {
        if (err) {
            console.error('Error checking book status:', err);
            return res.status(500).json({ message: 'Database error' });
        }

        if (results.length === 0) {
            return res.status(404).json({ message: 'Book not found' });
        }

        const bookStatus = results[0].status;

        if (bookStatus === 'pending' || bookStatus === 'disabled') {
            // If the book is pending or disabled, send a message back to the user
            return res.status(400).json({ message: 'This book is currently unavailable for request.' });
        }

        // Step 2: Insert a new record into the history table to record the borrowing request
        const insertHistorySql = `
            INSERT INTO history (book_id, borrower_id, borrow_date)
            VALUES (?, ?, NOW())
        `;

        con.query(insertHistorySql, [book_id, user_id], (insertErr, insertResults) => {
            if (insertErr) {
                console.error('Error inserting borrow request into history:', insertErr);
                return res.status(500).json({ message: 'Database error' });
            }

            // Step 3: Update the book's status to 'pending' to indicate that it has been requested
            const updateBookStatusSql = `
                UPDATE book
                SET status = 'pending'
                WHERE book_id = ?
            `;

            con.query(updateBookStatusSql, [book_id], (updateErr, updateResults) => {
                if (updateErr) {
                    console.error('Error updating book status:', updateErr);
                    return res.status(500).json({ message: 'Database error' });
                }

                return res.status(200).json({ message: 'Book request successful. The book is now pending.' });
            });
        });
    });
});

app.get('/request/Lender', (req, res) => {

    const checkHistorySql = `
        SELECT history_id, book_id, borrower_id, borrow_date
        FROM history
        WHERE staff_id IS NULL AND approver_id IS NULL AND approve_date IS NULL AND return_date IS NULL
    `;

    con.query(checkHistorySql, (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).json({ message: 'Error' });
        }

        console.log('SQL Query Results:', results); // Log the results to the console for debugging

        if (results.length > 0) {
            // If there's an entry with missing staff_id, approver_id, or approve_date, respond with "Acception Done"
            return res.status(200).json({ message: 'Acception Done :', results });
        } else {
            // If no matching entry found, respond with "No accept"
            return res.status(200).json({ message: 'No accept' });
        }
    });
});

app.post('/return/borrower', verifyUser,(req, res) => {
    const { borrower_id } = req.body; // Only borrower_id is required

    // Check if required fields are provided
    if (!borrower_id) {
        return res.status(400).json({ message: 'Borrower ID is required' });
    }

    // SQL query to update the return_date for the specified borrower_id to NOW()
    const updateHistorySql = `
        UPDATE history
        SET return_date = NOW()
        WHERE borrower_id = ?
    `;

    con.query(updateHistorySql, [borrower_id], (err, result) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).json({ message: 'Error' });
        }

        if (result.affectedRows === 0) {
            // If no rows were affected, the borrower_id may not exist
            return res.status(404).json({ message: 'Borrower ID not found' });
        }

        // Successful update response
        return res.status(200).json({ message: 'Return date set to now successfully' });
    });
});

app.get('/request/staff', (req, res) => {

    const checkHistorySql = `
        SELECT history_id, book_id, borrower_id, borrow_date
        FROM history
        WHERE staff_id IS NULL AND approver_id IS NULL AND approve_date IS NULL AND return_date IS NOT NULL
    `;

    con.query(checkHistorySql, (err, results) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).json({ message: 'Error' });
        }

        console.log('SQL Query Results:', results); // Log the results to the console for debugging

        if (results.length > 0) {
            // If there's an entry with missing staff_id, approver_id, or approve_date, respond with "Acception Done"
            return res.status(200).json({ message: 'Acception Done :', results });
        } else {
            // If no matching entry found, respond with "No accept"
            return res.status(200).json({ message: 'No accept' });
        }
    });
});

app.post('/add-book', (req, res) => {
    const { book_name, book_details, book_image } = req.body;

    if (!book_name || !book_details || !book_image) {
        return res.status(400).json({ message: 'Book name, details, and image are required' });
    }

    // SQL query to insert a new book with status set to 'available' by default
    const sql = `
        INSERT INTO book (book_name, book_details, book_image, status)
        VALUES (?, ?, ?, 'available')
    `;

    con.query(sql, [book_name, book_details, book_image], (err, results) => {
        if (err) {
            console.error('Error adding new book:', err);
            return res.status(500).json({ message: 'Database error' });
        }

        return res.status(201).json({ message: 'Book added successfully', bookId: results.insertId });
    });
});

app.post('/edit', (req, res) => {
    const { id, book_name, category, status, book_details, book_image } = req.body;

    // Check if required fields are provided
    if (!id) {
        return res.status(400).json({ message: 'ID is required' });
    }

    // Prepare the SQL query to update the book table
    const updateHistorySql = `
        UPDATE book
        SET 
            book_name = COALESCE(?, book_name),
            category = COALESCE(?, category),
            status = COALESCE(?, status),
            book_details = COALESCE(?, book_details),
            book_image = COALESCE(?, book_image)
        WHERE book_id = ?
    `;

    // Use an array to hold the values for the query
    const values = [book_name, category, status, book_details, book_image, id];

    con.query(updateHistorySql, values, (err, result) => {
        if (err) {
            console.error('Database error:', err);
            return res.status(500).json({ message: 'Error updating book record' });
        }

        if (result.affectedRows === 0) {
            // If no rows were affected, the id may not exist
            return res.status(404).json({ message: 'ID not found' });
        }

        // Successful update response
        return res.status(200).json({ message: 'Book record updated successfully' });
    });
});

app.post('/logout', (req, res) => {
    req.session.destroy(err => {
        if (err) {
            console.error('Error logging out:', err);
            return res.status(500).json({ message: 'Error logging out' });
        }
        res.status(200).json({ message: 'Logout successful' });
    });
});

// Start the server
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server is running at port ${PORT}`);
});