const Sequelize = require('sequelize')

const sequelize = require('../util/db')

const Entreprise = sequelize.define(
  'entreprise',
  {
    Id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      allowNull: false,
      primaryKey: true
    },
    nom: {
      type: Sequelize.STRING,
      allowNull: false
    },
    type: {
      type: Sequelize.STRING,
      allowNull: false
    },
    adresse: {
      type: Sequelize.STRING
    },
    telephone: {
      type: Sequelize.TEXT,
      allowNull: false
    }
  },
  { timestamps: false }
)

module.exports = Entreprise
