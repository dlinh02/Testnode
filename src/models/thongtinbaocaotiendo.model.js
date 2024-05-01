'use strict';
var dbConn = require('../../config/db.config');

var thongtinbaocao = function thongtinbaocao(thongtinbaocao){
    this.mabaocaotiendo = thongtinbaocao.mabaocaotiendo;
    this.macongviec = thongtinbaocao.macongviec;
    this.manguoigui = thongtinbaocao.manguoigui;
    this.noidung = thongtinbaocao.noidung;
    this.loaidanhgia = thongtinbaocao.loaidanhgia;
    this.ghichu = thongtinbaocao.ghichu;
    this.thoigiangui = thongtinbaocao.thoigiangui;
    this.dinhkem = thongtinbaocao.dinhkem;
}

thongtinbaocao.createReport = function(thongtinbaocao, result){
    dbConn.query("INSERT INTO thongtinbaocaotiendo SET ? ", thongtinbaocao, function(err, res){
        if(err){
            console.log(err);
            result(err, null);
        }else{
            result(null, res);
        }
    })
}

thongtinbaocao.getListReport = function(macongviec, result){
    dbConn.query("SELECT * FROM get_list_report WHERE macongviec = ? ", macongviec, function(err, res){
        if(err){
            console.log(err);
            result(err, null);
        }else{
            result(null, res);
        }
    })
}

thongtinbaocao.updateEvaluation = function (mabaocaotiendo, loaidanhgia, ghichu, result){
    dbConn.query("UPDATE thongtinbaocaotiendo SET loaidanhgia = ?, ghichu = ? WHERE mabaocaotiendo =?", [loaidanhgia, ghichu, mabaocaotiendo], function(err, res){
        if(err){
            console.log(err);
            result(err, null);
        }else{
            result(null, res);
        }
    })
}


module.exports = thongtinbaocao;