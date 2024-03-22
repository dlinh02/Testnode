// 'use strict';
// var dbConn = require('../../config/db.config');

// var nhom = function nhom(nhom) {
//     this.manhom = nhom.manhom;
//     this.tennhom = nhom.tennhom;
//     this.matruongnhom = nhom.matruongnhom;
// }

// nhom.createGroup = (tennhom, matruongnhom, callback) => {
//     dbConn.query('INSERT INTO nhom (tennhom, matruongnhom) VALUES (?, ?)', [tennhom, matruongnhom], (error, results) => {
//         if (error) {
//             return callback({ error: 'Đã xảy ra lỗi khi tạo nhóm' }, null);
//         }
//         const manhom = results.insertId;
//         callback(null, manhom);
//     });
// };

// nhom.deleteGroup = (manhom, callback) => {
//     dbConn.query('DELETE FROM nhom WHERE manhom = ?', [manhom], (error, results) => {
//         if (error) {
//             return callback(error);
//         }
//         callback(null, results);
//     });
// };

// module.exports = nhom;

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
            // return callback({ error: 'Đã xảy ra lỗi khi tạo nhóm' }, null);
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

module.exports = nhom;