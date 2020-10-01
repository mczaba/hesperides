const express = require('express')
const router = express.Router()

const lotsController = require('../controllers/lots')
const token = require('../middlewares/token')

router.get('/all', token.isAuth, lotsController.getAll)
router.post('/create', token.isGestionnaire, lotsController.create)

module.exports = router
