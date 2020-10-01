const validator = require('express-validator')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const nodemailer = require('nodemailer')
require('dotenv').config()
const Membres = require('../models/membres')

const transporter = nodemailer.createTransport({
  name: 'smtp.ionos.fr',
  host: 'smtp.ionos.fr',
  port: 587,
  secure: false,
  auth: {
    user: process.env.MAILER_USER,
    pass: process.env.MAILER_PASS
  }
})

exports.createAdmin = [
  validator
    .body('login', 'Le login doit faire au moins 5 caractères')
    .escape()
    .isLength({ min: 5 })
    .trim(),
  validator
    .body('email', 'un Email valide est requis')
    .isLength({ min: 1 })
    .normalizeEmail()
    .isEmail()
    .trim(),
  validator
    .body('password', 'Le mot de passe doit contenir au moins 5 caractères')
    .escape()
    .isLength({ min: 5 })
    .trim(),
  validator
    .body('passwordConf', 'Les mots de passe ne correspondent pas')
    .escape()
    .custom((value, { req, loc, path }) => {
      if (value !== req.body.password) {
        throw new Error('Les mots de passe ne correspondent pas')
      } else {
        return value
      }
    })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      Membres.findOne({ where: { login: req.body.login } }).then(
        (foundUser) => {
          if (foundUser) {
            res.status(220).json({
              message: 'Un utilisateur avec ce login existe déjà'
            })
          } else {
            bcrypt.hash(req.body.password, 10, (err, hashedpassword) => {
              if (err) {
                res.send(err)
              } else {
                Membres.create({
                  login: req.body.login,
                  email: req.body.email,
                  password: hashedpassword,
                  admin: true,
                  gestionnaire: true
                })
                  .then(() => res.send('le compte admin a bien été créé'))
                  .catch((err) => next(err))
              }
            })
          }
        }
      )
    }
  }
]

exports.login = (req, res, next) => {
  let user = null
  Membres.findOne({ where: { login: req.body.login } })
    .then((foundUser) => {
      if (!foundUser) {
        const error = new Error("Cet utilisateur n'existe pas")
        error.statusCode = 220
        error.tosend = "Cet utilisateur n'existe pas"
        throw error
      } else {
        user = foundUser
        return bcrypt.compare(req.body.password, foundUser.password)
      }
    })
    .then((isEqual) => {
      if (!isEqual) {
        const error = new Error('Mauvais mot de passe')
        error.statusCode = 220
        error.tosend = 'Mauvais mot de passe'
        throw error
      }
      const userInfo = {
        Id: user.Id,
        login: user.login,
        email: user.email,
        admin: user.admin,
        gestionnaire: user.gestionnaire
      }
      const token = jwt.sign(
        {
          user: userInfo
        },
        '11051990',
        { expiresIn: '24h' }
      )
      res.status(200).json({
        token,
        user: userInfo
      })
    })
    .catch((err) => {
      next(err)
    })
}

exports.createAccount = [
  validator
    .body('login', 'Le login doit faire au moins 5 caractères')
    .escape()
    .isLength({ min: 5 })
    .trim(),
  validator
    .body('email', 'un Email valide est requis')
    .isLength({ min: 1 })
    .normalizeEmail()
    .isEmail()
    .trim(),
  validator
    .body('permissions', 'Vous devez renseigner les permissions du compte')
    .escape()
    .isLength({ min: 1 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      const randomstring = Math.random()
        .toString(36)
        .slice(-8)
      Membres.findOne({ where: { login: req.body.login } })
        .then((foundUser) => {
          if (foundUser) {
            const error = new Error('Un utilisateur avec ce login existe déjà')
            error.statusCode = 220
            throw error
          } else {
            return bcrypt.hash(randomstring, 10)
          }
        })
        .then((hashedpassword) => {
          return Membres.create({
            login: req.body.login,
            email: req.body.email,
            password: hashedpassword,
            admin: req.body.permissions === 'Admin',
            gestionnaire:
              req.body.permissions === 'Admin' ||
              req.body.permissions === 'Gestionnaire'
          })
        })
        .then(() => {
          const message = {
            from: process.env.MAILER_USER,
            to: req.body.email,
            subject: 'création de compte',
            html: `<p>Votre compte a été créé.</p><p>login : ${req.body.login}</p><p> mot de passe : ${randomstring}</p>`
          }
          transporter.sendMail(message, (err, info) => {
            if (err) {
              throw err
            } else {
              res.send('Le nouveau compte a bien été créé')
            }
          })
        })
        .catch((err) => next(err))
    }
  }
]

