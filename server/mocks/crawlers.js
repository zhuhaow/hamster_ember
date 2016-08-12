/*jshint node:true*/
module.exports = function(app) {
    var express = require('express');
    var crawlersRouter = express.Router();

    crawlersRouter.get('/', function(req, res) {
        res.send({
            'crawlers': []
        });
    });

    crawlersRouter.post('/', function(req, res) {
        res.status(201).end();
    });

    crawlersRouter.post('/find_images', function(req, res) {
        res.send({
            images: [
                {src: 'http://www.slate.com/content/dam/slate/blogs/wild_things/2014/07/10/140710_WILD_Hamster.jpg.CROP.promo-mediumlarge.jpg'} ,
                {src: 'http://www.petwebsite.com/hamsters/hamsters_images/syrian-hamster_000008437184.jpg'},
                {src: 'http://www.animalsdo.com/wp-content/uploads/2014/09/hamsters1.jpg'}
            ]
        })
    })

    // The POST and PUT call will not contain a request body
    // because the body-parser is not included by default.
    // To use req.body, run:

    //    npm install --save-dev body-parser

    // After installing, you need to `use` the body-parser for
    // this mock uncommenting the following line:
    //
    //app.use('/api/crawlers', require('body-parser').json());
    app.use('/api/crawlers', crawlersRouter);
};
