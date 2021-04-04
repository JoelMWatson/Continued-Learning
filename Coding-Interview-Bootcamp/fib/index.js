// --- Directions
// Print out the n-th entry in the fibonacci series.
// The fibonacci series is an ordering of numbers where
// each number is the sum of the preceeding two.
// For example, the sequence
//  [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
// forms the first ten entries of the fibonacci series.
// Example:
//   fib(4) === 3

function fib1(n) {
  let seq = [0,1];
  for (let i = 2; i <= n; i++) {
    seq[i] = seq[i-2] + seq[i-1];
  }
  return seq[n];
}

function fib(n) {
  if (n < 2) {
    return n;
  }
  return fib(n-2) + fib(n-1)
}

function memoize(func) {
  const cache = {};
  return function(...args) {
    if (cache[args]) return cache[args];
    const result = func.apply(this, args);
    cache[args] = result;
    return result;
  }
}

fib = memoize(fib);

module.exports = fib;
