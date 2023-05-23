// 对数据库进行操作
const connection = require('../app/database')

class UserService {
  async create(user) {
    const { name, password } = user
    const statement = 'INSERT INTO `user` (name,password) VALUES (?,?);'
    const [result] = await connection.execute(statement, [name, password])
    return result
  }
  async findUserByName(name) {
    const statement = 'SELECT * FROM `user` WHERE `name`=?;'
    const [result] = await connection.execute(statement, [name])
    console.log(result)
    return result
  }
  async updateUserAvatar(url, id) {
    const statement = 'UPDATE user SET avatar_url = ? WHERE id = ?;'
    const [result] = await connection.execute(statement, [url, id])
    return result
  }
}

module.exports = new UserService()
