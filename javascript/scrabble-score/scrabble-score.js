var score = function (str) {
  if (str === null) {
    return 0;
  }
  var result = convertToScore(str);
  return result;
}

function convertToScore(str) {
  var one = ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'];
  var two = ['D', 'G'];
  var three = ['B', 'C', 'M', 'P'];
  var four = ['F', 'H', 'V', 'W', 'Y'];
  var five = ['K'];
  var eight = ['J', 'X'];
  var ten = ['Q', 'Z'];
  var arrScorePairs = [[one, 1], [two, 2], [three, 3], [four, 4], [five, 5], [eight, 8], [ten, 10]];

  return str.split('').reduce(function (acc, letter) {
    // console.log(letter);
    for (var i = 0; i < arrScorePairs.length; i++) {
      var arr = arrScorePairs[i];
      if (arr[0].includes(letter.toUpperCase())) {
        return acc + arr[1]
      }
    }
    return acc;
  },0);
}
module.exports = score;