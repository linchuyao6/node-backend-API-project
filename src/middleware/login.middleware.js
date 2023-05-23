const {
  NAME_OR_PASSWORD_IS_NULL,
  NAME_IS_NOT_EXISTS,
  PASSWORD_IS_FALSE,
  UNAUTHORIZATION,
} = require('../config/error')
const { PUBLICK_KEY } = require('../config/screct')
const jwt = require('jsonwebtoken')
const userServer = require('../service/user.server')

const verifyLogin = async (ctx, next) => {
  const { name, password } = ctx.request.body
  //判断用户输入的密码和用户名是否为空
  if (!name || !password) {
    return ctx.app.emit('err', NAME_OR_PASSWORD_IS_NULL, ctx)
  }
  //查询用户在数据库中是否存在
  const users = await userServer.findUserByName(name)
  const user = users[0]
  if (!user) {
    return ctx.app.emit('err', NAME_IS_NOT_EXISTS, ctx)
  }
  // 判断数据库中的密码和用户传来的密码是否一致否正确
  if (user.password !== password) {
    return ctx.app.emit('err', PASSWORD_IS_FALSE, ctx)
  }
  // 将user对象保存在ctx当中
  ctx.user = user
  await next()
}
const verifyAuth = async (ctx, next) => {
  // 获取token
  const authorization = ctx.header.authorization
  if (!authorization) {
    return ctx.app.emit('err', UNAUTHORIZATION, ctx)
  }
  const token = authorization.replace('Bearer ', '')
  try {
    const result = jwt.verify(token, PUBLICK_KEY, {
      algorithms: ['RS256'],
    })
    // 保留token信息
    ctx.user = result
    await next()
  } catch (err) {
    ctx.app.emit('err', UNAUTHORIZATION, ctx)
  }
}
module.exports = {
  verifyLogin,
  verifyAuth,
}
