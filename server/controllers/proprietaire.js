// const validator = require('express-validator')
// const bcrypt = require('bcryptjs')
// const jwt = require('jsonwebtoken')
// const nodemailer = require('nodemailer')
// require('dotenv').config()
const Proprietaire = require('../models/proprietaire')

exports.get_all = (req, res, next) => {
  Proprietaire.findAll()
    .then((proprietaireList) => {
      const propListFiltered = proprietaireList.map((proprio) => {
        return proprio.dataValues
      })
      res.json(propListFiltered)
    })
    .catch((error) => console.log(error))
}
