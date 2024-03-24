const express = require('express')

const router = express.Router()

const dsthanhviennhomController =   require('../controllers/dsthanhviennhom.controller');

router.post('/addMembersToGroup', dsthanhviennhomController.addMembersToGroup);
router.put('/deleteMember/:manhom,:mataikhoan', dsthanhviennhomController.deleteMember);


module.exports = router;