// --- Directions
// Write a function that accepts a positive number N.
// The function should console log a step shape
// with N levels using the # character.  Make sure the
// step has spaces on the right hand side!
// --- Examples
//   steps(2)
//       '# '
//       '##'
//   steps(3)
//       '#  '
//       '## '
//       '###'
//   steps(4)
//       '#   '
//       '##  '
//       '### '
//       '####'

function steps(n) {
  let symbol = '#';
  let space = ' ';
  for (let i=1; i<=n; i++) {
    console.log((symbol.repeat(i)) + (space.repeat(n - i)));
  }
}

function steps2(n, row = 0, step = '') {
  // base case
  if (n === row) {
    return;
  }

  // end of line
  if (n === step.length) {
    console.log(step)
    steps2(n, row++);
    return;
  }

  // middle of line
  if (step.length <= row) {
    step += '#';
  } else {
    stair += ' ';
  }
  steps2(n, row, step);
}

module.exports = steps;
