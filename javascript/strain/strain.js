// @ts-check
'use strict'
const strain = function () {
  let toKeep, toDiscard
  const filter = function (collection, predicate) {
    toKeep = []
    toDiscard = []
    for (let i = 0; i < collection.length; i++) {
      let item = collection[i]
      predicate(item) ? toKeep.push(item) : toDiscard.push(item)
    }
  }
  const keep = function (collection, predicate) {
    filter(collection, predicate)
    return toKeep
  }
  const discard = function (collection, predicate) {
    filter(collection, predicate)
    return toDiscard
  }
  return {
    keep,
    discard
  }
}

module.exports = strain()

// Idea for second iteration from here:
// http://exercism.io/submissions/920eaea1820e4c5fab640b653e99e6ae
