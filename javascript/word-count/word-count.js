var Words = function() {};

Words.prototype.count = function(str) {
    var wordsObj = {};
    var strArr = str.toLowerCase().trim().split(/\s+/);
    strArr.forEach(function(word) {
        
        // I don't entirely understand this part.
        if (typeof wordsObj[word] === 'function') {
            return wordsObj[word] = 1;
        }
        
        if (wordsObj[word]) {
            wordsObj[word]++;
        } else {
            wordsObj[word] = 1;
        }
    });
    return wordsObj;
};

module.exports = Words;

// Not passing last test.
