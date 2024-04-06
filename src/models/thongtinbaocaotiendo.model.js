'use strict';
var dbConn = require('../../config/db.config');

var thongtinbaocao = function thongtinbaocao(thongtinbaocao){
    this.mabaocaotiendo = thongtinbaocao.mabaocaotiendo;
    this.macongviec = thongtinbaocao.macongviec;
    this.manguoigui = thongtinbaocao.manguoigui;
    this.noidung = thongtinbaocao.noidung;
    this.thoigiangui = thongtinbaocao.thoigiangui;
}

module.exports = thongtinbaocao;