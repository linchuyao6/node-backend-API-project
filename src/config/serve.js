const dotenv = require('dotenv')
// 这里的env文件一定要建立在src的外面，不然路径识别不到
dotenv.config()

module.exports = { SERVER_PORT, SERVER_HOST } = process.env
