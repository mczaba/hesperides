const Sequelize = require('sequelize')

const sequelize = require('../util/db')

const Favourite = sequelize.define(
  'favourite',
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
    email: {
      type: Sequelize.STRING,
      allowNull: false
    }
  },
  { timestamps: false }
)

module.exports = Favourite
