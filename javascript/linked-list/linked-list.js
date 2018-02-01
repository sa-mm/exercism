const Node = function(data) {
  this.data = data;
  this.next = null;
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
      current = current.next;
    }
    current.next = node;
    this._count++;
  }
};

LinkedList.prototype.pop = function() {
  let current = this.head;
  let previous = {};
  while (current.next) {
    previous = current;
    current = current.next;
  }
  previous.next = null;
  this._count--;
  return current.data;
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
    node.next = { ...this.head };
    this.head = node;
  }
  this._count++;
};

LinkedList.prototype.count = function() {
  return this._count;
};

LinkedList.prototype.delete = function(item) {
  // const traverse = (node, item, list = new LinkedList()) => {
  //   const { data, next } = node;
  //   if (data !== item) list.push(data);
  //   if (!next) {
  //     return list;
  //   } else {
  //     return traverse(next, item, list);
  //   }
  // };
  // const newList = traverse(this.head, item);

  // this.head = newList.head;
  // this.count = () => newList.count();

  let current = this.head;
  const list = new LinkedList();
  while (current.next) {
    if (current.data !== item) list.push(current.data);
    current = current.next;
  }

  if (current.data !== item) list.push(current.data);

  this.head = list.head;
  this.count = () => list.count();
};

module.exports = LinkedList;
