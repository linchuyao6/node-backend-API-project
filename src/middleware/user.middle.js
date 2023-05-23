const userServer = require('../service/user.server')
const {
  NAME_IS_ALREADY_EXISTS,
  NAME_OR_PASSWORD_IS_NULL,
} = require('../config/error')
const md5password = require('../utils/md5-password')

const verifyUser = async (ctx, next) => {
  //1.验证用户名和密码是否为空
  const { name, password } = ctx.request.body
  if (!name || !password) {
    return ctx.app.emit('err', NAME_OR_PASSWORD_IS_NULL, ctx)
  }
  //2.判断name是否已经存在了
  // 这里要查询数据库，所以要设置成异步函数
  const user = await userServer.findUserByName(name)
  if (user.length) {
    return ctx.app.emit('err', NAME_IS_ALREADY_EXISTS, ctx)
  }
  await next()
}
// 对密码进行加密
const handlePassword = async (ctx, next) => {
  const { password } = ctx.request.body
  const md5pwd = md5password(password)
  ctx.request.body.password = md5pwd
  await next()
}

module.exports = { verifyUser, handlePassword }
