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

