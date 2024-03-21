'use strict';
const taikhoan = require('../models/taikhoan.model');

exports.getAll = function (req, res) {
    taikhoan.getAll(function (err, taikhoanData) {
        if (err) {
            console.log('Error in controller:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('Controller:', taikhoanData);
            res.send(taikhoanData);
        }
    });
};

// exports.create = function (req, res) {
//     const tk = new taikhoan(req.body);
//     //không thêm mataikhoan
//     delete tk.mataikhoan;
//     delete tk.trangthai;

//     // Kiểm tra dữ liệu có được cung cấp không
//     if (!tk.sodienthoai || !tk.matkhau || !tk.email || !tk.diachi || !tk.hodem || !tk.ten || !tk.ngaysinh || !tk.gioitinh) {
//         res.status(400).send({success: false, error: true, message: 'Vui lòng cung cấp đầy đủ thông tin!' });
//     } else {
//         taikhoan.create(tk, function (err, taikhoan) {
//             if (err) {
//                 console.log('Error in controller:', err);
//                 res.status(500).send('Internal Server Error');
//             } else {
//                 res.status(201).send({success: true, error: false, message: "Tài khoản đã được tạo thành công!", data: taikhoan });
//             }
//         });
//     }
// };

exports.create = function (req, res) {
    const tk = new taikhoan(req.body);
    // Không thêm mã tài khoản và trạng thái
    delete tk.mataikhoan;
    delete tk.trangthai;

    // Kiểm tra dữ liệu có được cung cấp không
    if (!tk.sodienthoai || !tk.matkhau || !tk.email || !tk.diachi || !tk.hodem || !tk.ten || !tk.ngaysinh || !tk.gioitinh) {
        res.status(200).send({ success: false, error: true, message: 'Vui lòng cung cấp đầy đủ thông tin!' });
    } else {
        // Kiểm tra số điện thoại và email đã tồn tại trong cơ sở dữ liệu chưa
        taikhoan.findOne({ sodienthoai: tk.sodienthoai }, function (err, existingUser) {
            if (err) {
                console.log('Error in controller:', err);
                res.status(500).send('Internal Server Error');
            } else if (existingUser) {
                // Số điện thoại đã tồn tại trong cơ sở dữ liệu
                res.status(200).send({ success: false, error: true, message: 'Số điện thoại đã tồn tại.' });
            } else {
                // Kiểm tra email đã tồn tại trong cơ sở dữ liệu chưa
                taikhoan.findOne({ email: tk.email }, function (err, existingEmail) {
                    if (err) {
                        console.log('Error in controller:', err);
                        res.status(500).send('Internal Server Error');
                    } else if (existingEmail) {
                        // Email đã tồn tại trong cơ sở dữ liệu
                        res.status(400).send({ success: false, error: true, message: 'Email đã tồn tại.' });
                    } else {
                        // Nếu không có số điện thoại hoặc email nào tồn tại trong cơ sở dữ liệu, tạo tài khoản mới
                        taikhoan.create(tk, function (err, insertedId) {
                            if (err) {
                                console.log('Error in controller:', err);
                                res.status(500).send('Internal Server Error');
                            } else {
                                tk.mataikhoan = insertedId;
                                res.status(201).send({ success: true, error: false, message: "Tài khoản đã được tạo thành công!", data: tk });
                            }
                        });
                    }
                });
            }
        });
    }
};

exports.update = function (req, res) {
    if (req.body.constructor === Object && Object.keys(req.body).length === 0) {
        res.status(400).send({ error: true, message: 'Vui lòng cung cấp đầy đủ thông tin!' });
    } else {
        taikhoan.update(req.params.mataikhoan, new taikhoan(req.body), function (err, taikhoan) {
            if (err)
                res.send({success: false, err});
            res.json({success: true, error: false, message: 'Cập nhật thành công!' });
        });
    }
};

exports.delete = function (req, res) {
    taikhoan.delete(req.params.mataikhoan, function (err, taikhoan) {
        if (err)
            res.send({success: false, err});
        res.json({ success: true, error: false, message: 'Xoá tài khoản thành công!' });
    });
};

