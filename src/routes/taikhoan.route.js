// taikhoan.routes.js
const express = require('express')

const router = express.Router()

const taikhoanController =   require('../controllers/taikhoan.controller');
const authenticateToken = require('../../middlewares/authenticateToken');

// Get all taikhoans
router.get('/', taikhoanController.getAll);
router.get('/getOne/:mataikhoan', authenticateToken, taikhoanController.getOne);
router.post('/register', taikhoanController.create);
router.put('/update/:mataikhoan', taikhoanController.update);
router.put('/delete/:mataikhoan', taikhoanController.delete);

module.exports = router