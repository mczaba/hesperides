// const validator = require('express-validator')
// const lots = require('../models/lots')
const Lots = require('../models/lot')

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
