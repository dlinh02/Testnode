const dsthanhviennhom = require('../models/dsthanhviennhom.model');

exports.addMembers = (req, res) => {
    const { manhom, matruongnhom, mataikhoan } = req.body;

    dsthanhviennhom.addMembers(manhom, matruongnhom, mataikhoan, (error, results) => {
        if (error) {
            return res.status(500).json({success: false, error: 'Đã xảy ra lỗi khi thêm thành viên vào nhóm' });
        }
        res.status(200).json({success: true, message: 'Thành viên đã được thêm vào nhóm!' });
    });
};

exports.addMembersToGroup = (req, res) => {
    const { manhom, mataikhoan } = req.body;

    dsthanhviennhom.addMembersToGroup(manhom, mataikhoan, (error, results) => {
        if (error) {
            if (error.code === 'EXISTING_MEMBERS') {
                return res.status(400).json({ success: false, error: 'Thành viên đã tồn tại trong nhóm', duplicateIds: error.duplicateIds });
            }
            return res.status(500).json({ success: false, error: 'Đã xảy ra lỗi khi thêm thành viên vào nhóm' });
        }
        res.status(200).json({ success: true, message: 'Thành viên đã được thêm vào nhóm!' });
    });
};

exports.deleteMember = function (req, res) {
    dsthanhviennhom.deleteMember( req.params.manhom, req.params.mataikhoan, function (err, thanhvien) {
        if (err)
            res.send({success: false, err});
        res.json({ success: true, error: false, message: 'Xoá thành viên thành công!' });
    });
};