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
            return res.status(500).json({success: false, error: 'Đã xảy ra lỗi khi thêm thành viên vào nhóm' });
        }
        res.status(200).json({success: true, message: 'Thành viên đã được thêm vào nhóm!' });
    });
};