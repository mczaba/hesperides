const validator = require('express-validator')
const Lots = require('../models/lot')
const Proprietaire = require('../models/proprietaire')

exports.getAll = (req, res, next) => {
  Lots.findAll()
    .then((lotsList) => {
      const propListFiltered = lotsList.map((lot) => {
        return lot.dataValues
      })
      res.json(propListFiltered)
    })
    .catch((error) => next(error))
}

exports.create = [
  validator
    .body('numero', 'Vous devez renseigner un numéro')
    .escape()
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('etage', 'Vous devez renseigner un étage')
    .escape()
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('type', 'Vous devez renseigner un type')
    .escape()
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('tantieme', 'Vous devez renseigner un tantième')
    .escape()
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('proprietaire', 'Vous devez renseigner un propriétaire')
    .escape()
    .isLength({ min: 1 })
    .trim(),
  (req, res, next) => {
    console.log('request')
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      Proprietaire.findByPk(req.body.proprietaire)
        .then((foundProp) => {
          if (!foundProp) {
            const error = new Error("Le propriétaire n'a pas pu être trouvé")
            error.statusCode = 220
            throw error
          }
          return Lots.findOne({ where: { numero: req.body.numero } })
        })
        .then((foundLot) => {
          if (foundLot) {
            const error = new Error('Un lot avec ce numéro existe déjà')
            error.statusCode = 220
            throw error
          }
          return Lots.create({
            numero: req.body.numero,
            batiment: req.body.batiment,
            etage: req.body.etage,
            porte: req.body.porte,
            orientation: req.body.orientation,
            type: req.body.type,
            observation: req.body.observation,
            tantieme: req.body.tantieme,
            proprietaire: req.body.proprietaire
          })
        })
        .then(() => {
          res.send('Le lot a bien été créé')
        })
        .catch((error) => next(error))
    }
  }
]
