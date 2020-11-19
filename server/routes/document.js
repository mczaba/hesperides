const express = require('express')
const router = express.Router()

const documentController = require('../controllers/document')
// const token = require('../middlewares/token')

router.post('/create', documentController.create)

module.exports = router
