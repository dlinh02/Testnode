'use strict';
var congviec = require('../models/congviec.model');
var danhsachnguoinhanviec = require('../models/dsnguoinhanviec.model');

exports.create = function(req, res) {
    var cv = new congviec(req.body);
    var manguoinhan = req.body.manguoinhan;
    if (cv.manhom == ""){
        cv.manhom = "NULL";
    }
    if (!cv.tencongviec || !cv.noidung || !cv.manguoigiaoviec || !cv.ngaygiao || !cv.thoihan || !cv.maloaitrangthaicongviec || !manguoinhan) {
        res.status(400).send({ error:true, message: 'Vui lòng điền đầy đủ thông tin!' });
    } else {
        congviec.create(cv, function(err, cv) {
            if (err)
                res.send(err);
            else {
                var macongviec = cv.insertId;
                danhsachnguoinhanviec.create(macongviec, manguoinhan, function(err, ds) {
                    if (err)
                        res.send(err);
                    res.json({success:true,  error:false, message: 'Công việc đã được phân công!' });
                });
            }
        });
    }
};

exports.getInfoTask = function(req, res){
    congviec.getInfoTask(req.params.macongviec, function(err, data) {
        if(err){
            console.log('Error in controller:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('Controller:', data);
            res.send(data);
        }
    });
}

exports.getListTasksReceived = function(req, res) {
    var manguoinhan = req.body.manguoinhan;
    var manguoigiaoviec = req.body.manguoigiaoviec;
    var manhom = req.body.manhom;

    congviec.getListTasksReceived(manguoinhan, manguoigiaoviec, manhom, function(err, ds) {
        if (err) {
            console.log(err);
            res.send(err);
        } else {
            res.send(ds);
        }
    });
};

exports.getListAssignTask = function(req, res) {
    var manguoinhan = req.body.manguoinhan;
    var manguoigiaoviec = req.body.manguoigiaoviec;
    var manhom = req.body.manhom;

    congviec.getListAssignTask(manguoinhan, manguoigiaoviec, manhom, function(err, ds) {
        if (err) {
            console.log(err);
            res.send(err);
        } else {
            res.send(ds);
        }
    });
};

exports.updateTask = function (req, res) {
    if (req.body.constructor === Object && Object.keys(req.body).length === 0) {
        res.status(400).send({ error: true, message: 'Vui lòng cung cấp đầy đủ thông tin!' });
    } else {
        congviec.updateTask(req.params.macongviec, new congviec(req.body), function (err, cv) {
            if (err)
                res.send({success: false, err});
            res.json({success: true, error: false, message: 'Cập nhật thành công!' });
        });
    }
};

exports.updateTaskStatus = function(req, res){
    if (req.body.constructor === Object && Object.keys(req.body).length === 0) {
        res.status(400).send({ error: true, message: 'Vui lòng cung cấp đầy đủ thông tin!' });
    } else {
        congviec.updateTaskStatus(req.params.macongviec, req.body.maloaitrangthaicongviec, function (err, trangthai) {
            if (err)
                res.send({success: false, err});
            res.json({success: true, error: false, message: 'Cập nhật thành công!' });
        });
    }
}

