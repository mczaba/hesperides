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

exports.getById = (req, res, next) => {
  Lots.findByPk(req.params.id)
    .then((foundLot) => {
      if (!foundLot) {
        const error = new Error("Nous n'avons pas pu trouver ce lot")
        error.statusCode = 220
        error.tosend = "Nous n'avons pas pu trouver ce lot"
        throw error
      }
      res.json(foundLot)
    })
    .catch((error) => next(error))
}

exports.create = [
  validator
    .body('numero', 'Vous devez renseigner un numéro')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('etage', 'Vous devez renseigner un étage')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('type', 'Vous devez renseigner un type')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('tantieme', 'Vous devez renseigner un tantième')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('proprietaire', 'Vous devez renseigner un lot')
    .isLength({ min: 1 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      Proprietaire.findByPk(req.body.proprietaire)
        .then((foundProp) => {
          if (!foundProp) {
            const error = new Error("Le lot n'a pas pu être trouvé")
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

exports.edit = [
  validator
    .body('etage', 'Vous devez renseigner un étage')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('type', 'Vous devez renseigner un type')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('tantieme', 'Vous devez renseigner un tantième')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('proprietaire', 'Vous devez renseigner un lot')
    .isLength({ min: 1 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      Proprietaire.findByPk(req.body.proprietaire)
        .then((foundProp) => {
          if (!foundProp) {
            const error = new Error("Le lot n'a pas pu être trouvé")
            error.statusCode = 220
            throw error
          }
          return Lots.findByPk(req.params.id)
        })
        .then((foundLot) => {
          if (!foundLot) {
            const error = new Error("Le lot n'a pas pu être trouvé")
            error.statusCode = 220
            throw error
          } else {
            foundLot.batiment = req.body.batiment
            foundLot.etage = req.body.etage
            foundLot.porte = req.body.porte
            foundLot.orientation = req.body.orientation
            foundLot.type = req.body.type
            foundLot.observation = req.body.observation
            foundLot.tantieme = req.body.tantieme
            foundLot.proprietaire = req.body.proprietaire
          }
          return foundLot.save()
        })
        .then(() => {
          res.send('Le lot a bien été modifié')
        })
        .catch((error) => next(error))
    }
  }
]

exports.delete_by_Id = (req, res, next) => {
  Lots.findByPk(req.params.id)
    .then((lot) => {
      return lot.destroy()
    })
    .then((result) => {
      res.status(200).send('Le lot a bien été supprimé')
    })
    .catch((error) => next(error))
}
