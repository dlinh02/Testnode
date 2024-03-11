
'use strict';
var dbConn = require('./../../config/db.config');

var loaiquyen = function loaiquyen(loaiquyen){
    this.maloaiquyen = loaiquyen.maloaiquyen;
    this.tenloaiquyen = loaiquyen.tenloaiquyen; 
}

loaiquyen.getAll = function (result){
    dbConn.query("SELECT * FROM loaiquyen", function (err, res){
        if(err){
            console.log("Error:", err);
            result(err, null);
        }else{
            console.log(res);
            result(null, res);
        }
    });
};

module.exports = loaiquyen;
