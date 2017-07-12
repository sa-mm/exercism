var Allergies = function (score) {
  this.score = score
  this.database = {
    1: 'eggs',
    2: 'peanuts',
    4: 'shellfish',
    8: 'strawberries',
    16: 'tomatoes',
    32: 'chocolate',
    64: 'pollen',
    128: 'cats'
  }
  this.baseScores = Object.keys(this.database).map(e => +e)

  const generate = (stop, i = 1, acc = []) => {
    if (i >= stop) return acc.concat(i)

    return generate(stop, i * 2, acc.concat(i))
  }

  const generatedScores = generate(score)
  
  // adapted from https://codereview.stackexchange.com/a/7025
  const combinations = arr => {
    const fn = function (active, rest, acc) {
      if (active.length === 0 && rest.length === 0) return
      if (rest.length === 0) {
        acc.push(active)
      } else {
        fn(active.concat(rest[0]), rest.slice(1), acc)
        fn(active, rest.slice(1), acc)
      }
      return acc
    }
    return fn([], arr, [])
  }

  const allCombinations = combinations(generatedScores)
  const sum = (a, b) => a + b
  // sumCombos is a bunch of k/v pairs
  // The keys are the sum of the items in the arr
  // { '1': [1], '2': [2], '3': [1, 2]}
  const sumCombos = allCombinations.reduce((acc, arr) => {
    const theSum = arr.reduce(sum)
    acc[theSum] = arr
    return acc
  }, {})

  this.sumCombos = sumCombos
}

Allergies.prototype.list = function () {
  const score = this.score
  const baseScores = this.baseScores
  const db = this.database
  const sumCombos = this.sumCombos

  if (score === 0) return []

  const maxBaseScore = baseScores.sort((a, b) => b - a)[0]
  const scoreStr = (score).toString()
  const componentScores = sumCombos[scoreStr].filter(e => e <= maxBaseScore)
  return componentScores.map(e => db[e])
}

Allergies.prototype.allergicTo = function (str) {
  return this.list().includes(str)
}

module.exports = Allergies
