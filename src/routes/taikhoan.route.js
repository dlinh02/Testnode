// taikhoan.routes.js
const express = require('express')

const router = express.Router()

const taikhoanController =   require('../controllers/taikhoan.controller');

// Get all taikhoans
router.get('/', taikhoanController.getAll);
router.get('/getOne/:mataikhoan', taikhoanController.getOne);
router.post('/register', taikhoanController.create);
router.put('/update/:mataikhoan', taikhoanController.update);
router.put('/delete/:mataikhoan', taikhoanController.delete);

module.exports = router