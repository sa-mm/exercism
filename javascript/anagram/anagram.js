var Anagram = function(subject) {
    this.subject = subject;
}

Anagram.prototype.matches = function(matches) {
    var matchesArr = [];
    if (typeof matches == typeof '') {
        matchesArr = Array.from(arguments);
    } else if (typeof matches == typeof []) {
        matchesArr = matches;
    }
    const subject = this.subject;
    function sortIt(word) {
        return word.toLowerCase().split('').sort().join('');
    }
    const sortedSubject = sortIt(subject);
    return matchesArr.reduce( (acc,item) => {
        const sortedItem = sortIt(item);
        const theSame = subject.toLowerCase() == item.toLowerCase();
        if (sortedItem == sortedSubject && !theSame) {
            return acc.concat(item);    
        } else {
            return acc;
        }
    },[]);
}

module.exports = Anagram;
