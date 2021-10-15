const jwt = require( 'jsonwebtoken' );
const SECRET = "SECRET"

function validateToken( req, res, next ) {
    let accessGranted = false;
    let token = req.headers.auth_key;

    console.log(token)

    if(!token){
        res.statusMessage = "You need to send the authToken(JWT).";
        return res.status( 401 ).end();
    }
    
    if(token){
        jwt.verify(token, "SECRET", (err, decoded) => {      
            if (err) {
                res.statusMessage = "Token incorrecto";
                return res.status( 420 ).end(); 
            } 
            else {
               
              accessGranted = true; 
            
            }
          });
    }
    if(!accessGranted){
        res.statusMessage = "No authentication.";
        return res.status( 401 ).end();
    }
    next();

}

module.exports = validateToken;