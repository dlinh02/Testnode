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
    this.trangthai = taikhoan.trangthai;
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

taikhoan.getOne = function (mataikhoan, result) {
    dbConn.query("SELECT * FROM taikhoan WHERE mataikhoan = ?", [mataikhoan], function (err, res) {
        if (err) {
            console.log("Error:", err);
            result(err, null);
        } else {
            console.log(res);
            result(null, res);
        }
    });
};

taikhoan.getIdBySDT = function (sodienthoai, result) {
    dbConn.query("SELECT * FROM taikhoan WHERE sodienthoai = ?", [sodienthoai], function (err, res) {
        if (err) {
            console.log("Error:", err);
            result(err, null);
        } else {
            console.log(res);
            result(null, res);
        }
    });
};

taikhoan.findOne = function (conditions, result) {
    let sqlQuery = "SELECT * FROM taikhoan WHERE ";
    let conditionClauses = [];
    for (let key in conditions) {
        if (conditions.hasOwnProperty(key)) {
            conditionClauses.push(`${key} = ${dbConn.escape(conditions[key])}`);
        }
    }
    if (conditionClauses.length === 0) {
        result("No conditions provided", null);
        return;
    }
    sqlQuery += conditionClauses.join(' OR ');

    dbConn.query(sqlQuery, function (err, res) {
        if (err) {
            console.log("Error:", err);
            result(err, null);
        } else {
            if (res.length > 0) {
                result(null, res[0]);
            } else {
                result(null, null);
            }
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

taikhoan.delete = function (mataikhoan, result) {
    dbConn.query("UPDATE taikhoan SET trangthai=0 WHERE mataikhoan = ?", [mataikhoan], function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};


taikhoan.findByUsername = function (sodienthoai) {
    return new Promise((resolve, reject) => {
        dbConn.query("SELECT * FROM taikhoan WHERE sodienthoai = ?", [sodienthoai], function (err, res) {
            if (err) {
                console.log("Error:", err);
                reject(err);
            } else {
                console.log(res);
                resolve(res);
            }
        });
    });
};
module.exports = taikhoan;
