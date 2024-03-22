'use strict';
const danhba = require('../models/danhba.model');
const taikhoan = require('../models/taikhoan.model');


exports.add = function(req, res){
    const db = new danhba(req.body);
    delete db.madanhba;

    // kiểm tra dữ liệu có cung cấp đủ hay không
    if(!db.ten || !db.sodienthoai){
        res.status(200).send({success: false, error: true, message: 'Vui lòng nhập đủ thông tin!'});
    } else {
        //kiểm tra số điện thoại đã tồn tại hay chưa
        danhba.findOneContact({ sodienthoai: db.sodienthoai }, db.chudanhba, function (err, existingContact) {
            if (err) {
                console.log('Error in controller:', err);
                res.status(500).send('Internal Server Error');
            } else if (existingContact) { // Số điện thoại đã tồn tại trong danh bạ
                res.status(200).send({ success: false, error: true, message: 'Số điện thoại đã tồn tại.' });
            } else {
                // get mã tài khoản by số điện thoại
                taikhoan.getIdBySDT(db.sodienthoai, function (err, result) {
                    if (err) {
                        console.log('Error in controller:', err);
                        res.status(500).send('Internal Server Error');
                    } else {
                        if (!result || result.length === 0 || !result[0].mataikhoan) {
                            // Nếu không có kết quả trả về từ câu truy vấn hoặc không có 'mataikhoan' trong kết quả
                            res.status(200).send({ success: false, error: true, message: 'Không tìm thấy thông tin tài khoản.' });
                        } else {
                            // Nếu có 'mataikhoan' trong kết quả thì thêm vào danh bạ
                            db.manguoitrongdanhba = result[0].mataikhoan;
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
                });
            }
        });
    }
}

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