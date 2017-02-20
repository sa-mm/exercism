var BigInt = require('./big-integer');
var Grains = function () {};

Grains.prototype.square = function (n) {
  var bigIntn = BigInt(n);
  var bigInt2 = BigInt(2);
  return bigInt2.pow(bigIntn.minus(1)).toString();
};

Grains.prototype.total = function () {
  var bigIntTotal = BigInt(0);
  for (var i = 1; i < 65; i++) {
    bigIntTotal = bigIntTotal.add(Grains.prototype.square(i));
  }
  return bigIntTotal.toString();
};

module.exports = Grains;
