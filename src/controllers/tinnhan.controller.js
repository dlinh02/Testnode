'use strict';
const tinnhan = require('../models/tinnhan.model');
const dsthanhviennhom = require('../models/dsthanhviennhom.model');


exports.sendMessagePN = function (req, res) {
    var tn = new tinnhan(req.body);
    delete (tn.matinnhan);
    tn.maloaitinnhan = 1;
    tn.manhomnhan = null;

    tinnhan.sendMessagePN(tn, function (err, tin) {
        if (err)
            res.send(err);
        else {
            res.json({ success: true, error: false });
        }
    });
}

exports.getMessagePN = function (req, res) {
    var manguoigui = req.body.manguoigui;
    var manguoinhan = req.body.manguoinhan;

    tinnhan.getMessagePN(manguoigui, manguoinhan, function (err, dstn) {
        if (err) {
            console.log('Error in controller:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('Controller:', dstn);
            res.send(dstn);
        }
    });
}

// exports.sendMessageGR = function (req, res) {
//     var tn = new tinnhan(req.body);
//     const mataikhoanArray = [];
//     delete tn.matinnhan;
//     tn.maloaitinnhan = 2;

//     var manhom = req.body.manhomnhan;

//     // Gọi hàm getAllMembersInGroup để lấy danh sách các thành viên trong nhóm
//     dsthanhviennhom.getAllMembersInGroup(manhom, function (err, members) {
//         if (err) {
//             console.log(err);
//             return res.status(500).json({ success: false, error: "Internal Server Error" });
//         } else {
//             // Lấy danh sách mã tài khoản từ kết quả trả về
//             const mataikhoanArray = members.map(item => item.mataikhoan);
//             console.log(mataikhoanArray);

//             // Gửi tin nhắn đến các thành viên trong nhóm
//             tinnhan.sendMessageGR(tn.manguoigui, mataikhoanArray, tn.manhomnhan, tn.noidung, tn.thoigiangui, function (err, tin) {
//                 if (err) {
//                     console.log(err);
//                     return res.status(500).json({ success: false, error: "Error sending message" });
//                 } else {
//                     return res.status(200).json({ success: true, error: false });
//                 }
//             });
//         }
//     });
// }

exports.sendMessageGR = function (req, res) {
    var tn = new tinnhan(req.body);
    delete (tn.matinnhan);
    tn.maloaitinnhan = 2;
    tn.manguoinhan = null;

    tinnhan.sendMessagePN(tn, function (err, tin) {
        if (err)
            res.send(err);
        else {
            res.json({ success: true, error: false });
        }
    });
}


exports.getMessageGR = function (req, res) {
    var manhomnhan = req.body.manhomnhan;

    tinnhan.getMessageGR(manhomnhan, function (err, dstn) {
        if (err) {
            console.log('Error in controller:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('Controller:', dstn);
            res.send(dstn);
        }
    });
}
