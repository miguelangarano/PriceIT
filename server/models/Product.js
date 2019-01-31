const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const ProductoSchema = new Schema({
    imgUrl: {
        type: String,
        required: true
    },
    id_user: {
        type:String,
        required: true
    },
    price: {
        type:Number,
        required: true
    },
    rating: {
        type:Number,
        required: true
    },
    name: {
        type:String,
        required: true
    },
    content: {
        type:Number,
        required: true
    },
    contentUnit: {
        type:String,
        required: true
    },
    place: {
        type:String,
        required: true
    },
    date: {
        type:Date,
        default: Date.now
    }
});

module.exports = Producto = mongoose.model('producto', ProductoSchema)
