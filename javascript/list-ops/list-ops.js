var List = function(values = []) {
  this.values = values;
};

List.prototype.foldl = function(fn, acc, [head, ...tail] = this.values) {
  if (!head) return acc

  const newAcc = fn(head, acc)

  if (tail.length === 0) return newAcc

  return this.foldl(fn, newAcc, tail)
}

List.prototype.append = function(list) {
  const reducer = (e, acc) => [...acc, e]
  const values = new List(list.values).foldl(reducer, this.values)
  return new List(values)
};

List.prototype.concat = List.prototype.append;

List.prototype.filter = function(pred) {
  const reducer = (e, acc) => {
    return pred(e) ? [...acc, e] : acc
  }
  const values = new List(this.values).foldl(reducer, [])
  return new List(values)
};

List.prototype.length = function() {
  const reducer = (e, acc) => acc + 1
  return new List(this.values).foldl(reducer, 0)
};

List.prototype.map = function(fn) {
  const reducer = (e, acc) => [...acc, fn(e)]
  const values = new List(this.values).foldl(reducer, [])
  return new List(values)
};

List.prototype.foldr = function(fn, acc) {
  return new List(this.values).reverse().foldl(fn, acc)
};

List.prototype.reverse = function() {
  const reducer = (e, acc) => [e, ...acc]
  const values = new List(this.values).foldl(reducer, [])
  return new List(values)
};

module.exports = List;