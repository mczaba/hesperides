const Lots = require('../models/lot')
const Locataire = require('../models/locataire')

Lots.findAll().then((lotsList) => {
  lotsList.forEach((lot) => {
    console.log(lot.dataValues.numero)
    Locataire.findOne({ where: { lot: lot.dataValues.numero } }).then(
      (foundLoc) => {
        if (foundLoc) {
          lot.locataire = foundLoc.Id
          lot.save()
        }
      }
    )
  })
})
