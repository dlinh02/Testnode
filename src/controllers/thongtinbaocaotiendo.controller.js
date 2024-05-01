'use strict';
const thongtinbaocao = require('../models/thongtinbaocaotiendo.model');

exports.createReport = function (req, res){
    const ttbc = new thongtinbaocao(req.body);
    delete(ttbc.mabaocaotiendo);
    delete(ttbc.loaidanhgia);
    delete(ttbc.ghichu);

    thongtinbaocao.createReport(ttbc, function (err, report){
        if (err) {
            res.send(err);
        }
        res.status(200).json({success: true, message: 'Báo cáo tiến độ thành công.'});
    })
}

exports.getListReport = function (req, res){
    const macongviec = req.body.macongviec;
    thongtinbaocao.getListReport(macongviec, function (err, reports){
        if (err) {
            res.send(err);
        }
        res.status(200).json(reports);
    })
}

exports.updateEvaluation = function (req, res){
    const mabaocaotiendo = req.body.mabaocaotiendo;
    const loaidanhgia = req.body.loaidanhgia;
    var ghichu = "";
    if(loaidanhgia === 2){
        ghichu = null;
    }else{
        ghichu = req.body.ghichu;
    }
    thongtinbaocao.updateEvaluation(mabaocaotiendo, loaidanhgia, ghichu, function (err, reports){
        if (err) {
            res.send(err);
        }
        res.status(200).json({success: true, message: 'Đã đánh giá.'});
    })
}