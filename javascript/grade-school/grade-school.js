var School = function () {
  this.database = {}
}

School.prototype.roster = function () {
  // last test wants this to return a sorted database
  // Odd to be sorting an object?
  var db = this.database
  var grades = Object.keys(db).sort()

  var sortedDB = grades.reduce((acc, grade) => {
    acc[grade] = db[grade].sort()
    return acc
  }, {})

  this.database = sortedDB
  return db
}

School.prototype.add = function (name, grade) {
  var db = this.database

  // if grade doesn't exist in db
  // create an empty array for it
  if (!db[grade]) {
    db[grade] = []
  }

  db[grade].push(name)
}

School.prototype.grade = function (grade) {
  var db = this.database

  return db[grade] ? db[grade].sort() : []
}

module.exports = School
