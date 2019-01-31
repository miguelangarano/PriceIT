const express = require('express');
const router = express.Router();

//Product Model
const Product = require('../../models/Product');

//@route GET api/products?
//@desc Get all Products
//@access Public
router.get('/',(req,res) => {
    Product.find({name: new RegExp(req.query.name+'+', "i")})
    .sort({date: -1})
    .then(Products => res.json(Products))
});

//@route POST api/Products
//@desc new POST 
//@access Public
router.post('/', (req,res) => {
    const postProduct = new Product({
        imgUrl:     req.body.imgUrl,
        id_user:    req.body.id_user,
        price:      req.body.price,
        rating:     req.body.rating,
        name:       req.body.name,
        content:    req.body.content,
        contentUnit:req.body.contentUnit,
        place:      req.body.place
    });

    postProduct.save().then(Product => res.json(Product));
});

module.exports = router;