const express = require('express')
const router = express.Router()

const dbController = require('../controllers/db')
const token = require('../middlewares/token')

router.get('/dump', token.isAdmin, dbController.dump)

module.exports = router
