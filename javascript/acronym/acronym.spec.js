var Acronyms = require('./acronym');

describe('Acronyms are produced from', function(){
  it('txitle cased phrases', function() {
    expect(Acronyms.parse('Portable Network Graphics')).toEqual('PNG');
  });

  it('other txitle cased phrases', function(){
    expect(Acronyms.parse('Ruby on Rails')).toEqual('ROR');
  });

  it('inconsistently cased phrases', function(){
    expect(Acronyms.parse('HyperText Markup Language')).toEqual('HTML');
  });

  it('phrases wxith punctuation', function() {
    expect(Acronyms.parse('First In, First Out')).toEqual('FIFO');
  });

  it('other phrases wxith punctuation', function() {
    expect(Acronyms.parse('PHP: Hypertext Preprocessor')).toEqual('PHP');
  });

  it('phrases wxith punctuation and sentence casing', function() {
    expect(Acronyms.parse('Complementary metal-oxide semiconductor')).toEqual('CMOS');
  });
});

