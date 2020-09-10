const express = require('express')
const router = express.Router()

const authController = require('../controllers/auth')
const token = require('../middlewares/token')

router.post('/createadmin', authController.createAdmin)
router.post('/login', authController.login)
router.post('/createaccount', token.isAdmin, authController.createAccount)

module.exports = router
