var BeerSong = function() {};

BeerSong.prototype.verse = function(num) {
    var moreBottles = (num - 1) + ' bottles ';
    if ( (num - 1) == 1) {
        moreBottles = (num - 1) + ' bottle ';
    }
    if (num == 1) {
        return '1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n'
    } else if (num == 0) {
        return 'No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n'
    }
    return num + ' bottles of beer on the wall, ' + num + ' bottles of beer.\nTake one down and pass it around, ' + moreBottles + 'of beer on the wall.\n'
};

BeerSong.prototype.sing = function(startVerse, endVerse = 0) {
    tempArr = [];
    for (var i = endVerse; i < (startVerse + 1); i++) {
        tempArr.push(i);
    }
    var output = tempArr.reduce(function(acc, item) {
        return BeerSong.prototype.verse(item) + '\n' + acc;    
    },"");
    return output.trim() + '\n';
};

module.exports = BeerSong;
