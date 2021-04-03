// --- Directions
// Given the root node of a tree, return
// an array where each element is the width
// of the tree at each level.
// --- Example
// Given:
//     0
//   / |  \
// 1   2   3
// |       |
// 4       5
// Answer: [1, 3, 2]

function levelWidth(root) {
  let queue = [root, null];
  let levels = [0]
  while(queue.length > 1) {
      let current = queue.shift();
      if (current === null) {
          levels.push(0);
          queue.push(current);
      } else {
          levels[levels.length-1]++;
          queue.push(...current.children);   
      }
  }
  
  return levels;
}

module.exports = levelWidth;
