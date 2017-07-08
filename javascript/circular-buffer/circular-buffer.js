var circularBuffer = function (length) {
  var buffer = new Array(length)
  var length = length

  var isEmpty = function (buffer) {
    return buffer.every(e => e === undefined)
  }

  var isFull = function (buffer) {
    var itemCount = buffer.reduce((acc, item) => {
      if (item !== undefined) acc++
      return acc
    }, 0)
    return length === itemCount
  }

  var read = function () {
    if (isEmpty(buffer)) throw bufferEmptyException()
    return buffer.shift()
  }

  var write = function (e) {
    // writes of null or undefined don't occupy
    // buffer space
    if (e === null || e === undefined) return buffer

    // write to full buffer throws exception
    if (isFull(buffer)) throw bufferFullException()

    // Find the first undefined position and fill it.
    // Otherwise, push the element on to the end of the array.
    // We know we won't exceed the max length because
    // we throw an exception above.
    if (buffer.includes(undefined)) {
      const isUndefined = e => {
        return e === undefined
      }
      var index = buffer.findIndex(isUndefined)
      buffer[index] = e
    } else {
      buffer.push(e)
    }
  }

  var forceWrite = function (e) {
    if (isFull(buffer)) {
      buffer.shift()
      buffer.push(e)
    } else {
      this.write(e)
    }
  }

  var clear = function () {
    buffer = new Array(length)
  }

  return {
    read,
    write,
    forceWrite,
    clear
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
