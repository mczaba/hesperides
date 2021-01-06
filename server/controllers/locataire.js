// const { Op } = require('sequelize')
const validator = require('express-validator')
const Lots = require('../models/lot')
const Locataire = require('../models/locataire')

exports.getAll = (req, res, next) => {
  Locataire.findAll()
    .then((locataireList) => {
      const locListFiltered = locataireList.map((locataire) => {
        return locataire.dataValues
      })
      res.json(locListFiltered)
    })
    .catch((error) => next(error))
}

exports.getById = (req, res, next) => {
  const ID = req.params.id
  Locataire.findByPk(ID)
    .then((foundLocataire) => {
      if (!foundLocataire) {
        const error = new Error("Nous n'avons pas pu trouver ce locataire")
        error.statusCode = 220
        error.tosend = "Nous n'avons pas pu trouver ce locataire"
        throw error
      }
      res.json(foundLocataire)
    })
    .catch((error) => next(error))
}

exports.getByProprio = (req, res, next) => {
  Locataire.findAll({ where: { idproprio: req.params.id } })
    .then((locataireList) => {
      const locListFiltered = locataireList.map((locataire) => {
        return locataire.dataValues
      })
      res.json(locListFiltered)
    })
    .catch((error) => next(error))
}

exports.getByLot = (req, res, next) => {
  Locataire.findOne({ where: { lot: req.params.id } })
    .then((foundLocataire) => {
      if (!foundLocataire) {
        const error = new Error("Nous n'avons pas pu trouver ce locataire")
        error.statusCode = 220
        error.tosend = "Nous n'avons pas pu trouver ce locataire"
        throw error
      }
      res.json(foundLocataire)
    })
    .catch((error) => next(error))
}

exports.create = [
  validator
    .body('nom', 'Vous devez renseigner un nom')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('lot', 'Vous devez renseigner un lot')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('idproprio', 'Vous devez renseigner un locataire')
    .isLength({ min: 1 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      Locataire.findOne({ where: { nom: req.body.nom } })
        .then((foundLoc) => {
          if (foundLoc) {
            if (
              foundLoc.prenom.toLowerCase() === req.body.prenom.toLowerCase() &&
              foundLoc.nom.toLowerCase() === req.body.nom.toLowerCase()
            ) {
              const error = new Error(
                'Un locataire avec ce nom et prénom existe déjà'
              )
              error.statusCode = 220
              throw error
            }
          }
          return Lots.findByPk(req.body.lot)
        })
        .then((foundLot) => {
          if (!foundLot) {
            const error = new Error("Ce lot n'existe pas")
            error.statusCode = 220
            throw error
          }
          return Locataire.findOne({ where: { lot: req.body.lot } })
        })
        .then((foundLoc) => {
          if (foundLoc) {
            const error = new Error('Un locataire avec ce lot existe déjà')
            error.statusCode = 220
            throw error
          }
          return Locataire.create({
            nom: req.body.nom,
            prenom: req.body.prenom,
            lot: req.body.lot,
            adresse: req.body.adresse,
            telephone: req.body.telephone,
            mobile: req.body.mobile,
            mail: req.body.mail,
            idproprio: req.body.idproprio,
            observation: req.body.observation
          })
        })
        .then(() => {
          res.send('Le locataire a bien été créé')
        })
        .catch((error) => {
          next(error)
        })
    }
  }
]

exports.edit = [
  validator
    .body('nom', 'Vous devez renseigner un nom')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('lot', 'Vous devez renseigner un lot')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('idproprio', 'Vous devez renseigner un locataire')
    .isLength({ min: 1 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      console.log(req.body)
      Locataire.findByPk(req.params.id)
        .then((foundLoc) => {
          if (!foundLoc) {
            const error = new Error(
              "Nous n'avons pas pu trouver le locataire à éditer"
            )
            error.statusCode = 220
            error.tosend = "Nous n'avons pas pu trouver le locataire à éditer"
            throw error
          }
          foundLoc.nom = req.body.nom
          foundLoc.prenom = req.body.prenom
          foundLoc.lot = req.body.lot
          foundLoc.adresse = req.body.adresse
          foundLoc.telephone = req.body.telephone
          foundLoc.mobile = req.body.mobile
          foundLoc.mail = req.body.mail
          foundLoc.idproprio = req.body.idproprio
          foundLoc.observation = req.body.observation
          return foundLoc.save()
        })
        .then(() => {
          res.send('Le locataire a bien été édité')
        })
        .catch((error) => next(error))
    }
  }
]

exports.deleteLoc = (req, res, next) => {
  Locataire.findByPk(req.params.id)
    .then((locataire) => {
      return locataire.destroy()
    })
    .then((result) => {
      res.status(200).send('Le locataire a bien été supprimé')
    })
    .catch((error) => next(error))
}
