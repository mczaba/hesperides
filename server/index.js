const path = require('path')
const express = require('express')
const consola = require('consola')
const { Nuxt, Builder } = require('nuxt')
const app = express()
const multer = require('multer')
const mkdirp = require('mkdirp')

// Import and Set Nuxt.js options
const config = require('../nuxt.config.js')
config.dev = process.env.NODE_ENV !== 'production'

// Import db
const sequelize = require('./util/db')

// Import routes
const authRouter = require('./routes/auth')
const propRouter = require('./routes/proprietaire')
const lotsRouter = require('./routes/lots')
const locataireRouter = require('./routes/locataire')
const documentRouter = require('./routes/document')

// multer config
const fileStorage = multer.diskStorage({
  destination(req, file, cb) {
    const dir = path.join(__dirname, `/../static/document`)
    mkdirp(dir).then((made) => {
      cb(null, dir)
    })
  },
  filename(req, file, cb) {
    cb(null, `${Date.now()}-${file.originalname.replace(/\s+/g, '-')}`)
  }
})

const fileFilter = (req, file, cb) => {
  if (file.mimetype === 'application/pdf') {
    cb(null, true)
  } else {
    cb(new Error('Merci de fournir un fichier au format pdf'), false) // if validation failed then generate error
  }
}

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
  app.use(
    '/API/document',
    multer({ storage: fileStorage, fileFilter }).single('document')
  )
  app.use('/API/auth', multer().none())
  app.use('/API/proprietaire', multer().none())
  app.use('/API/lots', multer().none())
  app.use('/API/locataire', multer().none())

  // headers
  app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*')
    res.header(
      'Access-Control-Allow-Headers',
      'Origin, X-Requested-With, Content-Type, Accept, authorization'
    )
    res.header('Access-Control-Allow-Methods', 'GET, POST, DELETE', 'PUT')
    next()
  })
  // routers
  app.use('/API/auth', authRouter)
  app.use('/API/proprietaire', propRouter)
  app.use('/API/lots', lotsRouter)
  app.use('/API/locataire', locataireRouter)
  app.use('/API/document', documentRouter)

  // error middleware
  app.use((error, req, res, next) => {
    console.log('error')
    console.log(error)
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
