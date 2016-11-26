// var DnaTranscriber = function() {
// };
// 
// DnaTranscriber.prototype.toRna = function (nucleotides) {
//     var dnaObj = {
//         'C': 'G',
//         'G': 'C',
//         'A': 'U',
//         'T': 'A'
//     };
//     var nucArr = nucleotides.split("");
//     var rnaNuc = "";
//     nucArr.forEach(function(nuc) {
//         rnaNuc = rnaNuc + dnaObj[nuc];
//     });
//     
//     return rnaNuc;
// };

class DnaTranscriber {
    toRna(nucleotides) {
        const dnaObj = {
            'C': 'G',
            'G': 'C',
            'A': 'U',
            'T': 'A'
        };
        var nucArr = nucleotides.split("");
        var rnaNuc = "";
        nucArr.forEach(function(nuc) {
            rnaNuc = rnaNuc + dnaObj[nuc];
        });
        
        return rnaNuc;
    }
};

module.exports = DnaTranscriber;
