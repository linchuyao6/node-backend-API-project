const fs = require('fs')
const path = require('path')

const PRIVATE_KEY = fs.readFileSync(path.join(__dirname, './keys/private.key'))
const PUBLICK_KEY = fs.readFileSync(path.join(__dirname, './keys/public.key'))

module.exports = {
  PRIVATE_KEY,
  PUBLICK_KEY,
}
