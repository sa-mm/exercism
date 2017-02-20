Acronyms = {
  parse: function (str) {
    var colonIndex = str.search(/:/);
    if (colonIndex) {
      str = str.slice(0, colonIndex);
    }
    var re = /\s|\-/g;
    var arr = str.split(re).map(function (word) {
      var match = word.match(/[A-Z]/g);
      if (match) {
        return match.join('');
      } else {
        return word[0].toUpperCase();
      }
    });
    return arr.join('');
  }
}

module.exports = Acronyms;