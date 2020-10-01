const express = require('express')
const router = express.Router()

const propController = require('../controllers/proprietaire')
const token = require('../middlewares/token')

router.get('/all', token.isAuth, propController.get_all)
router.get('/details/:id', token.isAuth, propController.get_details)
router.get('/lots/:id', token.isAuth, propController.get_lots)
router.get('/search/:nom', token.isAuth, propController.search)
router.post('/create', token.isGestionnaire, propController.create)
router.post('/edit/:id', token.isGestionnaire, propController.edit)
router.delete('/:id', token.isGestionnaire, propController.delete_proprio)

module.exports = router
