const mongoose = require('mongoose');
const UserModel = require('../models/user');
const jwt = require("jsonwebtoken")

// Now this service is providing whatever is needed to interact with the database but at the same time
// validating the BLL requirements.

const login = async (username, password) => {   

    if(!username || !password ){
        return false
    }
    
    //const  authUser = User.find(user => user.username && user.password == password)
    const authUser = await UserModel.findAndValidate(username, password);

    if (authUser){
        //generate a token
        const token = jwt.sign({username: username}, "SECRET")

        if (token){
            return token
        } else {
            return false
        }
    } else {
        return false
    }
    // All validation, checks, further tasks (sending emails, etc.) must happen here.
    //return token;

};

const addUser = async (username, password, usertype) => {   
    const usermodel = new UserModel({
        username: username,
        password: password,
        usertype: usertype
    });

    // All validation, checks, further tasks (sending emails, etc.) must happen here.
    const newUser = await usermodel.save();
    return newUser;
};


const getUser = async(username) => {
    //const user = await User.findById(username);
    const user = await UserModel.findOne({ username });
    // const product = await ProductModel.findOne({_id = id});
    // const product = await ProductModel.findById(id).select("name brand");
    // const product = await ProductModel.findById(id, "name brand");
    return user;        
};

const getAllUsers = async() => {
    const users = await UserModel.find({});
    // const products = await ProductModel.find({}).select("name brand"); 
    // or
    // const products = await ProductModel.find({}, "name brand");
    return users;
};

const updateUser = async(username, password, usertype) => {

    try{
        const user = await UserModel.findOne({ username });
        user.password = password;
        user.usertype = usertype;
        await user.save()

        return user;

    } catch (err) {
        return false;
    }

};

const deleteUser = async(username) => {

    try{
        await UserModel.findOneAndDelete({ username });

        return true;

    } catch (err) {
        return false;
    }

};




module.exports = {
    login,
    addUser,
    getUser,
    getAllUsers,
    updateUser,
    deleteUser
};
