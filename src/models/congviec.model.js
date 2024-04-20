'use strict';
var dbConn = require('../../config/db.config');
var loaitrangthaicv = require('../models/loaitrangthaicongviec.model');
var thongtinbaocao = require('../models/thongtinbaocaotiendo.model');

var congviec = function congviec(congviec) {
    this.macongviec = congviec.macongviec;
    this.tencongviec = congviec.tencongviec;
    this.noidung = congviec.noidung;
    this.manguoigiaoviec = congviec.manguoigiaoviec;
    this.manhom = congviec.manhom;
    this.ngaygiao = congviec.ngaygiao;
    this.thoihan = congviec.thoihan;
    this.maloaitrangthaicongviec = congviec.maloaitrangthaicongviec;
}

congviec.create = function (cv, callback) {
    dbConn.query('INSERT INTO congviec SET ?', cv, (error, results) => {
        if (error) {
            return callback(error, null);
        }
        callback(null, results);
    });
}


congviec.getListTasksReceived = function (manguoinhan, manguoigiaoviec, manhom, callback) { 
    var query = 'SELECT * FROM get_list_task_received WHERE manguoinhan = ?';
    var queryParams = [manguoinhan];
    if(manguoigiaoviec === null && manhom === null){
        var query = 'SELECT * FROM get_list_task_received WHERE manguoinhan = ?';
        var queryParams = [manguoinhan];
    }else{
        if (manguoigiaoviec !== null) {
            query += ' AND manguoigiaoviec = ?';
            queryParams.push(manguoigiaoviec);
        }else{
            // query += ' AND manguoigiaoviec IS NULL';
        }
    
        if (manhom !== null) {
            query += ' AND manhom = ?';
            queryParams.push(manhom);
        }else{
            query += ' AND manhom IS NULL';
        }
    }

    var sql = query + '';
    dbConn.query(sql, queryParams, (error, results) => {
        if (error) {
            return callback(error, null);
        }
        callback(null, results);
    });
};


congviec.getListAssignTask = function (manguoinhan, manguoigiaoviec, manhom, callback) { 
    var query = 'SELECT * FROM get_list_assign_task WHERE manguoigiaoviec = ?';
    var queryParams = [manguoigiaoviec];
    if(manguoinhan === null && manhom === null){
        var query = 'SELECT * FROM get_list_assign_task WHERE manguoigiaoviec = ?';
        var queryParams = [manguoigiaoviec];
    }else{
        if (manhom !== null) {
            query += ' AND manhom = ?';
            queryParams.push(manhom);
        }else{
            query += ' AND manhom IS NULL';
        }

        if (manguoinhan !== null) {
            query += ' AND manguoinhan = ?';
            queryParams.push(manguoinhan);
        }else{
            // query += ' AND manguoinhan IS NULL';
        }
    }

    var sql = query + ' ';

    dbConn.query(sql, queryParams, (error, results) => {
        if (error) {
            return callback(error, null);
        }
        callback(null, results);
    });
};


congviec.updateTask = function (macongviec, cv, result) {
    dbConn.query("UPDATE congviec SET tencongviec=?,noidung=?,ngaygiao=?,thoihan=?,maloaitrangthaicongviec=? WHERE macongviec = ?", [cv.tencongviec, cv.noidung, cv.ngaygiao, cv.thoihan, cv.maloaitrangthaicongviec, macongviec], function (err, res) {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};


module.exports = congviec;