const { verifyUser, handlePassword } = require('../middleware/user.middle')
const KoaRouter = require('@koa/router')
const { create, showImage } = require('../controller/user.controller')
const useRouter = new KoaRouter({ prefix: '/user' })

useRouter.post('/', verifyUser, handlePassword, create)
useRouter.get('/avatar/:userId', showImage)
module.exports = useRouter
