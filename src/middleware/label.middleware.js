const labelService = require('../service/label.server')
const { LABEL_IS_ALREADY_EXISTS } = require('../config/error')
const addLabel = async (ctx, next) => {
  const { labels } = ctx.request.body

  const newLabels = []
  for (const name of labels) {
    const result = await labelService.queryLabelByName(name)
    const labelObj = { name }
    if (result) {
      labelObj.id = result.id
    } else {
      const insertResult = await labelService.create(name)
      labelObj.id = insertResult.insertId
    }
    newLabels.push(labelObj)
    ctx.labels = newLabels
  }
  await next()
}
const verifyLabelExists = async (ctx, next) => {
  const { name } = ctx.request.body
  const result = await labelService.queryLabelByName(name)
  if (result) {
    return ctx.app.emit('err', LABEL_IS_ALREADY_EXISTS, ctx)
  }
  await next()
}
module.exports = { verifyLabelExists, addLabel }
