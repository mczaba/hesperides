const express = require('express')
const router = express.Router()

const documentController = require('../controllers/document')
const token = require('../middlewares/token')

router.post('/create', token.isGestionnaire, documentController.create)
router.get('/all', token.isAuth, documentController.getAll)
router.get('/:id/status', token.isGestionnaire, documentController.statusSwitch)
router.delete('/:id/delete', token.isGestionnaire, documentController.delete)

module.exports = router
