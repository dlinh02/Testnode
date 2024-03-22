const express = require('express')

const router = express.Router()

const nhomController =   require('../controllers/nhom.controller');

router.post('/createGroup', nhomController.createGroup);

module.exports = router;