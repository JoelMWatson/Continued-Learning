// --- Directions
// Write a function that accepts an integer N
// and returns a NxN spiral matrix.
// --- Examples
//   matrix(2)
//     [[1, 2],
//     [4, 3]]
//   matrix(3)
//     [[1, 2, 3],
//     [8, 9, 4],
//     [7, 6, 5]]
//  matrix(4)
//     [[1,   2,  3, 4],
//     [12, 13, 14, 5],
//     [11, 16, 15, 6],
//     [10,  9,  8, 7]]

// my first solution to spiral matrix
function matrix1(n) {
  if (n <= 0) return [];
  let graph = new Array(n).fill(0).map(() => new Array(n).fill(0));
  let count = row = col = 0;
  let horizontal = true;
  let right = down = 1;

  while (count < n*n) {
    count++;
    graph[row][col] = count;
    if (horizontal) {
      if (col+right < 0 || col+right > n-1 || graph[row][col+right] !== 0) {
        horizontal = !horizontal;
        right *= -1;
        row += down;
      } else {
        col += right;
      }
    } else {
      if (row+down < 0 || row+down > n-1 || graph[row+down][col] !== 0) {
        horizontal = !horizontal;
        down *= -1;
        col += right;
      } else {
        row += down;
      }
    }
  }
  return graph;
}

function matrix(n) {
  let counter =1;
  let startColumn = 0;
  let startRow = 0;
  let endColumn = n-1;
  let endRow = n-1;
  const graph = [];
  for (let i = 0; i < n; i++) {
    graph.push([]);  
  }

  while (startColumn <= endColumn && startRow <= endRow) {

    // Top
    for (let i=startColumn; i<=endColumn; i++) {
      graph[startRow][i] = counter;
      counter++
    }
    startRow++;

    // Right
    for (let i=startRow; i<=endRow; i++) {
      graph[i][endColumn] = counter;
      counter++;
    }
    endColumn--;

    // Bottom
    for (let i=endColumn; i>=startColumn; i--) {
      graph[endRow][i] = counter;
      counter++;
    }
    endRow--;

    // Left
    for (let i=endRow; i>=startRow; i--) {
      graph[i][startColumn] = counter;
      counter++;
    }
    startColumn++
  }
  return graph;
}



module.exports = matrix;
