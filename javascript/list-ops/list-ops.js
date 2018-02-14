const flow = (...fns) => value =>
  new List(fns).foldl((fn, acc) => fn(acc), value);

const flowRight = (...fns) => value =>
  new List(fns).foldr((fn, acc) => fn(acc), value);

const foldlToList = (list, reducerForFoldl, foldAcc) => {
  return flow(
    values => new List(values).foldl(reducerForFoldl, foldAcc),
    values => new List(values)
  )(list.values);
};
const List = function(values = []) {
  this.values = values;
};

List.prototype.foldl = function(fn, acc, [head, ...tail] = this.values) {
  if (!head) return acc; //empty lists

  const newAcc = fn(head, acc);
  if (tail.length === 0) return newAcc;

  return this.foldl(fn, newAcc, tail);
};

List.prototype.append = function(list) {
  const reducer = (e, acc) => [...acc, e];
  return foldlToList(list, reducer, this.values);
};

List.prototype.concat = List.prototype.append;

List.prototype.filter = function(pred) {
  const reducer = (e, acc) => {
    return pred(e) ? [...acc, e] : acc;
  };
  return flow(
    values => new List(values).foldl(reducer, []),
    values => new List(values)
  )(this.values);
};

List.prototype.length = function() {
  const reducer = (e, acc) => acc + 1;
  return new List(this.values).foldl(reducer, 0);
};

List.prototype.map = function(fn) {
  const reducer = (e, acc) => [...acc, fn(e)];
  return flow(
    values => new List(values).foldl(reducer, []),
    values => new List(values)
  )(this.values);
};

List.prototype.foldr = function(fn, acc) {
  return new List(this.values).reverse().foldl(fn, acc);
};

List.prototype.reverse = function() {
  const reducer = (e, acc) => [e, ...acc];
  return flow(
    values => new List(values).foldl(reducer, []),
    values => new List(values)
  )(this.values);
};

module.exports = List;
