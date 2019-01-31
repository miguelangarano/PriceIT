const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const UserSchema = new Schema({
    username: {
        type: String,
        required: true
    },
    password: {
        type:String,
        required: true
    },
    email: {
        type:String,
        unique:true,
        required: true
    },
    rating: {
        type:Number,
        required: true
    },
    products: {
        type:Number,
        required: true
    }
});

module.exports = User = mongoose.model('user', UserSchema)
