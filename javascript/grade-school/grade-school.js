var School = function() {
  this.database = {};
};

School.prototype.roster = function() {
  return this.database;
}

School.prototype.add = function(name,grade) {
  var db = this.database;
  db[grade] ? db[grade].push(name) : db[grade] = [name];
  return db[grade].sort();
}

School.prototype.grade = function(grade) {
  var students = this.database[grade];
  return students ? students : [];
}

module.exports = School;