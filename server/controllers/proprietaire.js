// const validator = require('express-validator')
// const bcrypt = require('bcryptjs')
// const jwt = require('jsonwebtoken')
// const nodemailer = require('nodemailer')
// require('dotenv').config()
const Proprietaire = require('../models/proprietaire')
const Lots = require('../models/lot')

exports.get_all = (req, res, next) => {
  Proprietaire.findAll()
    .then((proprietaireList) => {
      const propListFiltered = proprietaireList.map((proprio) => {
        return proprio.dataValues
      })
      res.json(propListFiltered)
    })
    .catch((error) => next(error))
}

exports.get_details = (req, res, next) => {
  const ID = req.params.id
  let proprietaire = null
  const lots = []
  Proprietaire.findByPk(ID)
    .then((foundProprietaire) => {
      proprietaire = foundProprietaire
      return Lots.findAll({ where: { proprietaire: ID } })
    })
    .then((lotsList) => {
      lotsList.forEach((lot) => {
        lots.push(lot.dataValues)
      })
      res.json({ proprietaire, lots })
    })
    .catch((error) => next(error))
}
