// loaiquyen.routes.js
const express = require('express')

const router = express.Router()

const loaiquyenController =   require('../controllers/loaiquyen.controller');

// Get all loaiquyens
router.get('/', loaiquyenController.getAll);

module.exports = router
