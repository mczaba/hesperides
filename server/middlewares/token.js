const jwt = require('jsonwebtoken')

exports.isAdmin = (req, res, next) => {
  if (!req.headers.authorization) {
    const error = new Error("Vous n'avez pas l'autorisation nécessaire")
    error.statusCode = 401
    next(error)
  } else {
    const token = req.headers.authorization.split(' ')[1]
    const decodedToken = jwt.verify(token, '11051990')
    console.log(decodedToken)
    if (!decodedToken.admin) {
      const error = new Error("Vous n'avez pas l'autorisation nécessaire")
      error.statusCode = 401
      next(error)
    } else {
      next()
    }
  }
}
