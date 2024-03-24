'use strict';
var dbConn = require('../../config/db.config');

var congviec = function congviec(congviec) {
    this.macongviec = congviec.macongviec;
    this.tencongviec = congviec.tencongviec;
    this.noidung = congviec.noidung;
    this.manguoigiaoviec = congviec.manguoigiaoviec;
    this.manhom = congviec.manhom;
    this.ngaygiao = congviec.ngaygiao;
    this.thoihan = congviec.thoihan;
    this.maloaitrangthaicongviec = congviec.maloaitrangthaicongviec;
}

congviec.create = function (cv, callback) {
    dbConn.query('INSERT INTO congviec SET ?', cv, (error, results) => {
        if (error) {
            return callback(error, null);
        }
        callback(null, results);
    });
}

module.exports = congviec;