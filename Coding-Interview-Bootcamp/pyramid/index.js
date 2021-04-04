// --- Directions
// Write a function that accepts a positive number N.
// The function should console log a pyramid shape
// with N levels using the # character.  Make sure the
// pyramid has spaces on both the left *and* right hand sides
// --- Examples
//   pyramid(1)
//       '#'
//   pyramid(2)
//       ' # '
//       '###'
//   pyramid(3)
//       '  #  '
//       ' ### '
//       '#####'

// length will always be 2n-1
// step[n] will always be # 
// steps[n+row] and steps[n-row] will also be #
function pyramid(n) {
  const width = 2 * n-1;
  for (let row=0; row<n; row++) {
    let step = '';
    for (let col=1; col<=width; col++) {
      if (col < n-row || col > n+row) {
        step += ' '
      } else {
        step += '#'
      }
    }
    console.log(step);
  }
}

// find base case
// find what information needs to be passed between runs
function pyramid2(n, row=0, step='') {
  if (n === row) return;
  debugger;

  if (step.length === n * 2 - 1) {
    console.log(step);
    row = row+1;
    pyramid2(n, row);
  } else {
    if (step.length < (n-1) - row || step.length > (n-1) + row) {
      step += ' '
    } else {
      step += '#';
    }
    pyramid2(n, row, step);  
  }
}

module.exports = pyramid;
