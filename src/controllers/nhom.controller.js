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

exports.getAllGroups = function (req, res) {
  nhom.getAllGroups(req.params.id, function (err, dsnhom) {
      if (err) {
          console.log('Error in controller:', err);
          res.status(500).send('Internal Server Error');
      } else {
          console.log('Controller:', dsnhom);
          res.send(dsnhom);
      }
  });
}