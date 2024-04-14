const express = require('express')

const router = express.Router()

const congviecController =   require('../controllers/congviec.controller');

router.post('/assignTask', congviecController.create);
router.post('/getListTaskReceived/', congviecController.getListTasksReceived);
router.post('/getListAssignTask/', congviecController.getListAssignTask);
router.put('/updateTask/:macongviec', congviecController.updateTask);

module.exports = router;