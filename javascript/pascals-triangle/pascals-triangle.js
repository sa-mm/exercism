var Triangle = function(n) {
  this.numberOfRows = n;

  const createRows = (n, pos = 1, rows = []) => {
    if (pos > n) return rows;

    const newRows = Array.from(Array(pos), (e, i) => {
      if (i === 0) return 1;
      if (i === pos - 1) return 1;
      return sumPreviousRow(i, rows);
    });
    return createRows(n, pos + 1, [...rows, newRows]);
  };

  const sumPreviousRow = (n, rows) => {
    const lastRow = last(rows);
    return lastRow[n - 1] + lastRow[n];
  };

  const last = rows => {
    return rows[rows.length - 1];
  };

  this._rows = createRows(this.numberOfRows);
  this._lastRow = last(this._rows);

  return {
    rows: this._rows,
    lastRow: this._lastRow
  };
};

module.exports = Triangle;
