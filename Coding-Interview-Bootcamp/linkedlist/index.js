// --- Directions
// Implement classes Node and Linked Lists
// See 'directions' document

class Node {
  constructor(data, next=null) {
    this.data = data;
    this.next = next;
  }
}

class LinkedList {
  constructor() {
    this.head = null;
  }

  insertFirst(data) {
    this.head = new Node(data, this.head);
  }

  size() {
    if (!this.head) return 0;
    let count = 1;
    let cur =  this.head;
    while (cur.next) {
      cur = cur.next;
      count++;
    }
    return count;
  }

  getFirst() {
    return this.head;
  }

  getLast() {
    let current = this.head;
    while (current?.next) {
      current = current.next;
    }
    return current;
  }

  clear() {
    this.head = null;
  }

  removeFirst() {
    let head = this.head;
    this.head = this.head?.next;
    return head;
  }

  removeLast() {
    let previous = this.head; 
    let current = previous?.next;
    if (!current) {
      this.head = null;
    }
    while(current?.next) {
      previous = current;
      current = current.next;
    }
    if (previous) {
      previous.next = null;
    }
  }

  insertLast(data) {
    let node = new Node(data);
    let current = this.getLast();
    if (current) {
      current.next = node;
    } else {
      this.head = node;
    }
  }

  getAt(position) {
    let counter = 0;
    let current = this.head;
    while(current && counter < position) {
      current = current.next;
      counter++
    }
    return current;
  }

  removeAt(position) {
    let removed = null;
    if (position < 1) {
      removed = this.head;
      if (this.head) this.head = this.head.next;
    } else {
      let current = this.getAt(position - 1);
      if (current?.next) {
        removed = current.next;
        current.next = current.next.next;
      }
    }
    return removed;
  }

  insertAt(data, position) {
    if (!position) {
      let node = new Node(data, this.head);
      this.head = node;
    } else {
      let prev = this.getAt(position-1);
      if (prev) {
        if (prev.next) {
          let node = new Node(data, prev.next);
          prev.next = node;
        } else {
          prev.next = new Node(data);
        }
      } else {
        this.getLast().next = new Node(data);
      }
    }
  }

  forEach(fn) {
    let current = this.head;
    while(current) {
      fn(current);
      current = current.next;
    }
  }

  // Cool ass trick using Generators/Iterators to create for...of
  // * denotes that it is a generator (enables use of "yield")
  // [Symbol.iterator] specifies the default iterator for the class
  *[Symbol.iterator]() {
    let node = this.head;
    while(node) {
      yield node;
      node = node.next;
    }
  }

}

module.exports = { Node, LinkedList };
