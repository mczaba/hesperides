const fs = require('fs')
const validator = require('express-validator')
const Document = require('../models/document')
const transporter = require('../util/mailer')

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
    .body('entreprise', 'Vous devez renseigner une entreprise')
    .isLength({ min: 1 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const err = new Error(errors.errors[0].msg)
      err.statusCode = 220
      fs.unlink(req.file.path, () => {})
      next(err)
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
            observation: req.body.observation,
            entrepriseId: req.body.entreprise,
            status: false,
            postedat: Date.now()
          }
          return Document.create(infos)
        })
        .then(() => {
          if (req.body.mail) {
            const dest = req.body.mail.split(';')
            const message = {
              from: process.env.MAILER_USER,
              to: dest,
              subject: 'Nouveau document posté sur les hesperides',
              html: `<h2>Le document ${req.body.title} a été posté sur le <a href="${process.env.DOMAIN_ADRESS}">site</a> des hespérides</h2>`
            }
            transporter.sendMail(message, (err, info) => {
              if (err) {
                throw err
              } else {
                res.send('Le document a bien été enregistré')
              }
            })
          } else {
            res.send('Le document a bien été enregistré')
          }
        })
        .catch((error) => {
          fs.unlink(req.file.path, () => {})
          next(error)
        })
    }
  }
]

exports.edit = [
  validator
    .body('title', 'Vous devez renseigner un titre')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('type', 'Vous devez renseigner un type')
    .isLength({ min: 1 })
    .trim(),
  validator
    .body('entreprise', 'Vous devez renseigner une entreprise')
    .isLength({ min: 1 })
    .trim(),
  (req, res, next) => {
    const errors = validator.validationResult(req)
    if (!errors.isEmpty()) {
      const err = new Error(errors.errors[0].msg)
      err.statusCode = 220
      next(err)
    } else {
      Document.findByPk(req.params.id)
        .then((foundDocument) => {
          foundDocument.title = req.body.title
          foundDocument.type = req.body.type
          foundDocument.entreprise = req.body.entreprise
          foundDocument.observation = req.body.observation || null
          return foundDocument.save()
        })
        .then(() => {
          res.send('Le document a bien été édité')
        })
        .catch((error) => {
          next(error)
        })
    }
  }
]

exports.getAll = (req, res, next) => {
  Document.findAll({ order: [['postedat', 'DESC']] })
    .then((documentList) => {
      const documentListFiltered = documentList.map((document) => {
        return document.dataValues
      })
      res.json(documentListFiltered)
    })
    .catch((err) => next(err))
}

exports.getById = (req, res, next) => {
  Document.findByPk(req.params.id)
    .then((document) => {
      if (!document) {
        const error = new Error("Nous n'avons pas pu trouver ce document")
        error.statusCode = 220
        error.tosend = "Nous n'avons pas pu trouver ce document"
        throw error
      }
      res.json(document)
    })
    .catch((error) => next(error))
}

exports.statusSwitch = (req, res, next) => {
  Document.findByPk(req.params.id)
    .then((foundDocument) => {
      if (!foundDocument) {
        const error = new Error(
          "Nous n'avons pas trouvé le document à modifier"
        )
        error.statusCode = 220
        throw error
      } else {
        foundDocument.status = !foundDocument.status
        return foundDocument.save()
      }
    })
    .then(() => {
      res.send('Le document a bien été modifié')
    })
    .catch((error) => next(error))
}

exports.delete = (req, res, next) => {
  Document.findByPk(req.params.id)
    .then((document) => {
      return document.destroy()
    })
    .then((result) => {
      res.status(200).send('Le document a bien été supprimé')
    })
    .catch((error) => next(error))
}
