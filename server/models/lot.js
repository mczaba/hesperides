const Sequelize = require('sequelize')

const sequelize = require('../util/db')

const Lots = sequelize.define(
  'lots',
  {
    numero: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      allowNull: false,
      primaryKey: true
    },
    batiment: {
      type: Sequelize.TEXT('tiny')
    },
    etage: {
      type: Sequelize.TEXT('tiny'),
      allowNull: false
    },
    porte: {
      type: Sequelize.INTEGER
    },
    orientation: {
      type: Sequelize.TEXT('tiny')
    },
    type: {
      type: Sequelize.TEXT('tiny'),
      allowNull: false
    },
    observation: {
      type: Sequelize.TEXT
    },
    tantieme: {
      type: Sequelize.INTEGER,
      allowNull: false
    },
    proprietaire: {
      type: Sequelize.INTEGER,
      allowNull: false
    },
    locataire: {
      type: Sequelize.INTEGER
    }
  },
  { timestamps: false }
)

module.exports = Lots
