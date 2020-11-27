const jwt = require('jsonwebtoken')

exports.isAdmin = (req, res, next) => {
  if (!req.headers.authorization) {
    const error = new Error("Vous n'avez pas l'autorisation nécessaire")
    error.statusCode = 401
    next(error)
  } else {
    const token = req.headers.authorization.split(' ')[1]
    let decodedToken = null
    try {
      decodedToken = jwt.verify(token, '11051990')
      if (!decodedToken.user.admin) {
        const error = new Error("Vous n'avez pas l'autorisation nécessaire")
        error.statusCode = 401
        next(error)
      } else {
        next()
      }
    } catch (err) {
      const error = new Error("Vous n'avez pas l'autorisation nécessaire")
      error.statusCode = 401
      next(error)
    }
  }
}

exports.isGestionnaire = (req, res, next) => {
  if (!req.headers.authorization) {
    const error = new Error("Vous n'avez pas l'autorisation nécessaire")
    error.statusCode = 401
    next(error)
  } else {
    const token = req.headers.authorization.split(' ')[1]
    let decodedToken = null
    try {
      decodedToken = jwt.verify(token, '11051990')
      if (!decodedToken.user.gestionnaire) {
        const error = new Error("Vous n'avez pas l'autorisation nécessaire")
        error.statusCode = 401
        next(error)
      } else {
        next()
      }
    } catch (err) {
      const error = new Error("Vous n'avez pas l'autorisation nécessaire")
      error.statusCode = 401
      next(error)
    }
  }
}

exports.isDocPost = (req, res, next) => {
  if (!req.headers.authorization) {
    const error = new Error("Vous n'avez pas l'autorisation nécessaire")
    error.statusCode = 401
    next(error)
  } else {
    const token = req.headers.authorization.split(' ')[1]
    let decodedToken = null
    try {
      decodedToken = jwt.verify(token, '11051990')
      if (!decodedToken.user.documentPost) {
        const error = new Error("Vous n'avez pas l'autorisation nécessaire")
        error.statusCode = 401
        next(error)
      } else {
        next()
      }
    } catch (err) {
      const error = new Error("Vous n'avez pas l'autorisation nécessaire")
      error.statusCode = 401
      next(error)
    }
  }
}

exports.isDocModif = (req, res, next) => {
  if (!req.headers.authorization) {
    const error = new Error("Vous n'avez pas l'autorisation nécessaire")
    error.statusCode = 401
    next(error)
  } else {
    const token = req.headers.authorization.split(' ')[1]
    let decodedToken = null
    try {
      decodedToken = jwt.verify(token, '11051990')
      if (!decodedToken.user.documentModif) {
        const error = new Error("Vous n'avez pas l'autorisation nécessaire")
        error.statusCode = 401
        next(error)
      } else {
        next()
      }
    } catch (err) {
      const error = new Error("Vous n'avez pas l'autorisation nécessaire")
      error.statusCode = 401
      next(error)
    }
  }
}

exports.isAuth = (req, res, next) => {
  if (!req.headers.authorization) {
    const error = new Error("Vous n'avez pas l'autorisation nécessaire")
    error.statusCode = 401
    next(error)
  } else {
    const token = req.headers.authorization.split(' ')[1]
    let decodedToken = null
    try {
      decodedToken = jwt.verify(token, '11051990')
      if (!decodedToken) {
        const error = new Error("Vous n'avez pas l'autorisation nécessaire")
        error.statusCode = 401
        next(error)
      } else {
        next()
      }
    } catch (err) {
      const error = new Error("Vous n'avez pas l'autorisation nécessaire")
      error.statusCode = 401
      next(error)
    }
  }
}
