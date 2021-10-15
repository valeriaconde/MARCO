const express = require("express");
const app = express()
const dotenv = require('dotenv')
dotenv.config()
//const port = process.env.PORT
const port = 3005

// para utilizar json en los envíos
app.use(express.json())


const mongoose = require("mongoose")
mongoose.connect('mongodb://localhost:27017/apiclase')
    .then( () => {
        console.log("Base Datos Conexión Exitosa")
    })
    .catch(err => {
        console.log("Error Contactando a BD")
    })

const User = require('./models/user');


    
    app.use(require('./routes/routes'));

    
//listen
app.listen(port , () =>{    
    console.log('Escuchando del puerto ' + port)
});