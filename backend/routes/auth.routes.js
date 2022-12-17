const Router = require("express");

//Creating a router
const router = Router();

//Importing functions from controllers
const { signUp, logIn } = require("../controllers/auth.controller.js");

//Creating routes
router.post("/signup", signUp);
router.post("/login", logIn);

module.exports = router;