'use strict';
var tinnhan = require('../models/tinnhan.model');

exports.sendMessagePN = function (req, res) {
    var tn = new tinnhan(req.body);
    delete (tn.matinnhan);
    tn.maloaitinnhan = 1;
    tn.manhomnhan = null;

    tinnhan.sendMessagePN(tn, function (err, tin) {
        if (err)
            res.send(err);
        else {
            res.json({ success: true, error: false });
        }
    });
}

exports.getMessagePN = function (req, res) {
    var manguoigui = req.body.manguoigui;
    var manguoinhan = req.body.manguoinhan;
    
    tinnhan.getMessagePN(manguoigui, manguoinhan, function (err, dstn) {
        if (err) {
            console.log('Error in controller:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('Controller:', dstn);
            res.send(dstn);
        }
    });
}