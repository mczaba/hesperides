const express = require('express')
const consola = require('consola')
const { Nuxt, Builder } = require('nuxt')
const app = express()
const multer = require('multer')

// Import and Set Nuxt.js options
const config = require('../nuxt.config.js')
config.dev = process.env.NODE_ENV !== 'production'

// Import db
const sequelize = require('./util/db')

// Import routes
const authRouter = require('./routes/auth')
const propRouter = require('./routes/proprietaire')

async function start() {
  // Init Nuxt.js
  const nuxt = new Nuxt(config)

  const { host, port } = nuxt.options.server

  // Build only in dev mode
  if (config.dev) {
    const builder = new Builder(nuxt)
    await builder.build()
  } else {
    await nuxt.ready()
  }

  // body parser
  app.use('/', multer().none())

  // headers
  app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*')
    res.header(
      'Access-Control-Allow-Headers',
      'Origin, X-Requested-With, Content-Type, Accept, authorization'
    )
    res.header('Access-Control-Allow-Methods', 'GET, POST, DELETE')
    next()
  })
  // routers
  app.use('/API/auth', authRouter)
  app.use('/API/proprietaire', propRouter)

  // error middleware
  app.use((error, req, res, next) => {
    res.status(error.statusCode).send(error.message)
  })

  // Give nuxt middleware to express
  app.use(nuxt.render)

  // Listen the server

  sequelize.sync()

  app.listen(port, host)
  consola.ready({
    message: `Server listening on http://${host}:${port}`,
    badge: true
  })
}
start()
