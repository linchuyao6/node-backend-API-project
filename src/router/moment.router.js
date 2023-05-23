const KoaRouter = require('@koa/router')
const { verifyAuth } = require('../middleware/login.middleware')
const {
  verifyMomentPermission,
} = require('../middleware/permission.middleware')
const { addLabel } = require('../middleware/label.middleware')
const {
  create,
  list,
  detail,
  update,
  remove,
  addLabels,
} = require('../controller/moment.controller')

const momentRouter = new KoaRouter({
  prefix: '/moment',
})
//  增加
momentRouter.post('/', verifyAuth, create)
// 查询
momentRouter.get('/list', list)
momentRouter.get('/:momentId', detail)
// 改
momentRouter.patch('/:momentId', verifyAuth, verifyMomentPermission, update)
// 删除
momentRouter.delete('/:momentId', verifyAuth, verifyMomentPermission, remove)

// 添加标签
/*
1.验证是否登陆
2.验证是否有权限
3.额外中间件
查询中间件是否已存在，存在的话直接使用
不存在的话需要先将name添加到label中
*/
momentRouter.post(
  '/:momentId/labels',
  verifyAuth,
  verifyMomentPermission,
  addLabel,
  addLabels
)
module.exports = momentRouter
