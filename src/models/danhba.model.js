'use strict';
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

module.exports = danhba;