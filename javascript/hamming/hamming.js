var Hamming = function() {};


Hamming.prototype.compute = function(seq1, seq2) {
    if (seq1.length != seq2.length) {
        throw Error('DNA strands must be of equal length.')
    }
    var count = 0;
    var seq1Arr = seq1.split("");
    var seq2Arr = seq2.split("");
    seq1Arr.forEach(function(letter,index) {
        if (letter != seq2Arr[index]) {
            count++;
        }
        // letter != seq2Arr[index] ? count++ : count;
    });
    return count;
}

module.exports = Hamming;
