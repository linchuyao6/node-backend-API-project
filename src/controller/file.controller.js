const FileService = require('../service/file.server')
const { SERVER_PORT, SERVER_HOST } = require('../config/serve')
const userService = require('../service/user.server')
class FileController {
  async create(ctx, next) {
    const { filename, mimetype, size } = ctx.request.file
    const { id } = ctx.user

    const result = await FileService.create(filename, mimetype, size, id)
    const avatarUrl = `${SERVER_HOST}:${SERVER_PORT}/user/avatar/${id}`
    const result2 = await userService.updateUserAvatar(avatarUrl, id)
    ctx.body = {
      code: 0,
      messge: '头像上传成功，可以查看！',
      data: avatarUrl,
    }
  }
}
module.exports = new FileController()
