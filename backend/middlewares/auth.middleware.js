const jwt = require('jsonwebtoken');
const User = require('../models/user.model');

const authMiddleware = async (req, res, next) => {
    const token = req.headers.authorization?.split(" ")[1];

    if(!token) return res.status(401).json({message: "Unauthorized"}) //no token was sent in the headers
    try{
        const decoded = jwt.verify(token, process.env.JWT_SECRET_KEY); //returns name, email, ...
        const user = await User.findOne({email: decoded.email}).lean()
        req.user = user; //...gets all the properties of the user 
        next()

    }
    catch(err){
        return res.status(401).json({message: err.message })
    }
}

module.exports = authMiddleware;