const WordProblem = function(question) {
  const undesirables = ["What", "is", "by"];
  const op = ["plus", "minus", "divided", "multiplied"];
  const operation = {
    plus: a => b => a + b,
    minus: a => b => a - b,
    multiplied: a => b => a * b,
    divided: a => b => a / b
  };
  const answer = () => {
    const { foundOperands, foundOperators } = question
      .split(/\s|\?/)
      .filter(e => !undesirables.includes(e) && e)
      .reduce(
        (acc, e, i, array) => {
          if (op.includes(e)) {
            return Object.assign({}, acc, {
              foundOperators: [...acc.foundOperators, e]
            });
          }
          return Object.assign({}, acc, {
            foundOperands: [...acc.foundOperands, parseInt(e)]
          });
        },
        { foundOperands: [], foundOperators: [] }
      );

    if (foundOperators.length === 0) throw new ArgumentError();

    let n = 1;
    const out = foundOperands.reduce((fn, operand, idx, array) => {
      if (typeof fn === "number") {
        const operator = operation[foundOperators[n]];
        const partial = operator(fn);

        n = n + 1;
        return partial(operand);
      }
      return fn(operand);
    }, operation[foundOperators[0]]);

    return out;
  };

  return {
    answer
  };
};

function ArgumentError() {}

module.exports = {
  WordProblem,
  ArgumentError
};
