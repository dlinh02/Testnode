const express = require('express')

const router = express.Router()

const thongtinbaocaoController =   require('../controllers/thongtinbaocaotiendo.controller');

router.post('/createReport', thongtinbaocaoController.createReport);
router.post('/getListReport', thongtinbaocaoController.getListReport);
router.post('/updateEvaluation', thongtinbaocaoController.updateEvaluation);


module.exports = router;