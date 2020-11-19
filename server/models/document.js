const Sequelize = require('sequelize')

const sequelize = require('../util/db')

const Document = sequelize.define(
  'document',
  {
    Id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      allowNull: false,
      primaryKey: true
    },
    title: {
      type: Sequelize.STRING,
      allowNull: false
    },
    filepath: {
      type: Sequelize.STRING,
      allowNull: false
    },
    type: {
      type: Sequelize.STRING,
      allowNull: false
    },
    status: {
      type: Sequelize.BOOLEAN,
      allowNull: false
    },
    postedat: {
      type: Sequelize.DATE,
      allowNull: false
    }
  },
  { timestamps: false }
)

module.exports = Document
