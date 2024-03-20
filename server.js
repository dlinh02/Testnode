const express = require('express');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');

/// bỏ
// create express app
const app = express();

// Setup server port
const port = 3003;

// Thay đổi secret key này bằng một secret key thực tế trong môi trường production
const secretKey = 'your_secret_key';

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

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
const loaiquyenRoutes = require('./src/routes/loaiquyen.route')
const taikhoanRoutes = require('./src/routes/taikhoan.route');


// using as middleware
app.use('/api/loaiquyen', loaiquyenRoutes)
app.use('/api/taikhoan', taikhoanRoutes)

app.post('/login', (req, res) => {

  const users = [
    { id: 1, username: '123', password: '123' },
    { id: 2, username: 'user2', password: 'password2' }
  ];

  const { username, password } = req.body;
  
  // Kiểm tra thông tin đăng nhập
  const user = users.find(u => u.username === username && u.password === password);
  if (!user) {
    return res.status(401).json({ message: 'Sai thông tin tài khoản mật khẩu' });
  }

  // Tạo token và trả về cho người dùng
  const token = jwt.sign({ id: user.id, username: user.username }, secretKey, { expiresIn: '1h' });
  res.json({ token });
});



function authenticateToken(req, res, next) {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];

  if (!token) {
      return res.status(401).json({ message: 'Unauthorized' });
  }

  jwt.verify(token, secretKey, (err, user) => {
      if (err) {
          return res.status(403).json({ message: 'Token is not valid' });
      }
      req.user = user;
      next();
  });
}

// Route bảo vệ yêu cầu cần xác thực
app.get('/protected', authenticateToken, (req, res) => {
  res.json({ message: 'Protected route', user: req.user });
});


// listen for requests
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});

