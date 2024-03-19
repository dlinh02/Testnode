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

exports.create = function (req, res) {
    const tk = new taikhoan(req.body);
    //không thêm mataikhoan
    delete tk.mataikhoan;
    delete tk.trangthai;

    // Kiểm tra dữ liệu có được cung cấp không
    if (!tk.sodienthoai || !tk.matkhau || !tk.email || !tk.diachi || !tk.hodem || !tk.ten || !tk.ngaysinh || !tk.gioitinh) {
        res.status(400).send({ error: true, message: 'Vui lòng cung cấp đủ thông tin' });
    } else {
        taikhoan.create(tk, function (err, taikhoan) {
            if (err) {
                console.log('Error in controller:', err);
                res.status(500).send('Internal Server Error');
            } else {
                res.status(201).send({ error: false, message: "Tài khoản đã được tạo thành công!", data: taikhoan });
            }
        });
    }
};

exports.update = function (req, res) {
    if (req.body.constructor === Object && Object.keys(req.body).length === 0) {
        res.status(400).send({ error: true, message: 'Vui lòng cung cấp đày đủ thông tin' });
    } else {
        taikhoan.update(req.params.mataikhoan, new taikhoan(req.body), function (err, taikhoan) {
            if (err)
                res.send(err);
            res.json({ error: false, message: 'Cập nhật thành công!' });
        });
    }
};

exports.delete = function (req, res) {
    taikhoan.delete(req.params.mataikhoan, function (err, taikhoan) {
        if (err)
            res.send(err);
        res.json({ error: false, message: 'Xoá tài khoản thành công!' });
    });
};

