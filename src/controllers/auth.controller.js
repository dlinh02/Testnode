'use strict';
const jwt = require('jsonwebtoken');
const bcryptjs = require('bcryptjs');
const bcrypt = require('bcrypt');
const taikhoan = require('../models/taikhoan.model');

exports.login = async (req, res) => {
    const { sodienthoai, matkhau } = new taikhoan(req.body);

    const tk = taikhoan.findByUsername(u => u.sodienthoai === sodienthoai && u.matkhau === matkhau);
    if (!tk) {
        return res.status(401).json({ message: 'Sai thông tin tài khoản mật khẩu' });
    }
    const token = jwt.sign({ id: tk.mataikhoan, username: tk.sodienthoai }, 'truonglinh', { expiresIn: '1h' });

    res.json({ token });

};

// exports.login = async (req, res) => {
//     const { sodienthoai, matkhau } = req.body;

//     if (!sodienthoai || !matkhau) {
//         return res.status(400).json({ message: 'Vui lòng nhập đầy đủ thông tin' });
//     }

//     try {
//         const tk = await taikhoan.findByUsername(sodienthoai);

//         if (!tk) {
//             return res.status(401).json({ message: 'Tài khoản không tồn tại!' });
//         }

//         const match = await bcryptjs.compare(matkhau, tk.matkhau);

//         if (!match) {
//             return res.status(401).json({ message: 'Số điện thoại hoặc mật khẩu không đúng!' });
//         }

//         const token = jwt.sign({ id: tk.id, username: tk.sodienthoai }, 'truonglinh', { expiresIn: '1h' });

//         res.json({ token });
//     } catch (error) {
//         res.status(500).json({ message: 'Internal server error' });
//     }
// };

