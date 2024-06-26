'use strict';
const danhba = require('../models/danhba.model');
const taikhoan = require('../models/taikhoan.model');


exports.add = function (req, res) {
    const db = new danhba(req.body);
    delete db.madanhba;

    // kiểm tra dữ liệu có cung cấp đủ hay không
    if (!db.ten || !db.sodienthoai) {
        res.status(200).send({ success: false, error: true, message: 'Vui lòng nhập đủ thông tin!' });
    } else {
        //kiểm tra số điện thoại đã tồn tại hay chưa
        danhba.findOneContact({ sodienthoai: db.sodienthoai }, db.chudanhba, function (err, existingContact) {
            if (err) {
                console.log('Error in controller:', err);
                res.status(500).send('Internal Server Error');
            } else if (existingContact) { // Số điện thoại đã tồn tại trong danh bạ
                if (existingContact.trangthai === 1) {
                    res.status(200).json({ success: false, error: true, message: 'Số điện thoại đã tồn tại!' });
                } else {
                    // Cập nhật thông tin liên hệ
                    danhba.updateAddContact(db.sodienthoai, db.ten, function (err, resup) {
                        if (err) {
                            console.log('Error in controller:', err);
                            res.status(500).json({ success: false, error: true, message: 'Internal Server Error' });
                        } else {
                            res.status(200).json({ success: true, error: false, message: "Danh bạ đã được thêm thành công!" });
                        }
                    });
                }

            } else {
                // get mã tài khoản by số điện thoại
                taikhoan.getIdBySDT(db.sodienthoai, function (err, result) {
                    if (err) {
                        console.log('Error in controller:', err);
                        res.status(500).send('Internal Server Error');
                    } else {
                        if (!result || result.length === 0 || !result[0].mataikhoan) {
                            // Nếu không có kết quả trả về từ câu truy vấn hoặc không có 'mataikhoan' trong kết quả
                            res.status(200).send({ success: false, error: true, message: 'Không tìm thấy thông tin tài khoản!' });
                        } else {
                            db.manguoitrongdanhba = result[0].mataikhoan;
                            // Kiểm tra chủ danh bạ và người được thêm vào danh bạ
                            if (db.manguoitrongdanhba == db.chudanhba) {
                                // Nếu trùng nhau
                                res.status(200).send({ success: false, error: true, message: 'Bạn không thể thêm chính mình vào danh bạ!' });
                            } else {
                                // thêm vào danh bạ
                                console.log(db.manguoitrongdanhba);
                                danhba.add(db, function (err, insertedId) {
                                    if (err) {
                                        console.log('Error in controller:', err);
                                        res.status(500).send('Internal Server Error');
                                    } else {
                                        res.status(200).send({ success: true, error: false, message: "Danh bạ đã được thêm thành công!" });
                                    }
                                });
                            }
                        }
                    }
                });
            }
        });
    }
}

exports.findByUsernameOrPhone = function (req, res) {
    let search = req.params.id; // hoặc req.query.id tùy thuộc vào cách bạn gửi dữ liệu từ client

    danhba.findByUsernameOrPhone(search, function (err, dba) {
        if (err) {
            console.log('Error in controller:', err);
            res.status(500).send('Internal Server Error');
        } else {
            if (!dba || dba.length === 0) { // Kiểm tra nếu không có kết quả
                res.status(200).send({ success: false, error: true, message: 'Không tìm thấy thông tin tài khoản!' });
            } else {
                console.log('Controller:', dba);
                res.send(dba);
            }
        }
    });
};


exports.getAllContact = function (req, res) {
    danhba.getAllContact(req.params.chudanhba, function (err, dsdanhba) {
        if (err) {
            console.log('Error in controller:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('Controller:', dsdanhba);
            res.send(dsdanhba);
        }
    });
}

exports.deleteContact = function (req, res) {
    danhba.deleteContact(req.params.madanhba, function (err, danhba) {
        if (err)
            res.send({ success: false, err });
        res.json({ success: true, error: false, message: 'Xoá danh bạ thành công!' });
    });
};

exports.updateContact = function (req, res) {
    danhba.updateContact(req.body.ten, req.body.madanhba, function (err, danhba) {
        if (err)
            res.send({ success: false, err });
        res.json({ success: true, error: false, message: 'Cập nhật thành công!' });
    })
};