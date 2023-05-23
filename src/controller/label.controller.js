const labelService = require('../service/label.server')

class labelController {
  async create(ctx, next) {
    const { name } = ctx.request.body
    const result = await labelService.create(name)
    ctx.body = {
      code: 0,
      message: '创建标签成功！',
      data: result,
    }
  }
  async list(ctx, next) {
    const result = await labelService.list()
    ctx.body = {
      code: 0,
      data: result,
    }
  }
}
module.exports = new labelController()
