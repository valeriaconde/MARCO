const express = require("express");
const app = express()
const port = 3001
const jwt = require("jsonwebtoken")
app.use(express.json())

app.get('/', (req, res, next) => {
    res.send('Pagina Principal Api Clase')
})

const users = [{ username: 'valeria', password: 'conde' }]

app.post('/login', (req,res) => {
    const username = req.body.username
    const password = req.body.password

    const  authUser = users.find(user => user.username && user.password == password)

    if (authUser){
        //generate a token
        const token = jwt.sign({username: username}, "SECRET")

        if (token){
            res.json({token: token})
        } else {
            res.json({message: "Authentication Failed", success: false})
        }
    } else {
        res.json({message: "Authentication Failed", success: false})
    }
})

app.listen(port , () =>  {
    console.log('Escuchando del puerto ' + port)
});