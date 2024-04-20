const thongbao = require("../models/thongbao.model");

exports.getListNotifications = function (req, res){
    thongbao.getListNotifications(req.params.manguoinhan, function (err, notifications){
        if (err) {
            console.log('Error in controller:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('Controller:', notifications);
            res.send(notifications);
        }
    });
}