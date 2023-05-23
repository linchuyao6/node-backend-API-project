const connection = require('../app/database')

class Permission {
  async ckeckMoment(resourceName, momentId, userId) {
    console.log(momentId)
    const statement = `SELECT * FROM ${resourceName} WHERE id = ? AND user_id = ?;`
    const [result] = await connection.execute(statement, [momentId, userId])
    return !!result.length
  }
}

module.exports = new Permission()
