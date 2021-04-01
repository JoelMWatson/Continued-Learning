// --- Directions
// Given an integer, return an integer that is the reverse
// ordering of numbers.
// --- Examples
//   reverseInt(15) === 51
//   reverseInt(981) === 189
//   reverseInt(500) === 5
//   reverseInt(-15) === -51
//   reverseInt(-90) === -9

function reverseInt(n) {
  let reverse = 0;
  let positive = 1;
  if (n < 0) {
    positive = -positive;
    n = -n;
  }

  // iterate while n > 0
  while (n > 0) {
    reverse = reverse * 10 + (n % 10);
    n = Math.floor(n/10);
  }

  return reverse * positive;
}

module.exports = reverseInt;
