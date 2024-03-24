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

nhom.getAllGroups = function (matruongnhom, result) {
    dbConn.query("SELECT * FROM nhom WHERE matruongnhom = ?", [matruongnhom], function (err, res) {
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