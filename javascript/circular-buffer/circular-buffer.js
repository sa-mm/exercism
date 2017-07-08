var circularBuffer = function (length) {
  var buffer = [];
  // buffer.length = length;
  // Object.freeze(buffer.length); //
  var readCount = 0;
  var writeCount = 0;

  var read = function () {
    // readCount++;
    if (isEmpty(buffer) || readCount >= length) {
      throw bufferEmptyException;
    }

    ///find first thing that is NOT undefined and remove it.
    readCount++;
    var item = buffer[0];
    buffer.shift();
    return item;
  }

  var write = function (str) {
    if (writeCount >= length) {
      throw bufferFullException;
    }
    if (str !== null && str !== undefined) {
      buffer[writeCount] = str;
      writeCount++;
    }
  }

  var forceWrite = function (str) {
    // if (writeCount >= buffer.length) {
    //   buffer.shift();
    //   buffer.unshift('A');
    //   buffer.reverse();
    // } else {
    //   write(str);
    // }
  }

  var clear = function () {
    buffer = [];
    // buffer.length = length;
    readCount = 0;
    writeCount = 0;
  }

  return {
    'write': write,
    'read': read,
    'forceWrite': forceWrite,
    'clear': clear
  }
}

var isEmpty = function (arr) {
  var result = true;
  for (n in arr) {
    if (n !== undefined) {
      result = false;
    }
  }
  return result;
}

exports.circularBuffer = circularBuffer;
exports.bufferEmptyException = function () { };
exports.bufferFullException = function () { };