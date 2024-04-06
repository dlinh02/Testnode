'use strict';
var dbConn = require('../../config/db.config');

var loaitrangthaicv = function loaitrangthaicv(loaitrangthaicv){
    this.maloaitrangthaicongviec = loaitrangthaicv.maloaitrangthaicongviec;
    this.tentrangthai = loaitrangthaicv.tentrangthai;
}

module.exports = loaitrangthaicv;