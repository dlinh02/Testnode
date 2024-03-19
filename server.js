const express = require('express');
const bodyParser = require('body-parser');

/// test up main
// create express app
const app = express();

// Setup server port
const port = 3003;

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

// parse requests of content-type - application/json
app.use(bodyParser.json())

// define a root route
app.get('/', (req, res) => {
  res.send("Welcome to my web server");
});

// Require loaiquyen routes
const loaiquyenRoutes = require('./src/routes/loaiquyen.route')
const taikhoanRoutes = require('./src/routes/taikhoan.route')

// using as middleware
app.use('/api/loaiquyen', loaiquyenRoutes)
app.use('/api/taikhoan', taikhoanRoutes)

// listen for requests
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});

