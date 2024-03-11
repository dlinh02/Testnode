'use strict';
var dbConn = require('./../../config/db.config');

var taikhoan = function taikhoan(taikhoan) {
    this.mataikhoan = taikhoan.mataikhoan;
    this.sodienthoai = taikhoan.sodienthoai;
    this.matkhau = taikhoan.matkhau;
    this.email = taikhoan.email;
    this.diachi = taikhoan.diachi;
    this.hodem = taikhoan.hodem;
    this.ten = taikhoan.ten;
    this.ngaysinh = taikhoan.ngaysinh;
    this.gioitinh = taikhoan.gioitinh;
}

taikhoan.getAll = function (result) {
    dbConn.query("SELECT * FROM taikhoan", function (err, res) {
        if (err) {
            console.log("Error:", err);
            result(err, null);
        } else {
            console.log(res);
            result(null, res);
        }
    });
};

taikhoan.create = function (tk, result) {
    dbConn.query("INSERT INTO taikhoan set ?", tk, function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(err, null);
        }
        else {
            console.log(res.insertId);
            result(null, res.insertId);
        }
    });
};

taikhoan.update = function (mataikhoan, taikhoan, result) {
    dbConn.query("UPDATE taikhoan SET sodienthoai=?,matkhau=?,email=?,diachi=?,hodem=?,ten=?,ngaysinh=?,gioitinh=? WHERE mataikhoan = ?", [taikhoan.sodienthoai, taikhoan.matkhau, taikhoan.email, taikhoan.diachi, taikhoan.hodem, taikhoan.ten, taikhoan.ngaysinh, taikhoan.gioitinh, mataikhoan], function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};

module.exports = taikhoan;
