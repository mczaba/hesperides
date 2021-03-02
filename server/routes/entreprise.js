const express = require('express')
const router = express.Router()

const entrepriseController = require('../controllers/entreprise')
const token = require('../middlewares/token')

router.post('/create', token.isGestionnaire, entrepriseController.create)
router.get('/all', token.isAuth, entrepriseController.get_all)
router.get('/details/:id', token.isAuth, entrepriseController.get_details)
router.get('/search/:nom', token.isAuth, entrepriseController.search)
router.delete(
  '/:id',
  token.isGestionnaire,
  entrepriseController.delete_entreprise
)
router.post('/edit/:id', entrepriseController.edit)

module.exports = router
