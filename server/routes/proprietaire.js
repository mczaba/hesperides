const express = require('express')
const router = express.Router()

const propController = require('../controllers/proprietaire')
const token = require('../middlewares/token')

router.get('/all', token.isAuth, propController.get_all)

module.exports = router
