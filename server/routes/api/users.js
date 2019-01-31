const express = require('express');
const router = express.Router();

//Product Model
const User = require('../../models/User');

//@route GET api/users
//@desc Get all Users
//@access Public
/*
router.get('/',(req,res) => {
    
    Product.find()
    .sort({date: -1})
    .then(Products => res.json(Products))
});
*/

//@route GET api/products?
//@desc Get all Products
//@access Public
router.get('/',(req,res) => {
    User.find({email: new RegExp(req.query.email+'+', "i")})
    .sort({username:1})
    .then(Users => res.json(Users))
});

//@route POST api/User
//@desc new POST 
//@access Public
router.post('/', (req,res) => {
    const postUser = new User({
        username:   req.body.username,
        password:   req.body.password,
        email:      req.body.email,
        rating:     req.body.rating,
        products:   req.body.products
    });

    postUser.save().then(User => res.json(User));
});

module.exports = router;