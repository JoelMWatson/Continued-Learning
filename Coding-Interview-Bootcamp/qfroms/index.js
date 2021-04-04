// --- Directions
// Implement a Queue datastructure using two stacks.
// *Do not* create an array inside of the 'Queue' class.
// Queue should implement the methods 'add', 'remove', and 'peek'.
// For a reminder on what each method does, look back
// at the Queue exercise.
// --- Examples
//     const q = new Queue();
//     q.add(1);
//     q.add(2);
//     q.peek();  // returns 1
//     q.remove(); // returns 1
//     q.remove(); // returns 2

const Stack = require('./stack');

class Queue {
  constructor() {
    this.holder = new Stack();
    this.helper= new Stack();
  }

  add(x) {
    while(this.holder.peek()) {
      this.helper.push(this.holder.pop());
    }
    this.helper.push(x);
    while(this.helper.peek()) {
      this.holder.push(this.helper.pop());
    }
  }

  remove() {
    return this.holder.pop();
  }

  peek() {
    return this.holder.peek();
  }
}

module.exports = Queue;
