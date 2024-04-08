const express = require('express')

const router = express.Router()

const tinnhanController =   require('../controllers/tinnhan.controller');

router.post('/sendMessagePN', tinnhanController.sendMessagePN);
router.post('/getMessagePN', tinnhanController.getMessagePN);
router.post('/sendMessageGR', tinnhanController.sendMessageGR);
router.post('/getMessageGR', tinnhanController.getMessageGR);



module.exports = router;