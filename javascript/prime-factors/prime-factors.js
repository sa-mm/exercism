// @ts-check
// hardest part about this was figuring out
// how to export the damn thing
var _for = function (n) {
  const recurse = function (n, possibleFactor, acc) {
    if (n % possibleFactor !== 0) {
      acc.newMax = n
      return acc
    }
    acc.isFactor = true
    // Pushing it on to an array allows me
    // to keep track of how many times
    // the factor goes into n
    acc.factorArr.push(possibleFactor)
    n = n / possibleFactor
    return recurse(n, possibleFactor, acc)
  }
  let factors = []
  let possibleFactor = 2
  while (possibleFactor <= n) {
    // I'm not sure that recursion makes this
    // easier to think about, but it's following
    // the algorithm in the README
    // returns an object:
    // {isFactor: Boolean, factorArr: Array, newMax: Number}
    let result = recurse(n, possibleFactor, {isFactor: false, factorArr: []})
    if (result.isFactor) factors.push(...result.factorArr)
    n = result.newMax
    possibleFactor++
  }
  return factors
}
module.exports = {
  for: _for
}
