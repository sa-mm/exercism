var Raindrops = function () {
  const drops = { 3: 'Pling', 5: 'Plang', 7: 'Plong' }
  const factors = Object.keys(drops)

  const convert = function (num) {
    let str = ''
    factors.forEach(factor => {
      if (num % factor === 0) str += drops[factor]
    })

    if (str.length === 0) str += num.toString()

    return str
  }

  return {
    convert
  }
}

module.exports = Raindrops
