var toRoman = function(num) {
    var romans = {
        1000: "M",
        900: "CM",
        500: "D",
        400: "CD",
        100: "C",
        90: "XC",
        50: "L",
        40: "XL",
        10: "X",
        9: "IX",
        5: "V",
        4: "IV",
        1: "I"
    };

    var romanKeys = Object.keys(romans).sort(function(a,b) {
        return b - a;
    });

    return romanKeys.reduce(function(acc,arabicKey) {
        var roman = romans[arabicKey];
        while (acc.arabic >= arabicKey) {
            acc.romanOutput += roman;
            acc.arabic -= arabicKey;
        }
        return acc;
    },{'romanOutput': '', 'arabic': num}).romanOutput;
}

module.exports = toRoman;