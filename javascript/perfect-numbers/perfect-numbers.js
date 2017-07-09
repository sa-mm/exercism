const PerfectNumber = function () {}

PerfectNumber.prototype.classify = function (n) {
  const getFactors = n => {
    var arr = []
    // This could probably be optimized.
    // Find prime factors first (?)
    var possibleFactor = 1
    do {
      if (n % possibleFactor === 0) {
        arr.push(possibleFactor)
      }
      possibleFactor++
    } while (possibleFactor < n)

    return arr
  }

  const sum = (a, b) => a + b

  const sumFactors = n => getFactors(n).reduce(sum)

  const isPerfect = n => {
    const theSum = sumFactors(n)

    // edge case: no other factors than itself means
    // it's deficient
    if (n === 1) return false
    return theSum === n
  }

  const isAbundant = n => {
    const theSum = sumFactors(n)

    return theSum > n
  }

  const isDeficient = n => {
    // deficient edge case
    if (n === 1) return true

    const theSum = sumFactors(n)

    return theSum < n
  }

  // Not sure about the best way to organize this.

  // Invalid inputs
  if (n <= 0) return 'Classification is only possible for natural numbers.'

  if (isPerfect(n)) return 'perfect'
  if (isAbundant(n)) return 'abundant'
  if (isDeficient(n)) return 'deficient'
}

module.exports = PerfectNumber
