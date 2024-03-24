'use strict';
var dbConn = require('../../config/db.config');

var nhom = function nhom(nhom) {
    this.manhom = nhom.manhom;
    this.tennhom = nhom.tennhom;
    this.matruongnhom = nhom.matruongnhom;
}

nhom.createGroup = (tennhom, matruongnhom, callback) => {
    dbConn.query('INSERT INTO nhom (tennhom, matruongnhom) VALUES (?, ?)', [tennhom, matruongnhom], (error, results) => {
        if (error) {
            return callback(error, null);
        }
        const manhom = results.insertId;
        callback(null, manhom);
    });
};

nhom.deleteGroup = (manhom, callback) => {
    dbConn.query('DELETE FROM nhom WHERE manhom = ?', [manhom], (error, results) => {
        if (error) {
            return callback(error);
        }
        callback(null, results);
    });
};

nhom.getAllGroups = function (id, result) {
    dbConn.query("SELECT n.manhom, n.tennhom, n.matruongnhom, ds.mataikhoan FROM nhom n JOIN danhsachthanhviennhom ds ON n.manhom = ds.manhom WHERE ds.mataikhoan = ?", id, function (err, res) {
        if (err) {
            console.log("Error:", err);
            result(err, null);
        } else {
            console.log(res);
            result(null, res);
        }
    });
};
module.exports = nhom;