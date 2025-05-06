const mysql = require('mysql2/promise');
require('dotenv').config();

const pool = mysql.createPool({

    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    useremail: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS

});

module.exports = pool;
