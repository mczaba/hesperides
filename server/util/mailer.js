const nodemailer = require('nodemailer')

const transporter = nodemailer.createTransport({
  name: 'smtp.ionos.fr',
  host: 'smtp.ionos.fr',
  port: 587,
  secure: false,
  auth: {
    user: process.env.MAILER_USER,
    pass: process.env.MAILER_PASS
  }
})

module.exports = transporter
