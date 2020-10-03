const Sequelize = require('sequelize')

const sequelize = require('../util/db')

const Locataire = sequelize.define(
  'locataires',
  {
    Id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      allowNull: false,
      primaryKey: true
    },
    nom: {
      type: Sequelize.TEXT,
      allowNull: false
    },
    prenom: {
      type: Sequelize.TEXT
    },
    lot: {
      type: Sequelize.INTEGER,
      allowNull: false
    },
    telephone: {
      type: Sequelize.TEXT
    },
    mobile: {
      type: Sequelize.TEXT
    },
    mail: {
      type: Sequelize.TEXT
    },
    idproprio: {
      type: Sequelize.INTEGER,
      allowNull: false
    },
    observation: {
      type: Sequelize.TEXT
    }
  },
  { timestamps: false }
)

module.exports = Locataire
