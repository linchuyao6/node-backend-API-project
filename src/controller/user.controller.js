// 该文件对用户传过来的数据进行处理
const userService = require('../service/user.server')
const fileService = require('../service/file.server')
const fs = require('fs')
const { UPLOAD_PATH } = require('../config/path')
class UserController {
  async create(ctx, next) {
    // 1.获取用户传来的数据
    const user = ctx.request.body
    // 2.将数据存到数据库中
    const result = await userService.create(user)
    //3.给用户返回信息
    ctx.body = {
      message: '创建用户成功！',
      data: result,
    }
  }
  async showImage(ctx, next) {
    const { userId } = ctx.params
    const avatarInfo = await fileService.aueryAvatar(userId)
    // console.log(avatarInfo)
    const { filename, mimetype } = avatarInfo
    ctx.type = mimetype
    ctx.body = fs.createReadStream(`${UPLOAD_PATH}/${filename}`)
  }
}
module.exports = new UserController()
