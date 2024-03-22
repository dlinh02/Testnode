// 'use strict';
// var dbConn = require('../../config/db.config');

// var dsthanhviennhom = function dsthanhviennhom(dsthanhviennhom){
//     this.manhom = dsthanhviennhom.manhom;
//     this.mataikhoan = dsthanhviennhom.mataikhoan;
//     this.maloaiquyen = dsthanhviennhom.maloaiquyen;
// }

// dsthanhviennhom.addMembersToGroup = (manhom, mataikhoan, callback) => {
//     // Parse chuỗi JSON thành mảng
//     const parsedMataikhoan = JSON.parse(mataikhoan);

//     // Kiểm tra xem parsedMataikhoan có phải là một mảng không
//     if (!Array.isArray(parsedMataikhoan)) {
//         return callback({ error: 'Dữ liệu không hợp lệ' }, null);
//     }

//     // Sử dụng parsedMataikhoan trong các bước tiếp theo
//     const values = parsedMataikhoan.map(matk => [manhom, matk, 1]); // Gán mặc định maloaiquyen = 1 nếu không có dữ liệu khác

//     dbConn.query('INSERT INTO danhsachthanhviennhom (manhom, mataikhoan, maloaiquyen) VALUES ?', [values], (error, results) => {
//         if (error) {
//             return callback({ error: 'Đã xảy ra lỗi khi thêm thành viên vào nhóm' }, null);
//         }
//         callback(null, { message: 'Các thành viên đã được thêm vào nhóm' });
//     });
// };

// module.exports = dsthanhviennhom;

'use strict';
var dbConn = require('../../config/db.config');

var dsthanhviennhom = function dsthanhviennhom(dsthanhviennhom){
    this.manhom = dsthanhviennhom.manhom;
    this.mataikhoan = dsthanhviennhom.mataikhoan;
    this.maloaiquyen = dsthanhviennhom.maloaiquyen;
}

dsthanhviennhom.addMembers = (manhom, matruongnhom, mataikhoan, callback) => {
    // Parse chuỗi JSON thành mảng
    let parsedMataikhoan = JSON.parse(mataikhoan);

    // Tạo một mảng các giá trị cho trưởng nhóm và các thành viên
    const values = [];

    // Thêm mã trưởng nhóm vào mảng values với loại quyền là 2
    values.push([manhom, matruongnhom, 2]);

    // Thêm các thành viên vào mảng values với loại quyền là 1
    if(Array.isArray(parsedMataikhoan)){
        for(let i = 0; i < parsedMataikhoan.length; i++){
            values.push([manhom, parsedMataikhoan[i], 1]);
        }
    }

    // Thực hiện truy vấn để thêm thành viên vào nhóm
    dbConn.query('INSERT INTO danhsachthanhviennhom (manhom, mataikhoan, maloaiquyen) VALUES ?', [values], (error, results) => {
        if (error) {
            // return callback({ error: 'Đã xảy ra lỗi khi thêm thành viên vào nhóm' }, null);
            return callback(error, null);
        }
        // callback(null, { message: 'Các thành viên đã được thêm vào nhóm' });
        callback(null, results);
    });
};

dsthanhviennhom.addMembersToGroup = (manhom, mataikhoan, callback) => {
    const parsedMataikhoan = JSON.parse(mataikhoan);

    // Kiểm tra xem parsedMataikhoan có phải là một mảng không
    if (!Array.isArray(parsedMataikhoan)) {
        return callback({ error: 'Dữ liệu không hợp lệ' });
    }

    // Sử dụng parsedMataikhoan trong các bước tiếp theo
    const values = parsedMataikhoan.map(matk => [manhom, matk, 1]); // Gán mặc định maloaiquyen = 1 nếu không có dữ liệu khác

    dbConn.query('INSERT INTO danhsachthanhviennhom (manhom, mataikhoan, maloaiquyen) VALUES ?', [values], (error, results) => {
        if (error) {
            return callback(error, null);
        }
        callback(null, results);
    });
};

module.exports = dsthanhviennhom;

