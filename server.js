// 

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const http = require('http');
const socketIo = require('socket.io');
const path = require('path');

const app = express();
const server = http.createServer(app);
const io = require('socket.io')(server, {
  cors: {
    origin: "*", // Cho phép truy cập từ nguồn này
    methods: ["GET", "POST"] // Các phương thức được phép
  }
});

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

// Thêm dòng sau để chỉ định thư mục chứa các tài nguyên tĩnh (ví dụ: tệp HTML, CSS, JavaScript)
app.use(express.static(path.join(__dirname, 'public')));

io.on('connection', (socket) => {
    console.log('New user connected');

    let userId;
    let roomId;

    socket.on('setUserId', (receivedUserId) => {
        userId = receivedUserId;
        roomId = `room_${userId}`;
        console.log(`User connected with userId: ${userId}`);
        console.log(`RoomId for user ${userId}: ${roomId}`);
        socket.join(roomId);
    });

    socket.on('sendMessage', (data) => {
        const { senderId, receiverId, message } = data;
        console.log("đã gửi tin nhắn tới người nhận")
        // Gửi tin nhắn đến roomId của người nhận
        io.to(`room_${receiverId}`).emit('message', data);
    });
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
const tinnhanRoutes = require('./src/routes/tinnhan.route');

// using as middleware
app.use('/api/loaiquyen', loaiquyenRoutes);
app.use('/api/taikhoan', taikhoanRoutes);
app.use('/api/auth', authRoutes);
app.use('/api/danhba', danhbaRoutes);
app.use('/api/nhom', nhomRoutes);
app.use('/api/dsthanhviennhom', dsthanhviennhomRoutes);
app.use('/api/congviec', congviecRoutes);
app.use('/api/tinnhan', tinnhanRoutes);

// listen for requests
const PORT = process.env.PORT || 3003;
server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
