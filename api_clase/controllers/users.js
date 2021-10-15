const UsersService = require('../services/users');

// Now the controller is using the services associated to the product resource.
// Here, we use the req,res, extracting whatever the service needs to work.

module.exports = {
    login: async (req, res) => {
        // Notice our app declared app.use(express.json()); for doing this
        const {username, password} = req.body;
        
        const token = await UsersService.login(username, password)
        if ( token ) 
            res.status(201).json({
                message: "token",
                token: token,
                success: true
            });
        else {
            res.json({message: "Authentication Failed", success: false})
        }

        
    },
    addUser: async (req, res, next) => {
        // Notice our app declared app.use(express.json()); for doing this
        const {username, password, usertype} = req.body;
        
        const newUser = await UsersService.addUser(username, password, usertype)
        res.status(201).json({
            message: "User Added",
            newUser,
            success : true
        });
    },


    
    getUser: async (req, res, next) => {
        const user = await UsersService.getUser(req.params.username);
        console.log(user)
        if (user){
            res.status(200).json({user});
        }else{
            res.status(404).json({"message": "NotFound"});
        }
    },
    
    getAllUsers: async(req, res, next) => {       
        const users = await UsersService.getAllUsers();
        res.status(200).json({users});
    },

    updateUser: async (req, res, next) => {
        // Notice our app declared app.use(express.json()); for doing this
        const username = req.params.username;

        const password = req.body.password;
        const usertype = req.body.usertype;

        
        const updateUser = await UsersService.updateUser(username, password, usertype)
        res.status(201).json({
            message: "User Updated",
            updateUser
        });
    },


    deleteUser: async (req, res, next) => {
        // Notice our app declared app.use(express.json()); for doing this
        const username = req.params.username;
        
        const result = await UsersService.deleteUser(username)
        if (result){
            res.status(201).json({
                message: "User Deleted",
            });
        } else {
            res.status(404).json({"message": "NotFound"});
        }

    }
};

