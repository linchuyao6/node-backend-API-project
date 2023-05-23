// 自动添加路由路径
const fs = require('fs')

function registerRouters(app) {
  const files = fs.readdirSync(__dirname)
  console.log(files)
  for (const file of files) {
    if (!file.endsWith('.router.js')) continue
    const myrouter = require(`./${file}`)
    app.use(myrouter.routes())
    app.use(myrouter.allowedMethods())
  }
}
module.exports = registerRouters
