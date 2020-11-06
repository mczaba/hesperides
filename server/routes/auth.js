const express = require('express')
const router = express.Router()

const authController = require('../controllers/auth')
const token = require('../middlewares/token')

// router.post('/createadmin', authController.createAdmin)
router.post('/login', authController.login)
router.post('/createaccount', token.isAdmin, authController.createAccount)
router.post('/changepassword', authController.changePassword)
router.post('/changemail', authController.changeEmail)
router.post('/resetpass', authController.reset_password)
router.post(
  '/changepermissions/:id',
  token.isAdmin,
  authController.edit_permissions
)
router.get('/details/:id', token.isAdmin, authController.get_by_pk)
router.get('/all', token.isAdmin, authController.get_all)
router.delete('/:id', token.isAdmin, authController.deleter_user)

module.exports = router
