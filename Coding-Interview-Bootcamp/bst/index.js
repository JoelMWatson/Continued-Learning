// --- Directions
// 1) Implement the Node class to create
// a binary search tree.  The constructor
// should initialize values 'data', 'left',
// and 'right'.
// 2) Implement the 'insert' method for the
// Node class.  Insert should accept an argument
// 'data', then create an insert a new node
// at the appropriate location in the tree.
// 3) Implement the 'contains' method for the Node
// class.  Contains should accept a 'data' argument
// and return the Node in the tree with the same value.

class Node {
  constructor(data, left=null, right=null) {
      this.data = data;
      this.left = left;
      this.right = right;
  }
  
  insert(data) {
      if (data < this.data) {
          if (this.left) {
              this.left.insert(data);
          } else {
              this.left = new Node(data);
          }
      } else {
          if (this.right) {
              this.right.insert(data);
          } else {
              this.right = new Node(data);
          }
      }
  } 
  
  contains(data) {
      let found = null;
      if (data === this.data) {
          found = this;
      }
      if (data < this.data && this.left) {
          found = this.left.contains(data);
      } 
      if (data > this.data && this.right) {
          found = this.right.contains(data);
      }
      return found;
  }
}


module.exports = Node;
