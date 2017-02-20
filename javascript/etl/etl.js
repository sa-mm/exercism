var ETL = function(){};

ETL.prototype.transform = function(old) {
  var scores = {};
  Object.keys(old).forEach( key => {
    old[key].forEach( letter => {
      scores[letter.toLowerCase()] = Number(key);
    });
  });
  return scores;
};

module.exports = ETL;
