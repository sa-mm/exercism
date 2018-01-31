const Matrix = function(string) {
  const setRows = string => {
    const out = string.split("\n").map(str => str.split(" ").map(Number));
    return out;
  };
  const rows = setRows(string);

  const setColumns = string => {
    const rows = setRows(string);
    const out = rows.reduce((acc, arr) => {
      arr.forEach((e, i) => {
        if (acc[i]) {
          acc[i].push(e);
        } else {
          acc[i] = [];
          acc[i].push(e);
        }
      });
      return acc;
    }, []);
    return out;
  };
  const columns = setColumns(string);

  return {
    rows,
    columns
  };
};

module.exports = Matrix;
