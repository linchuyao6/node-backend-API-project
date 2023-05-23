const Koa = require('koa')
const bodyParser = require('koa-bodyparser')
const useRouter = require('../router/user.router')
const loginRouter = require('../router/login.router')
const registerRouters = require('../router/index')

const app = new Koa()
// 对app进行处理
app.use(bodyParser())
// 先处理所有的数据，之后运用路由
registerRouters(app)

module.exports = app
