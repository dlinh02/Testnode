const express = require('express')

const router = express.Router()

const danhbaController =   require('../controllers/danhba.controller');

router.post('/addContact', danhbaController.add);

module.exports = router;