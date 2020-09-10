const Sequelize = require('sequelize')
require('dotenv').config()

const sequelize = new Sequelize('hesperides', 'root', process.env.DB_PASS, {
  host: 'localhost',
  dialect: 'mysql'
})

module.exports = sequelize
