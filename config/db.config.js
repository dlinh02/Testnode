'use strict';
const mysql = require('mysql2');
const mysql2 = require('mysql2/promise');
require('dotenv').config()

//local mysql db connection
const dbConn = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
  ssl: {
    mode: 'REQUIRED',
    rejectUnauthorized: false // Bỏ qua xác thực chứng chỉ SSL
}
});

// const dbConn = mysql.createConnection({
//   host: 'mysql-363befa2-dotruong0704-3c7a.a.aivencloud.com',
//   port: 21472,
//   user: 'avnadmin',
//   password: 'AVNS_Zjx5zL1wIMwR2bVm7Ub',
//   database: 'defaultdb',
//   ssl: {
//       mode: 'REQUIRED',
//       rejectUnauthorized: false // Bỏ qua xác thực chứng chỉ SSL
//   }
// });


dbConn.connect(function (err) {
  if (err) throw err;
  console.log("Database Connected!");
});

module.exports = dbConn;