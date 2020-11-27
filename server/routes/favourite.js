const express = require('express')
const router = express.Router()

const favouriteController = require('../controllers/favourite')
const token = require('../middlewares/token')

router.post('/create', token.isAdmin, favouriteController.create)
router.get('/all', token.isAuth, favouriteController.getAll)
router.delete('/:id', token.isAdmin, favouriteController.delete)

module.exports = router
