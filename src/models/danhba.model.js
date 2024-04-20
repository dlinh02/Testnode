'use strict';
const { query } = require('express');
var dbConn = require('../../config/db.config');

var danhba = function danhba(danhba){
    this.madanhba = danhba.madanhba;
    this.chudanhba = danhba.chudanhba;
    this.manguoitrongdanhba = danhba.manguoitrongdanhba;
    this.ten = danhba.ten;
    this.sodienthoai = danhba.sodienthoai;

}

danhba.add = function (db, result){
    dbConn.query("INSERT INTO danhba set ?", db, function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(err, null);
        }
        else {
            console.log(res.insertId);
            result(null, res.insertId);
        }
    });
}

danhba.findOneContact = function (conditions, chudanhba, result) {
    let sqlQuery = "SELECT * FROM danhba WHERE chudanhba = ? AND ";
    let conditionClauses = [];
    for (let key in conditions) {
        if (conditions.hasOwnProperty(key)) {
            conditionClauses.push(`${key} = ?`);
        }
    }
    if (conditionClauses.length === 0) {
        result("No conditions provided", null);
        return;
    }
    sqlQuery += conditionClauses.join(' AND ');

    let params = [chudanhba];
    for (let key in conditions) {
        if (conditions.hasOwnProperty(key)) {
            params.push(conditions[key]);
        }
    }

    dbConn.query(sqlQuery, params, function (err, res) {
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


danhba.findByUsernameOrPhone = function (search, result) {
    let sqlQuery = "SELECT * FROM danhba WHERE ten LIKE ? OR sodienthoai LIKE ?";
    let values = [`%${search}%`, `%${search}%`];

    dbConn.query(sqlQuery, values, function (err, res) {
        if (err) {
            console.log("Error:", err);
            result(err, null);
        } else {
            result(null, res); // Trả về mảng kết quả
        }
    });
};


danhba.getAllContact = function (chudanhba, result) {
    dbConn.query("SELECT * FROM get_all_contact WHERE chudanhba = ?", [chudanhba], function (err, res) {
        if (err) {
            console.log("Error:", err);
            result(err, null);
        } else {
            console.log(res);
            result(null, res);
        }
    });
};

danhba.deleteContact = function (madanhba, result) {
    dbConn.query("UPDATE danhba SET trangthai=0 WHERE madanhba = ?", [madanhba], function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};


danhba.updateAddContact = function (sodienthoai, ten, result) {
    dbConn.query("UPDATE danhba SET ten = ?, trangthai=1 WHERE sodienthoai = ?", [ten, sodienthoai], function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};

danhba.updateContact = function (ten, chudanhba, sodienthoai, result) {
    dbConn.query("UPDATE danhba SET ten = ?, trangthai=1 WHERE chudanhba = ? AND sodienthoai = ?", [ten, chudanhba, sodienthoai], function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};

module.exports = danhba;