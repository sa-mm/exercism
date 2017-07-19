const atbash = function () {
  const plain = 'abcdefghijklmnopqrstuvwxyz'
  const cipher = plain.split('').reverse()
  const needsSpacing = n => {
    return n !== 0 && n % 5 === 0
  }
  const re = /[a-z0-9]/gi
  const matchesToCipher = (match, index) => {
    const i = plain.indexOf(match.toLowerCase())
    const char = i === -1 ? match : cipher[i]
    return needsSpacing(index) ? ' ' + char : char
  }
  const encode = str => {
    return str.match(re).map(matchesToCipher).join('')
  }

  return {
    encode
  }
}

module.exports = atbash()
