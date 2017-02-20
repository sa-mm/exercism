var Triangle = function (a,b,c) {
  this.a = a;
  this.b = b;
  this.c = c;
}

Triangle.prototype.kind = function () {
  var a = this.a;
  var b = this.b;
  var c = this.c;
  var arr = [a,b,c];
  arr = arr.sort(function (x,y) {
    return x < y;
  });

  // errors
  if ( a === 0 && b === 0 && c == 0) {
    throw 'triangles cannot have sides of zero length';
  } else if ( a < 0 || b < 0 || c < 0) {
    throw 'cannot have negative length';
  } else if ( !(arr[0] <= arr[1] + arr [2]) ) {
    throw 'triangles violating triangle inequality are illegal';
  }
  
  if ((a === b) && (b === c)) {
    return 'equilateral';
  } else if (a === b || a === c || b === c) {
    return 'isosceles';
  } else if (a != b && a != c && b != c) {
    return 'scalene';
  }
  throw 'something has gone wrong';
}

module.exports = Triangle;
