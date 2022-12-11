const express = require('express');
require('dotenv').config();
require('./config/db.config')
const app = express();

app.use(express.json());


//prot is in env
app.listen(process.env.PORT, (err)=>{
    if(err) throw err;
    console.log(`server running on port ${process.env.PORT}`);
})