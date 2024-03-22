const express = require('express')

const router = express.Router()

const dsthanhviennhomController =   require('../controllers/dsthanhviennhom.controller');

router.post('/addMembersToGroup', dsthanhviennhomController.addMembersToGroup);

module.exports = router;