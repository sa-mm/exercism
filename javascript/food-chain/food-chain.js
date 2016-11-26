var FoodChain = function() {
    this.animalObj = {
        1: 'fly',
        2: 'spider',
        3: 'bird',
        4: 'cat',
        5: 'dog',
        6: 'goat',
        7: 'cow',
        8: 'horse'
    };
};

FoodChain.prototype.verse = function(num) {
    var animal = this.animalObj[num];
    switch(animal) {
      case 'fly':
        return 'I know an old lady who swallowed a fly.\nI don\'t know why she swallowed the fly. Perhaps she\'ll die.\n';
      case 'spider':
        return 'I know an old lady who swallowed a spider.\nIt wriggled and jiggled and tickled inside her.\n' + 
        'She swallowed the spider to catch the fly.\n' + 
        'I don\'t know why she swallowed the fly. Perhaps she\'ll die.\n';
      case 'bird':
        return 'I know an old lady who swallowed a bird.\n' +
        'How absurd to swallow a bird!\n' +
        'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n' +
        'She swallowed the spider to catch the fly.\n' +
        'I don\'t know why she swallowed the fly. Perhaps she\'ll die.\n';
      case 'cat':
        return 'I know an old lady who swallowed a cat.\n' +
        'Imagine that, to swallow a cat!\n' +
        'She swallowed the cat to catch the bird.\n' +
        'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n' +
        'She swallowed the spider to catch the fly.\n' +
        'I don\'t know why she swallowed the fly. ' +
        'Perhaps she\'ll die.\n';
      case 'dog':
        return 'I know an old lady who swallowed a dog.\n' +
        'What a hog, to swallow a dog!\n' +
        'She swallowed the dog to catch the cat.\n' +
        'She swallowed the cat to catch the bird.\n' +
        'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n' +
        'She swallowed the spider to catch the fly.\n' +
        'I don\'t know why she swallowed the fly. ' +
        'Perhaps she\'ll die.\n';
      case 'goat':
        return 'I know an old lady who swallowed a goat.\n' +
        'Just opened her throat and swallowed a goat!\n' +
        'She swallowed the goat to catch the dog.\n' +
        'She swallowed the dog to catch the cat.\n' +
        'She swallowed the cat to catch the bird.\n' +
        'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n' +
        'She swallowed the spider to catch the fly.\n' +
        'I don\'t know why she swallowed the fly. ' +
        'Perhaps she\'ll die.\n';
      case 'cow':
        return 'I know an old lady who swallowed a cow.\n' +
        'I don\'t know how she swallowed a cow!\n' +
        'She swallowed the cow to catch the goat.\n' +
        'She swallowed the goat to catch the dog.\n' +
        'She swallowed the dog to catch the cat.\n' +
        'She swallowed the cat to catch the bird.\n' +
        'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n' +
        'She swallowed the spider to catch the fly.\n' +
        'I don\'t know why she swallowed the fly. ' +
        'Perhaps she\'ll die.\n';
      case 'horse':
        return 'I know an old lady who swallowed a horse.\n' + 'She\'s dead, of course!\n';
      }
}

FoodChain.prototype.verses = function(start,end) {
  var output = '';
  for (var i = 1; i < (end + 1); i++) {
    output += this.verse(i) + '\n';
  }
  return output;
}

module.exports = FoodChain;
