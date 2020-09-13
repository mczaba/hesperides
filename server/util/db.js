const Sequelize = require('sequelize')
require('dotenv').config()

// mysql://b89bdcfd606128:86b04aa6@eu-cdbr-west-03.cleardb.net/heroku_b28ab25eccd8e2b?reconnect=true
// const sequelize = new Sequelize('hesperides', 'root', process.env.DB_PASS, {
//   host: 'localhost',
//   dialect: 'mysql'
// })
const sequelize = new Sequelize(
  process.env.DB_DATABASE,
  process.env.DB_USER,
  process.env.DB_PASS,
  {
    host: process.env.DB_HOST,
    dialect: 'mysql'
  }
)

module.exports = sequelize
