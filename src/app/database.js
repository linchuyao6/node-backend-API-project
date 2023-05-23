const mysql = require('mysql2')

const connectinPool = mysql.createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',
  database: 'my_project',
  password: '666666',
  connectionLimit: 5,
})

// 检查连接是否成功
connectinPool.getConnection((err, connection) => {
  if (err) {
    console.log('连接失败！' + err)
    return
  }
  //拿到connection后尝试连接
  connection.connect((err) => {
    if (err) {
      console.log('数据库连接失败')
    } else {
      console.log('数据库连接成功')
    }
  })
})
const connection = connectinPool.promise()
module.exports = connection
