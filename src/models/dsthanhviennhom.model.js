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
    // Kiểm tra xem các mã tài khoản đã tồn tại trong danh sách hay không
    dbConn.query(`SELECT mataikhoan FROM danhsachthanhviennhom WHERE manhom = ${manhom} AND mataikhoan IN (${mataikhoan.join(',')})`, (error, existingMembers) => {
        if (error) {
            return callback(error, null);
        }

        // Nếu tồn tại các thành viên trong danh sách
        if (existingMembers.length > 0) {
            const existingIds = existingMembers.map(member => member.mataikhoan);
            const duplicateIds = mataikhoan.filter(id => existingIds.includes(id));
            return callback({ code: 'EXISTING_MEMBERS', duplicateIds }, null);
        }

        // Nếu không có thành viên nào tồn tại trong danh sách, thực hiện thêm mới
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
    });
};

dsthanhviennhom.deleteMember = function (manhom, mataikhoan, result) {
    dbConn.query("DELETE FROM danhsachthanhviennhom WHERE manhom = ? AND mataikhoan = ?", [manhom, mataikhoan], function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};

module.exports = dsthanhviennhom;