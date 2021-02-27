const validator = require('express-validator')
const Entreprise = require('../models/entreprise')

exports.create = [
  validator
    .body('nom', 'Vous devez renseigner un nom')
    .isLength({ min: 3 })
    .trim(),
  validator
    .body('type', 'Vous devez renseigner un type')
    .isLength({ min: 3 })
    .trim(),
  validator
    .body('telephone', 'Vous devez renseigner un numéro de téléphone')
    .isLength({ min: 3 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    }
    Entreprise.findOne({ where: { nom: req.body.nom } })
      .then((foundEntreprise) => {
        if (foundEntreprise) {
          const error = new Error('Une entreprise avec ce nom existe déjà')
          error.statusCode = 220
          throw error
        }
        return Entreprise.create({
          ...req.body
        })
      })
      .then(() => {
        res.send("L'entreprise a bien été créée")
      })
      .catch((error) => next(error))
  }
]

exports.get_all = (req, res, next) => {
  Entreprise.findAll()
    .then((entrepriseList) => {
      entrepriseList = entrepriseList.map((entreprise) => {
        return entreprise.dataValues
      })
      res.json(entrepriseList)
    })
    .catch((error) => next(error))
}

exports.get_details = (req, res, next) => {
  Entreprise.findByPk(req.params.id)
    .then((foundEntreprise) => {
      if (!foundEntreprise) {
        const error = new Error("Nous n'avons pas pu trouver cette entreprise")
        error.statusCode = 220
        error.tosend = "Nous n'avons pas pu trouver cette entreprise"
        throw error
      }
      res.json(foundEntreprise)
    })
    .catch((error) => next(error))
}

exports.delete_entreprise = (req, res, next) => {
  Entreprise.findByPk(req.params.id)
    .then((entreprise) => {
      return entreprise.destroy()
    })
    .then((result) => {
      res.status(200).send('Le propriétaire a bien été supprimé')
    })
    .catch((error) => next(error))
}

exports.edit = [
  validator
    .body('nom', 'Vous devez renseigner un nom')
    .isLength({ min: 3 })
    .trim(),
  validator
    .body('type', 'Vous devez renseigner un type')
    .isLength({ min: 3 })
    .trim(),
  validator
    .body('telephone', 'Vous devez renseigner un numéro de téléphone')
    .isLength({ min: 3 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    }
    Entreprise.findByPk(req.params.id)
      .then((foundEntreprise) => {
        if (!foundEntreprise) {
          const error = new Error(
            "Nous n'avons pas pu trouver l'entreprise à éditer"
          )
          error.statusCode = 220
          throw error
        }
        foundEntreprise.nom = req.body.nom
        foundEntreprise.type = req.body.type
        foundEntreprise.adresse = req.body.adresse || foundEntreprise.adresse
        foundEntreprise.telephone = req.body.telephone
        return foundEntreprise.save()
      })
      .then(() => {
        res.send("L'entreprise a bien été modifiée")
      })
      .catch((error) => next(error))
  }
]
