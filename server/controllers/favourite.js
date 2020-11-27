const validator = require('express-validator')
const Favourite = require('../models/favourite')

exports.create = [
  validator
    .body('nom', 'Vous devez renseigner un nom')
    .isLength({ min: 3 })
    .trim(),
  validator
    .body('email', 'Vous devez renseigner un email')
    .isLength({ min: 1 })
    .normalizeEmail()
    .isEmail()
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      throw error
    } else {
      Favourite.findOne({ where: { nom: req.body.nom } })
        .then((foundFav) => {
          if (foundFav) {
            const error = new Error(
              'Un destinataire favori avec ce nom existe déjà'
            )
            error.statusCode = 220
            throw error
          } else {
            return Favourite.create({
              nom: req.body.nom,
              email: req.body.email
            })
          }
        })
        .then(() => res.send('Le destinataire favori a bien été créé'))
        .catch((error) => next(error))
    }
  }
]

exports.getAll = (req, res, next) => {
  Favourite.findAll()
    .then((favList) => {
      const favListFiltered = favList.map((fav) => {
        return fav.dataValues
      })
      res.json(favListFiltered)
    })
    .catch((err) => next(err))
}

exports.delete = (req, res, next) => {
  Favourite.findByPk(req.params.id)
    .then((fav) => {
      return fav.destroy()
    })
    .then((result) => {
      res.status(200).send('Le locataire a bien été supprimé')
    })
    .catch((error) => next(error))
}
