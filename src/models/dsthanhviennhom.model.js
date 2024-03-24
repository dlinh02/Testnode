'use strict';
var dbConn = require('../../config/db.config');

var dsthanhviennhom = function dsthanhviennhom(dsthanhviennhom) {
    this.manhom = dsthanhviennhom.manhom;
    this.mataikhoan = dsthanhviennhom.mataikhoan;
    this.maloaiquyen = dsthanhviennhom.maloaiquyen;
}

dsthanhviennhom.addMembers = (manhom, matruongnhom, mataikhoan, callback) => {

    const tuples = [];
    for (const item of mataikhoan) {
        tuples.push(`(${manhom}, ${item}, 1)`);
    }
    tuples.push(`(${manhom}, ${matruongnhom}, 2)`);

    // Thực hiện truy vấn để thêm thành viên vào nhóm
    dbConn.query(`INSERT INTO danhsachthanhviennhom (manhom, mataikhoan, maloaiquyen) VALUES ${tuples.join(', ')}`, (error, results) => {
        if (error) {
            // return callback({ error: 'Đã xảy ra lỗi khi thêm thành viên vào nhóm' }, null);
            return callback(error, null);
        }
        // callback(null, { message: 'Các thành viên đã được thêm vào nhóm' });
        callback(null, results);
    });
};

dsthanhviennhom.addMembersToGroup = (manhom, mataikhoan, callback) => {
    const tuples = [];
    for (const item of mataikhoan) {
        tuples.push(`(${manhom}, ${item}, 1)`);
    }

    dbConn.query(`INSERT INTO danhsachthanhviennhom (manhom, mataikhoan, maloaiquyen) VALUES ${tuples.join(', ')}`, (error, results) => {
        if (error) {
            return callback(error, null);
        }
        callback(null, results);
    });
};

dsthanhviennhom.deleteMember = function (manhom, mataikhoan, result) {
    dbConn.query("UPDATE danhsachthanhviennhom SET trangthai=0 WHERE manhom = ? AND mataikhoan = ?", [manhom, mataikhoan], function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};

module.exports = dsthanhviennhom;

