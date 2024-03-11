// loaiquyen.controller.js 
// 'use strict';
// const loaiquyen = require('../models/loaiquyen.model');

// exports.getAll = function(req, res) {
//     loaiquyen.getAll(function(err, loaiquyen) {
//       console.log('controller')
//       if (err)
//       res.send(err);
//       console.log('res', loaiquyen);
//       res.send(loaiquyen);
//     });
// };

'use strict';
const loaiquyen = require('../models/loaiquyen.model');

exports.getAll = function(req, res) {
    loaiquyen.getAll(function(err, loaiquyenData) {
        if (err) {
            console.log('Error in controller:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('Controller:', loaiquyenData);
            res.send(loaiquyenData);
        }
    });
};
