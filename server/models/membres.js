const Sequelize = require('sequelize')

const sequelize = require('../util/db')

const Membres = sequelize.define(
  'membres',
  {
    Id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      allowNull: false,
      primaryKey: true
    },
    login: {
      type: Sequelize.STRING,
      allowNull: false
    },
    email: {
      type: Sequelize.STRING,
      allowNull: false
    },
    password: {
      type: Sequelize.STRING,
      allowNull: false
    },
    admin: {
      type: Sequelize.BOOLEAN,
      allowNull: false
    },
    gestionnaire: {
      type: Sequelize.BOOLEAN,
      allowNull: false
    },
    documentPost: {
      type: Sequelize.BOOLEAN,
      allowNull: false
    },
    documentModif: {
      type: Sequelize.BOOLEAN,
      allowNull: false
    },
    lastSeen: {
      type: Sequelize.DATE
    }
  },
  { timestamps: false }
)

module.exports = Membres
