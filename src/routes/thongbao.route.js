const express = require('express')

const router = express.Router()

const thongbaoController = require('../controllers/thongbao.controller');

router.get('/getListNotifications/:manguoinhan', thongbaoController.getListNotifications);

module.exports = router;