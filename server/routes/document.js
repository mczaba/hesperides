const express = require('express')
const router = express.Router()

const documentController = require('../controllers/document')
const token = require('../middlewares/token')

router.post('/create', token.isDocPost, documentController.create)
router.get('/all', token.isAuth, documentController.getAll)
router.get('/:id/status', token.isDocModif, documentController.statusSwitch)
router.delete('/:id/delete', token.isDocModif, documentController.delete)

module.exports = router
