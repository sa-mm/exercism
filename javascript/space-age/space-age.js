var SpaceAge = function (num) {
  this.seconds = num;
}

SpaceAge.prototype.onEarth = function () {
  return calculator(this.seconds, 1);
}

SpaceAge.prototype.onMercury = function () {
  return calculator(this.seconds, 0.2408467);
}

SpaceAge.prototype.onVenus = function () {
  return calculator(this.seconds, 0.61519726);
}

SpaceAge.prototype.onMars = function () {
  return calculator(this.seconds, 1.8808158);
}

SpaceAge.prototype.onJupiter = function () {
  return calculator(this.seconds, 11.862615);
}

SpaceAge.prototype.onSaturn = function () {
  return calculator(this.seconds, 29.447498);
}

SpaceAge.prototype.onUranus = function () {
  return calculator(this.seconds, 84.016846);
}

SpaceAge.prototype.onNeptune = function () {
  return calculator(this.seconds, 164.79132);
}

function calculator(seconds, period) {
  var answer = seconds / (31557600 * period);
  return myRound(answer, 2);
}

function myRound(number, precision) {
    var factor = Math.pow(10, precision);
    var tempNumber = number * factor;
    var roundedTempNumber = Math.round(tempNumber);
    return roundedTempNumber / factor;
};

module.exports = SpaceAge;
