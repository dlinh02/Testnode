// taikhoan.routes.js
const express = require('express')

const router = express.Router()

const taikhoanController =   require('../controllers/taikhoan.controller');

// Get all taikhoans
router.get('/', taikhoanController.getAll);
router.post('/', taikhoanController.create);
router.put('/:mataikhoan', taikhoanController.update);
router.put('/delete/:mataikhoan', taikhoanController.delete);

module.exports = router