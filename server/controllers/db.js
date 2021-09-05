const mysqldump = require('mysqldump')

exports.dump = async (req, res, next) => {
  await mysqldump({
    connection: {
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASS,
      database: process.env.DB_DATABASE
    },
    dumpToFile: './dump/dump.sql'
  })
  res.download('./dump/dump.sql')
}
