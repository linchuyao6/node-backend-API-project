const app = require('../app')
const {
  NAME_IS_ALREADY_EXISTS,
  NAME_OR_PASSWORD_IS_NULL,
  PASSWORD_IS_FALSE,
  NAME_IS_NOT_EXISTS,
  UNAUTHORIZATION,
  OPERATION_IS_NOT_ALLOWED,
  LABEL_IS_ALREADY_EXISTS,
} = require('../config/error')

app.on('err', (err, ctx) => {
  let code = 0
  let message = ''

  switch (err) {
    case NAME_OR_PASSWORD_IS_NULL:
      code = -1001
      message = '用户名或密码不能为空～'
      break
    case NAME_IS_ALREADY_EXISTS:
      code = -1002
      message = '用户名已被占用，请输入新的用户名'
      break
    case NAME_IS_NOT_EXISTS:
      code = -1003
      message = '用户不存在，请检查用户名'
      break
    case PASSWORD_IS_FALSE:
      code = -1004
      message = '输入的密码错误，请检查密码～'
      break
    case UNAUTHORIZATION:
      code = -1005
      message = '输入的token无效～'
      break
    case OPERATION_IS_NOT_ALLOWED:
      code = -2001
      message = '没有操作的权限！'
      break
    case LABEL_IS_ALREADY_EXISTS:
      code = -1006
      message = '标签已存在～'
      break
  }
  ctx.body = {
    code,
    message,
  }
})
