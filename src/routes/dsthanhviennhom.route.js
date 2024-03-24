const express = require('express')

const router = express.Router()

const dsthanhviennhomController =   require('../controllers/dsthanhviennhom.controller');

router.post('/addMembersToGroup', dsthanhviennhomController.addMembersToGroup);
router.delete('/deleteMember/:manhom,:mataikhoan', dsthanhviennhomController.deleteMember);
router.get('/getAllMembersInGroup/:manhom', dsthanhviennhomController.getAllMembersInGroup);


module.exports = router;