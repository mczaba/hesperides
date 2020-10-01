const express = require('express')
const router = express.Router()

const lotsController = require('../controllers/lots')
const token = require('../middlewares/token')

router.get('/all', token.isAuth, lotsController.getAll)

module.exports = router
