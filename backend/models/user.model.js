const mongoose = require("mongoose");

const userSchema = mongoose.Schema({
    name: {
        type: String,
        required: 'name is required',
        min: 3,
    },
    email: {
        type: String,
        required: "email is required",
        unique: true,
        trim: true,
    },
    password: {
        type: String,
        required: "password is required",
        trim: true,
        select: false,
        min: [8, 'Must be at least 8 characters'],
    },
    user_type: {
        type: String,
        required: true,
        enum: {
            values: ['owner', 'provider'],
            message: '{VALUE} is not supported'
        },
    },
    profile_picture: {
        type: String,
        default: null
    },
    dob: {
        type: String,
        required:"date of birth is required"
    },
    phone:{
        type: Number,
        required:"phone number is required"
    },
    country:{
        type: String,
        required:"Country is required"
    }
    
});

const User = mongoose.model('User', userSchema);

module.exports = User;