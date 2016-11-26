var Isogram = function (word) {
    this.word = word;
};

Isogram.prototype.isIsogram = function () {
    var wrd = this.word;
    wrd = wrd.toLowerCase();
    var wordArr = wrd.split('');
    wordArr = wordArr.filter(function(letter) {
        return letter != '-' && letter != ' ';
    });
    for (var i = 0; i < wordArr.length; i++) {
        let index1 = wrd.indexOf(wordArr[i]);
        let index2 = wrd.lastIndexOf(wordArr[i]);
        if (index1 != index2) {
            return false;
            break;
        }
    }
    return true;
};

module.exports = Isogram;
