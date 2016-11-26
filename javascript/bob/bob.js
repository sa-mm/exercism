//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {};

Bob.prototype.hey = function(str) {
    switch (true) {
        case isSilent(str):
            return 'Fine. Be that way!';
        case isShouting(str):
            return 'Whoa, chill out!';
        case isQuestion(str):
            return 'Sure.';
        default:
            return 'Whatever.'    
    }
    
    function isShouting(str) {
        return (str == str.toUpperCase()) && (str.search(/[A-Za-z]/) != -1);
    }
    
    function isQuestion(str) {
        return str.endsWith('?');
    }
    
    function isSilent(str) {
        return str.trim().length == 0;
    }
};


module.exports = Bob;
// test = '';
// 
// console.log(test == '');`
