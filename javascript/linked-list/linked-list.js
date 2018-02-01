const Node = function(data) {
  this.data = data;
  this.next = null;
  this.prev = null;
};

const LinkedList = function() {
  this.head = null;
  this._count = 0;
};

LinkedList.prototype.push = function(data) {
  var node = new Node(data);

  if (!this.head) {
    this.head = node;
    this._count++;
  } else {
    let current = this.head;
    while (current.next) {
      previous = current;
      current = current.next;
    }
    node.prev = current;
    current.next = node;
    this._count++;
  }
};

LinkedList.prototype.pop = function() {
  let current = this.head;
  let data;
  if (!current.next) {
    data = current.data;
    current = null;
    this._count--;
    return data;
  } else {
    while (current.next) {
      current = current.next;
    }
    data = current.data;
    current.prev.next = null;
    this._count--;
    return data;
  }
};

LinkedList.prototype.shift = function() {
  const current = this.head;
  this.head = current.next;
  this._count--;
  return current.data;
};

LinkedList.prototype.unshift = function(data) {
  const node = new Node(data);
  if (!this.head) {
    this.head = node;
  } else {
    const next = this.head;
    next.prev = node;
    node.next = next;
    this.head = node;
  }
  this._count++;
};

LinkedList.prototype.count = function() {
  return this._count;
};

LinkedList.prototype.delete = function(item) {
  if (!this.head.next && this.head.data === item) {
    this.head = null;
    this._count--;
  } else {
    let current = this.head;
    while (current.next) {
      if (current.data === item) {
        current.prev.next = current.next;
        current.next.prev = current.prev;
        this._count--;
      }
      current = current.next;
    }
  }
};

module.exports = LinkedList;
