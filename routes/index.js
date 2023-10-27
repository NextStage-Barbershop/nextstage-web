var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Next Stage - BarberShop' });
});

/* GET login page. */
router.get('./login', function (req, res, next) {

});

/* POST login page. */
router.post('./login', function (req, res, next) {

});

router.get('/cart', function(req, res, next) {
  res.send('cart works');
});

router.get('/products', function(req, res, next) {
  res.send('products works');
});

module.exports = router;
