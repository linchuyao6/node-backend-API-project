const multer = require('@koa/multer')
const { UPLOAD_PATH } = require('../config/path')

const uploadAvatar = multer({
  dest: UPLOAD_PATH,
})

const handleAvater = uploadAvatar.single('avatar')

module.exports = {
  handleAvater,
}
