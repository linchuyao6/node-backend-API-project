const app = require('./app')
const { SERVER_PORT } = require('./config/serve')
require('./utils/handle-err')

app.listen(SERVER_PORT, () => {
  console.log('服务器启动成功！')
})
