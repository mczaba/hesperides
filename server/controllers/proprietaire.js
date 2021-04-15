const { Op } = require('sequelize')
const validator = require('express-validator')
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

exports.search = (req, res, next) => {
  Proprietaire.findAll({ where: { nom: { [Op.substring]: req.params.nom } } })
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
  Proprietaire.findByPk(ID)
    .then((foundProprietaire) => {
      if (!foundProprietaire) {
        const error = new Error("Nous n'avons pas pu trouver ce propriétaire")
        error.statusCode = 220
        error.tosend = "Nous n'avons pas pu trouver ce propriétaire"
        throw error
      }
      res.json(foundProprietaire)
    })
    .catch((error) => next(error))
}

exports.get_lots = (req, res, next) => {
  const ID = req.params.id
  Lots.findAll({ where: { proprietaire: ID } })
    .then((lotsList) => {
      const lotsListFiltered = lotsList.map((lot) => {
        return lot.dataValues
      })
      res.json(lotsListFiltered)
    })
    .catch((error) => next(error))
}

exports.create = [
  validator
    .body('nom', 'Vous devez renseigner un nom')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('civilite', 'Vous devez renseigner une civilité')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body(
      'resident',
      'Vous devez préciser si le propriétaire réside dans son lot'
    )
    .isLength({ min: 1 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      Proprietaire.findOne({ where: { nom: req.body.nom } })
        .then((foundProp) => {
          if (foundProp) {
            if (
              foundProp.prenom.toLowerCase() ===
                req.body.prenom.toLowerCase() &&
              foundProp.nom.toLowerCase() === req.body.nom.toLowerCase()
            ) {
              const error = new Error(
                'Un propriétaire avec ce nom et prénom existe déjà'
              )
              error.statusCode = 220
              throw error
            }
          }
          return Proprietaire.create({
            nom: req.body.nom,
            prenom: req.body.prenom,
            civilite: req.body.civilite,
            adresse: req.body.adresse,
            telephone: req.body.telephone,
            mobile: req.body.mobile,
            mail: req.body.mail,
            batiment: req.body.batiment,
            resident: req.body.resident === 'true',
            observations: req.body.observations,
            societe: req.body.societe
          })
        })
        .then(() => {
          res.send('Le propriétaire a bien été créé')
        })
        .catch((error) => next(error))
    }
  }
]

exports.edit = [
  validator
    .body('nom', 'Vous devez renseigner un nom')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('civilite', 'Vous devez renseigner une civilité')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body(
      'resident',
      'Vous devez préciser si le propriétaire réside dans son lot'
    )
    .isLength({ min: 1 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      const ID = req.params.id
      Proprietaire.findByPk(ID)
        .then((foundProp) => {
          if (!foundProp) {
            const error = new Error(
              "Nous n'avons pas pu trouver le propriétaire à éditer"
            )
            error.statusCode = 220
            error.tosend =
              "Nous n'avons pas pu trouver le propriétaire à éditer"
            throw error
          }
          foundProp.nom = req.body.nom
          foundProp.prenom = req.body.prenom
          foundProp.civilite = req.body.civilite
          foundProp.adresse = req.body.adresse
          foundProp.telephone = req.body.telephone
          foundProp.mobile = req.body.mobile
          foundProp.mail = req.body.mail
          foundProp.batiment = req.body.batiment
          foundProp.resident = req.body.resident === 'true'
          foundProp.observations = req.body.observations
          foundProp.societe = req.body.societe
          return foundProp.save()
        })
        .then(() => {
          res.send('Le propriétaire a bien été modifié')
        })
        .catch((error) => next(error))
    }
  }
]

exports.delete_proprio = (req, res, next) => {
  Proprietaire.findByPk(req.params.id)
    .then((proprio) => {
      return proprio.destroy()
    })
    .then((result) => {
      res.status(200).send('Le propriétaire a bien été supprimé')
    })
    .catch((error) => next(error))
}
