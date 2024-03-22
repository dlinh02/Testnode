// const nhom = require('../models/nhom.model');
// const dsthanhviennhom = require('../models/dsthanhviennhom.model');

// exports.createGroup = (req, res) => {
//   const { tennhom, matruongnhom, mataikhoan } = req.body;
//   delete req.body.manhom;

//   nhom.createGroup(tennhom, matruongnhom, (error, manhom) => {
//     if (error) {
//       return res.status(500).json(error);
//     }
//     dsthanhviennhom.addMembersToGroup(manhom, mataikhoan, (error, result) => {
//       if (error) {
//         // Nếu có lỗi khi thêm thành viên, xóa nhóm đã tạo
//         nhom.deleteGroup(manhom, (err, deleted) => {
//           if (err) {
//             return res.status(500).json(err);
//           }
//           return res.status(500).json(error);
//         });
//       } else {
//         // Nếu không có lỗi khi thêm thành viên, trả về thông báo thành công
//         res.status(200).json({ message: 'Tạo nhóm thành công!' });
//       }
//     });
//   });
// };


const nhom = require('../models/nhom.model');
const dsthanhviennhom = require('../models/dsthanhviennhom.model');

exports.createGroup = (req, res) => {
  const { tennhom, matruongnhom, mataikhoan } = req.body;
  nhom.createGroup(tennhom, matruongnhom, (error, manhom) => {
    if (error) {
      return res.status(500).json({success: false, error: 'Đã xảy ra lỗi khi tạo nhóm' });
    }
    dsthanhviennhom.addMembers(manhom, matruongnhom, mataikhoan, (error, result) => {
      if (error) {
        // Nếu có lỗi khi thêm thành viên, xóa nhóm đã tạo
        nhom.deleteGroup(manhom, (err, deleted) => {
          if (err) {
            return res.status(500).json(err);
          }
          return res.status(500).json({success: false, error: 'Đã xảy ra lỗi khi thêm thành viên vào nhóm' });
        });
      } else {
        res.status(200).json({success: true, message: 'Tạo nhóm thành công!' });
      }
    });
  });
};