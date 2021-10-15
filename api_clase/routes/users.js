const express = require('express');
const router = express.Router();

const UsersController = require('../controllers/users');
const validaToken = require('../middleware/validatoken.js')

router.post('/login', UsersController.login);

router.get('/', UsersController.getAllUsers);

router.get('/:username', UsersController.getUser);

router.post('/addUser', UsersController.addUser);

router.post('/update/:username', UsersController.updateUser);

router.delete('/delete/:username', UsersController.deleteUser);


module.exports = router;