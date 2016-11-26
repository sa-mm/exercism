var Robot = function() {
  this.name = Robot.prototype.name();
};

Robot.usedNames = {};

Robot.prototype.name = function() {
  var letters = '';
  for (var i = 1; i < 3; i++) {
    var num = getRandomIntInclusive(65,90);
    letters += String.fromCharCode(num);
  }
  
  var numbers = '';
  for (var i = 1; i < 4; i++) {
    var num = getRandomIntInclusive(0,9);
    numbers += num;
  }
  name = letters + numbers;
  
  if (Robot.usedNames[name]) {
    return Robot.prototype.name();
  } else {
    Robot.usedNames[name] = true;
    return name;
  }
};

Robot.prototype.reset = function() {
  this.name = Robot.prototype.name();
};


function getRandomIntInclusive(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

module.exports = Robot;


