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

