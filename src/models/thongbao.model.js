'use strict';
var dbConn = require('../../config/db.config');

var thongbao = function thongbao(thongbao){
    this.mathongbao = thongbao.mathongbao;
    this.manguoigui = thongbao.manguoigui;
    this.maloaithongbao = thongbao.maloaithongbao;
    this.noidung = thongbao.noidung;
    this.thoigian = thongbao.thoigian;
    this.trangthai = thongbao.trangthai;

}

thongbao.getListNotifications = function(manguoinhan, result){
    dbConn.query("SELECT * FROM get_list_notification WHERE manguoinhan = ?", manguoinhan, function(err, res){
        if(err){
            console.log(err)
            result(null, err);
        }else{
            result(null, res);
        }
    })
}

module.exports = thongbao;