exports.changePassword = [
  validator
    .body('password', 'Veuillez renseigner votre mot de passe actuel')
    .escape()
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('newPassword', 'Le mot de passe doit contenir au moins 5 caractères')
    .isLength({ min: 5 })
    .trim(),
  validator
    .body('passwordConf', 'Les mots de passe ne concordent pas')
    .custom((value, { req, loc, path }) => {
      if (value !== req.body.newPassword) {
        throw new Error('Les mots de passe ne concordent pas')
      } else {
        return value
      }
    })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      const token = req.headers.authorization.split(' ')[1]
      const userID = jwt.verify(token, '11051990').user.Id
      let user = null
      if (!userID) {
        const error = new Error(
          "Vous n'avez pas l'aurotisation pour cette action"
        )
        error.statusCode = 403
        next(error)
      }
      Membres.findByPk(userID)
        .then((foundUser) => {
          user = foundUser
          return bcrypt.compare(req.body.password, foundUser.password)
        })
        .then((isEqual) => {
          if (!isEqual) {
            const error = new Error('Mauvais mot de passe')
            error.statusCode = 220
            throw error
          }
          return bcrypt.hash(req.body.newPassword, 10)
        })
        .then((hashedPassword) => {
          user.password = hashedPassword
          return user.save()
        })
        .then(() => {
          res.status(200).send('Le mot de passe a bien été modifié')
        })
        .catch((error) => {
          next(error)
        })
    }
  }
]

exports.changeEmail = [
  validator
    .body('password', 'Veuillez renseigner votre mot de passe actuel')
    .escape()
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('newEmail', 'un Email valide est requis')
    .isLength({ min: 1 })
    .normalizeEmail()
    .isEmail()
    .trim(),
  validator
    .body('emailConf', 'Les adresses mail ne concordent pas')
    .isLength({ min: 1 })
    .normalizeEmail()
    .isEmail()
    .custom((value, { req, loc, path }) => {
      if (value !== req.body.newEmail) {
        throw new Error('Les adresses mail ne concordent pas')
      } else {
        return value
      }
    })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      const token = req.headers.authorization.split(' ')[1]
      const userID = jwt.verify(token, '11051990').user.Id
      let user = null
      if (!userID) {
        const error = new Error(
          "Vous n'avez pas l'aurotisation pour cette action"
        )
        error.statusCode = 403
        next(error)
      }
      Membres.findByPk(userID)
        .then((foundUser) => {
          user = foundUser
          return bcrypt.compare(req.body.password, foundUser.password)
        })
        .then((isEqual) => {
          if (!isEqual) {
            const error = new Error('Mauvais mot de passe')
            error.statusCode = 220
            error.tosend = 'Mauvais mot de passe'
            throw error
          }
          user.email = req.body.newEmail
          return user.save()
        })
        .then(() => {
          res.status(200).send("L'adresse email a bien été modifié")
        })
        .catch((error) => {
          next(error)
        })
    }
  }
]

exports.get_all = (req, res, next) => {
  Membres.findAll()
    .then((memberList) => {
      const memberListFiltered = memberList.map((membre) => {
        return {
          Id: membre.dataValues.Id,
          login: membre.dataValues.login,
          email: membre.dataValues.email,
          admin: membre.dataValues.admin,
          gestionnaire: membre.dataValues.gestionnaire
        }
      })
      res.json(memberListFiltered)
    })
    .catch((err) => next(err))
}

exports.deleter_user = (req, res, next) => {
  Membres.findByPk(req.params.id)
    .then((membre) => {
      return membre.destroy()
    })
    .then((result) => {
      res.status(200).send('Le compte a bien été supprimé')
    })
    .catch((error) => next(error))
}

exports.reset_password = (req, res, next) => {
  const randomstring = Math.random()
    .toString(36)
    .slice(-8)
  let password = ''
  return bcrypt
    .hash(randomstring, 10)
    .then((hashedpassword) => {
      password = hashedpassword
      return Membres.findOne({ where: { login: req.body.login } })
    })
    .then((foundUser) => {
      if (!foundUser) {
        const error = new Error(
          "Aucun utilisateur avec ce login n'a été trouvé"
        )
        error.statusCode = 220
        throw error
      } else {
        foundUser.password = password
        return foundUser.save()
      }
    })
    .then((foundUser) => {
      const message = {
        from: process.env.MAILER_USER,
        to: foundUser.email,
        subject: 'réinitialisation de mot de passe',
        html: `<p>Le mot de passe de votre compte ${foundUser.login} a été réinitialisé</p><p> nouveau mot de passe : ${randomstring}</p>`
      }
      transporter.sendMail(message)
      res.send(
        'Votre mot de passe a été réinitialisé. Veuillez vérifier vos mails'
      )
    })
    .catch((error) => next(error))
}
