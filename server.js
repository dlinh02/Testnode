const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
/// bỏ
// create express app
const app = express();

// Setup server port
const port = 3003;

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

app.use(cors({
  origin: '*', // Cho phép truy cập từ tất cả các nguồn
  methods: ['GET', 'POST', 'PUT', 'DELETE'], // Các phương thức được cho phép
  allowedHeaders: ['Content-Type', 'Authorization'], // Các tiêu đề được cho phép
}));

// parse requests of content-type - application/json
app.use(bodyParser.json())

app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  res.header('Cross-Origin-Resource-Policy', 'strict-origin-when-cross-origin');
  next();
});




// define a root route
app.get('/', (req, res) => {
  res.send("Welcome to my web server");
});

// Require loaiquyen routes
const loaiquyenRoutes = require('./src/routes/loaiquyen.route');
const taikhoanRoutes = require('./src/routes/taikhoan.route');
const authRoutes = require('./src/routes/auth.route');
const danhbaRoutes = require('./src/routes/danhba.route');
const nhomRoutes = require('./src/routes/nhom.route');
const dsthanhviennhomRoutes = require('./src/routes/dsthanhviennhom.route');
const congviecRoutes = require('./src/routes/congviec.route');


// const authenticateToken = require('./middlewares/authenticateToken');

// using as middleware
app.use('/api/loaiquyen', loaiquyenRoutes);
app.use('/api/taikhoan', taikhoanRoutes);
app.use('/api/auth', authRoutes);
app.use('/api/danhba', danhbaRoutes);
app.use('/api/nhom', nhomRoutes);
app.use('/api/dsthanhviennhom', dsthanhviennhomRoutes);
app.use('/api/congviec', congviecRoutes);


// listen for requests
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});

