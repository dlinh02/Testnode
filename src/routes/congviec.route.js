const express = require('express')

const router = express.Router()

const congviecController =   require('../controllers/congviec.controller');

router.post('/assignTask', congviecController.create);

module.exports = router;