// --- Directions
// Given a node, validate the binary search tree,
// ensuring that every node's left hand child is
// less than the parent node's value, and that
// every node's right hand child is greater than
// the parent

function validate(node, min = null, max = null) {
  let valid = true;
  if (min) {
      if (node.data < min) valid = false;
  }
  if (max) {
      if (node.data > max) valid = false;
  }
  
  if (node.left && valid) {
      if (node.left.data < node.data) {
          valid = validate(node.left, min, node.data);
      }
  }
  if (node.right && valid) {
       if (node.right.data > node.data) {
          valid = validate(node.right, node.data, max);
      }
  }
  return valid;
}

module.exports = validate;
