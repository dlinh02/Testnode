const express = require('express')

const router = express.Router()

const tinnhanController =   require('../controllers/tinnhan.controller');

router.post('/sendMessagePN', tinnhanController.sendMessagePN);


module.exports = router;