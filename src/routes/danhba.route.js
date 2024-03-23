const express = require('express')

const router = express.Router()

const danhbaController =   require('../controllers/danhba.controller');

router.post('/addContact', danhbaController.add);
router.get('/getAllContact/:chudanhba', danhbaController.getAllContact);
router.get('/findByUsernameOrPhone/:id', danhbaController.findByUsernameOrPhone);
router.put('/deleteContact/:madanhba', danhbaController.deleteContact);

module.exports = router;