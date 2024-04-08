'use strict';
var dbConn = require('../../config/db.config');

var tinnhan = function tinnhan(tinnhan){
    this.matinnhan = tinnhan.matinnhan;
    this.maloaitinnhan = tinnhan.maloaitinnhan;
    this.manguoigui = tinnhan.manguoigui;
    this.manguoinhan = tinnhan.manguoinhan;
    this.manhomnhan = tinnhan.manhomnhan;
    this.noidung = tinnhan.noidung;
    this.thoigiangui = tinnhan.thoigiangui;

}

tinnhan.sendMessagePN = function(tn, result){
    dbConn.query("INSERT INTO tinnhan set ?", tn, function (err, res) {
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

tinnhan.getMessagePN = function(manguoigui, manguoinhan, result){
    dbConn.query("SELECT * FROM tinnhan WHERE (manguoigui, manguoinhan) IN ((?, ?), (?, ?)) ORDER BY matinnhan", 
    [manguoigui, manguoinhan, manguoinhan, manguoigui], function(err, res){
        if (err) {
            console.log("Error:", err);
            result(err, null);
        } else {
            console.log(res);
            result(null, res);
        }
    });
}

module.exports = tinnhan;