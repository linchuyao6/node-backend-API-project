const momentService = require('../service/moment.server')

class MomentController {
  async create(ctx, netx) {
    const { content } = ctx.request.body
    const { id } = ctx.user

    const result = await momentService.create(content, id)
    ctx.body = {
      code: 0,
      message: '创建用户动态成功～',
      data: result,
    }
  }
  async list(ctx, next) {
    const { offsize, size } = ctx.query

    const result = await momentService.queryList(offsize, size)
    ctx.body = {
      code: 0,
      data: result,
    }
  }
  async detail(ctx, next) {
    const { momentId } = ctx.params
    // console.log(momentId)
    const result = await momentService.detial(momentId)
    ctx.body = {
      code: 0,
      data: result[0],
    }
  }
  async update(ctx, next) {
    const { content } = ctx.request.body
    const { momentId } = ctx.params
    const result = await momentService.update(content, momentId)
    ctx.body = {
      code: 0,
      message: '修改动态成功！',
      data: result,
    }
  }
  async remove(ctx, next) {
    const { momentId } = ctx.params
    const result = await momentService.remove(momentId)
    ctx.body = {
      code: 0,
      message: '删除动态成功！',
      data: result,
    }
  }
  async addLabels(ctx, next) {
    const { labels } = ctx
    const { momentId } = ctx.params
    try {
      for (const label of labels) {
        const isExist = await momentService.hasLabel(momentId, label.id)
        if (!isExist) {
          const result = await momentService.addLabel(momentId, label.id)
        }
      }
      ctx.body = {
        code: 0,
        message: '为动态添加标签成功～',
      }
    } catch (err) {
      ctx.body = {
        code: -3001,
        message: '为动态添加标签失败，请检查数据是否有问题！',
      }
    }
  }
}

module.exports = new MomentController()
