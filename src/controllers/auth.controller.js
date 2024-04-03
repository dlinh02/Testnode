'use strict';
const jwt = require('jsonwebtoken');
const bcryptjs = require('bcryptjs');
const bcrypt = require('bcrypt');
const taikhoan = require('../models/taikhoan.model');


exports.login = async function (req, res) {
    const { sodienthoai, matkhau } = req.body;

    if (!sodienthoai || !matkhau) {
        return res.status(200).json({ message: 'Vui lòng nhập đầy đủ thông tin' });
    }

    try {
        const tk = await taikhoan.findByUsername(sodienthoai);

        if (!tk || tk.length === 0) {
            return res.status(200).json({success:false, message: 'Tài khoản không tồn tại!' });
        }

        if (matkhau !== tk[0].matkhau) {
            return res.status(200).json({success:false,  message: 'Sai mật khẩu!' });
        }

        const token = jwt.sign({ id: tk[0].mataikhoan, username: tk[0].sodienthoai, password:tk[0].matkhau, email:tk[0].email, address:tk[0].diachi, fisrtname:tk[0].hodem, lastname:tk[0].ten, dob:tk[0].ngaysinh, gender:tk[0].gioitinh }, process.env.SECRET_KEY, { expiresIn: '1h' });
        res.json({success:true,  token });
    } catch (error) {
        console.error('Error:', error);
        res.status(500).json({ message: 'Đã xảy ra lỗi khi đăng nhập.' });
    }
};


exports.logout = async (req, res) => {
    res.clearCookie('token');
    res.status(200).json({success:true}).end();
};
