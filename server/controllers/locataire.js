const { Op } = require('sequelize')
const validator = require('express-validator')
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

exports.search = (req, res, next) => {
  Locataire.findAll({ where: { nom: { [Op.substring]: req.params.nom } } })
    .then((locataireList) => {
      const locListFiltered = locataireList.map((loc) => {
        return loc.dataValues
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

exports.create = [
  validator
    .body('nom', 'Vous devez renseigner un nom')
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
            if (foundLoc.nom.toLowerCase() === req.body.nom.toLowerCase()) {
              if (req.body.prenom && foundLoc.prenom) {
                if (
                  req.body.prenom.toLowerCase() ===
                  foundLoc.prenom.toLowerCase()
                ) {
                  const error = new Error(
                    'Un locataire avec ce nom et prénom existe déjà'
                  )
                  error.statusCode = 220
                  throw error
                }
              } else if (!req.body.prenom && !foundLoc.prenom) {
                const error = new Error(
                  'Un locataire avec ce nom et prénom existe déjà'
                )
                error.statusCode = 220
                throw error
              }
            }
          }
          return Locataire.create({
            nom: req.body.nom,
            prenom: req.body.prenom,
            adresse: req.body.adresse,
            telephone: req.body.telephone,
            mobile: req.body.mobile,
            mail: req.body.mail,
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
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
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
          foundLoc.adresse = req.body.adresse
          foundLoc.telephone = req.body.telephone
          foundLoc.mobile = req.body.mobile
          foundLoc.mail = req.body.mail
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
