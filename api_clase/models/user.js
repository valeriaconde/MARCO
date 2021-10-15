const mongoose = require("mongoose")
const Schema = mongoose.Schema
const bcrypt = require("bcrypt")

const userSchema = new Schema({
    username: {
        type: String,
        require: true,
        unique: true,
        trim: true,
        minlength: 4
    },
    password: {
        type: String,
        require: true,
        unique: false,
        trim: true,
        minlength:8
    },
    usertype: [{
        type: String,
        require: true,
        unique: false,
        trim: true
    }]
}, {
    timestamps: true
});
 
userSchema.pre('save', async function (next) {
    if (!this.isModified('password')) return next();
    this.password = await bcrypt.hash(this.password, 12);
    next();
})

userSchema.statics.findAndValidate =  async function (username, password) {
    try{
        var foundUser =  await this.findOne({ username })
        if(!foundUser) {
            return false
        }

        const isValid =  await bcrypt.compare(password, foundUser.password);

    return isValid ? foundUser : false;
    } catch (error) {
        console.log("Error")
    }
}


const User = mongoose.model('User', userSchema )
 
module.exports = User;
