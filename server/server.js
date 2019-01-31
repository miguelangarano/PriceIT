const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const items = require('./routes/api/items');
const products = require('./routes/api/products');
const users = require('./routes/api/users')
const image=require('./routes/api/product-image');
const processImage=require('express-processimage');
const path = require('path');

const app = express();


//DB config
const db = require('./config/keys').mongoURI;

//Connect to Mongo
mongoose
    .connect(db)
    .then(() => console.log("MongoDB connected successfully"))
    .catch(err => console.log(err));

// Use routes
app.use('/api/items',items);
app.use(bodyParser.json());
//upload and get images
app.use(processImage('/static'));
app.use('/static',express.static('public'));
app.use('/api/upload', image);
app.use('/static',image);

app.use('/api/products', products);
app.use('/api/users', users);

// Serve static assets if in production
if(process.env.NODE_ENV === 'production'){
    // Set static folder
    app.use(express.static('client/build'));
    
    app.get('*',(req,res) => {
        res.sendFile(path.resolve(__dirname,'client','build','index.html'));
    });
}

const port = process.env.PORT || 5000;

app.listen(port, console.log(`Server started on port ${port}`));