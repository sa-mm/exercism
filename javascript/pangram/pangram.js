var Pangram = function(sentence) {
    this.sentence = sentence;
};

Pangram.prototype.isPangram = function() {
    const sen = this.sentence;
    if (sen == undefined) return false;
    const alphabet = 'abcdefghijklmnopqrstuvwxyz'.split('');
    const re = /[^A-Za-z]+/g;
    const senArr = sen.replace(re, '').toLowerCase().split('').sort();
    const tempArr = senArr.reduce( (acc, letter) => {
        if (acc.includes(letter)) {
            return acc
        } else {
            return acc.concat(letter);
        }
    },[]);
    if (tempArr.join('') == alphabet.join('')) {
        return true;
    } else {
        return false;
    }
};

module.exports = Pangram;
