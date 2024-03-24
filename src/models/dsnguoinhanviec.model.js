'use strict';
var dbConn = require('../../config/db.config');

var danhsachnguoinhanviec = function danhsachnguoinhanviec(danhsachnguoinhanviec) {
    this.macongviec = danhsachnguoinhanviec.macongviec;
    this.manguoinhan = danhsachnguoinhanviec.manguoinhan;
}

danhsachnguoinhanviec.create = function (macongviec, manguoinhan, callback) {
    const tuples = [];
    for (const item of manguoinhan) {
        tuples.push(`(${macongviec}, ${item})`);
    }
    dbConn.query(`INSERT INTO danhsachnguoinhanviec VALUES ${tuples.join(', ')}`, (error, results) => {
        if (error) {
            return callback(error, null);
        }
        callback(null, results);
    });
}

module.exports = danhsachnguoinhanviec;