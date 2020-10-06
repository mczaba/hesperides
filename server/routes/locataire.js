const express = require('express')
const router = express.Router()

const locataireController = require('../controllers/locataire')
const token = require('../middlewares/token')

router.get('/all', token.isAuth, locataireController.getAll)
router.get('/details/:id', token.isAuth, locataireController.getById)
router.get('/proprio/:id', token.isAuth, locataireController.getByProprio)
router.get('/lot/:id', token.isAuth, locataireController.getByLot)
router.post('/create', token.isGestionnaire, locataireController.create)
router.post('/edit/:id', token.isGestionnaire, locataireController.edit)
router.delete('/:id', token.isGestionnaire, locataireController.deleteLoc)

module.exports = router
