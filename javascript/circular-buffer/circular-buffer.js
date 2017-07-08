var circularBuffer = function (length) {
  var buffer = new Array(length)

  var isEmpty = function (buffer) {
    return buffer.every(e => e === null)
  }

  var read = function () {
    if (isEmpty(buffer)) throw bufferEmptyException()
    var out = buffer.shift()
    return out
  }

  var write = function (e) {
    buffer.push(e)
  }

  return {
    read,
    write
  }
}

var bufferEmptyException = function () {
  return 'The buffer is empty.'
}

var bufferFullException = function () {
  return 'The buffer is full.'
}

exports.circularBuffer = circularBuffer
exports.bufferEmptyException = bufferEmptyException
exports.bufferFullException = bufferFullException

var buffer = circularBuffer(1)
buffer.write('1')
// buffer.read()
// out