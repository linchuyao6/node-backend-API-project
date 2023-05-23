const permission = require('../service/permission.server')
const { OPERATION_IS_NOT_ALLOWED } = require('../config/error')

// const verifyMomentPermission = async (ctx, next) => {
//   const { momentId } = ctx.params
//   const { id } = ctx.user
//   const isPermission = await permission.ckeckMoment(momentId, id)
//   if (!isPermission) {
//     return ctx.app.emit('err', OPERATION_IS_NOT_ALLOWED, ctx)
//   }
//   await next()
// }

const verifyMomentPermission = async (ctx, next) => {
  const { id } = ctx.user
  const keyName = Object.keys(ctx.params)[0]
  const resourceId = ctx.params[keyName]
  const resourceName = keyName.replace('Id', '')
  const isPermission = await permission.ckeckMoment(
    resourceName,
    resourceId,
    id
  )
  if (!isPermission) {
    return ctx.app.emit('err', OPERATION_IS_NOT_ALLOWED, ctx)
  }
  await next()
}

module.exports = {
  verifyMomentPermission,
}
