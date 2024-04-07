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