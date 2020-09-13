const Sequelize = require('sequelize')

const sequelize = require('../util/db')

const Proprietaire = sequelize.define(
  'proprietaire',
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
    civilite: {
      type: Sequelize.TEXT('tiny'),
      allowNull: false
    },
    adresse: {
      type: Sequelize.TEXT,
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
    batiment: {
      type: Sequelize.TEXT('tiny'),
      allowNull: false
    },
    resident: {
      type: Sequelize.BOOLEAN,
      allowNull: false
    },
    observations: {
      type: Sequelize.TEXT
    },
    societe: {
      type: Sequelize.TEXT
    }
  },
  { timestamps: false }
)

module.exports = Proprietaire
