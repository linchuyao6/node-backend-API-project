const jwt = require('jsonwebtoken')
const { PRIVATE_KEY, PUBLICK_KEY } = require('../config/screct')
class LoginController {
  // 颁发token
  sign(ctx, next) {
    const { id, name } = ctx.user
    const token = jwt.sign({ id, name }, PRIVATE_KEY, {
      expiresIn: 24 * 60 * 60,
      algorithm: 'RS256',
    })
    ctx.body = {
      code: 0,
      data: {
        id,
        name,
        token,
      },
    }
  }
  test(ctx, next) {
    ctx.body = `验证信息通过！`
  }
}
module.exports = new LoginController()
