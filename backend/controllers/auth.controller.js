const User = require('../models/user.model');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const logIn = async (req, res)=>{
    const {email, password} = req.body;
    try {
    
        const user = await User.findOne({email: email}).select("+password");
        if(!user) return res.status(404).json({message: "Invalid Credentials"});

        const isMatch = await bcrypt.compare(password, user.password);
        if(!isMatch) return res.status(404).json({message: "Invalid Credentials"});

        const token = jwt.sign({email: user.email, id: user.id}, process.env.JWT_SECRET_KEY, { expiresIn: '2h'});
        res.status(200).json({token: token, user:user})
    }
    catch (error) {
        res.status(400).json({ message: err.message });
    }
}
const signUp = async (req, res) => {
    const { name, email, password, user_type, dob, phone, country } = req.body;

    try {
        //Creating a new instance of User model
        const user = new User();

        user.user_type = user_type;
        user.email = email;
        user.password = await bcrypt.hash(password, 10);
        user.name= name;
        user.dob= dob;
        user.phone= phone;
        user.country= country;
        user.profile_picture=null;

        //Saving the created user in database
        await user.save();

        //Creating a new token 
        const token = jwt.sign({email: user.email, id: user.id}, process.env.JWT_SECRET_KEY, {
            expiresIn: '2h'
        });

        //Returning user and token
        res.status(200).json({ user: user, token });
    } catch (err) {
        res.status(400).json({ message: err.message });
    }
}

module.exports = {
    signUp,
    logIn
}