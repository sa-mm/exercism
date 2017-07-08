const Binary = function (str) {
  this.string = str
}

Binary.prototype.toDecimal = function () {
  const str = this.string

  const isValid = str => {
    return str.split('').every(c => c === '1' || c === '0')
  }
  if (!isValid(str)) return 0

  const strArr = str.split('')
  let numArr = []
  const max = strArr.length - 1
  for (let i = 0, count = max; count >= 0; i++, count--) {
    let c = strArr[i]

    let n = parseInt(c) * Math.pow(2, count)

    numArr.push(n)
  }

  const sum = (a, b) => a + b
  return numArr.reduce(sum)
}

module.exports = Binary
