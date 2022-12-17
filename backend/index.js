const express = require('express');
require('dotenv').config();
require('./config/db.config')
const cors = require('cors');
const app = express();

app.use(express.json());
app.use(function(req, res, next) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
    res.setHeader('Access-Control-Allow-Credentials', true);
    next();
});
app.use(cors());


const authRoutes = require('./routes/auth.routes');
app.use('/auth', authRoutes) //path extension for auth

//port is in env
app.listen(process.env.PORT,process.env.IP_ADDRESS,(err)=>{
    if(err) throw err;
    console.log(`server running on port ${process.env.PORT}`);
})