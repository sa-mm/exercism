const ClosedStack = function () {
  this.stack = []

  this.push = function (bracket) {
    this.stack.push(bracket)
  }

  this.pop = function () {
    this.stack.pop()
  }

  this.isNextClosed = function (bracket) {
    const stack = this.stack
    const last = stack.length - 1
    return stack[last] === bracket
  }
}

const bracket = function (str) {
  const hash = {
    '{': '}',
    '[': ']',
    '(': ')'
  }
  const openBrackets = Object.keys(hash)
  const closedStack = new ClosedStack()

  const isPairedAndBalanced = ([bracket, ...tail], bool = false) => {
    // this needs to be refactored
    // skip "bracket" if it's not a bracket
    const notBracket = /[^\[\]\{\}\(\)]/
    if (notBracket.test(bracket)) return isPairedAndBalanced(tail, bool)
    
    // If it's an open bracket,
    // then push it's pair on to the closed stack.
    if (openBrackets.includes(bracket)) {
      closedStack.push(hash[bracket])

      // If the tail includes the pair,
      // then set bool true.
      // Otherwise, return false
      if (tail.includes(hash[bracket])) {
        bool = true
      } else {
        bool = false
        return bool
      }

      // If the head is the next closed bracket,
      // pop that off the stack
    } else if (closedStack.isNextClosed(bracket)) {
      closedStack.pop()
    } else { // Otherwise, return false.
      bool = false
      return bool
    }

    // Guard clause
    if (tail.length === 0) return bool

    return isPairedAndBalanced(tail, bool)
  }

  const bracketArr = str.split('')
  return isPairedAndBalanced(bracketArr)
}

module.exports = bracket
