const express = require('express')
const router = express.Router()

const lotsController = require('../controllers/lots')
const token = require('../middlewares/token')

router.get('/all', token.isAuth, lotsController.getAll)
router.get('/details/:id', token.isAuth, lotsController.getById)
router.post('/create', token.isGestionnaire, lotsController.create)
router.post('/edit/:id', token.isGestionnaire, lotsController.edit)

module.exports = router
