const fs = require('fs')
const validator = require('express-validator')
const Document = require('../models/document')

exports.create = [
  validator
    .body('title', 'Vous devez renseigner un titre')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('type', 'Vous devez renseigner un type')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('status', 'Vous devez renseigner un statut')
    .isLength({ min: 1 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      fs.unlink(req.file.path)
      const error = new Error(errors.errors[0].msg)
      error.statusCode = 220
      next(error)
    } else {
      Document.findOne({ where: { title: req.body.title } })
        .then((foundDocument) => {
          if (foundDocument) {
            const error = new Error('Un document avec ce titre existe déjà')
            error.statusCode = 220
            throw error
          }
          const infos = {
            title: req.body.title,
            filepath: req.file.path.split('static/')[1],
            type: req.body.type,
            status: false,
            postedat: Date.now()
          }
          return Document.create(infos)
        })
        .then(() => {
          res.send('Le document a bien été enregistré')
        })
        .catch((error) => {
          fs.unlink(req.file.path, () => {})
          next(error)
        })
    }
  }
]
