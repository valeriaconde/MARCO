const bcrypt = require('bcrypt')

const hashPassword = async (pw) => {
    const hash = await bcrypt.hash(pw, 12)
    console.log(hash);
    return hash;
}

const login = async (password, hashedPw) => {
    const result = await bcrypt.compare(password, hashPassword)
    if (result) {
        console.log("Password exitoso");
    } else {
        console.log("Password incorrecto");
    }
}

hashPassword('conde');
login('conde', '$2b$12$ibBRnXqthARxy4IQ1dQyxOm45ddOT8089rZZEfr5nMvwjUkJaTKQm');
