// --- Directions
// Given a string, return a new string with the reversed
// order of characters
// --- Examples
//   reverse('apple') === 'leppa'
//   reverse('hello') === 'olleh'
//   reverse('Greetings!') === '!sgniteerG'

function reverse(str) {
  let arr = str.split('');
  for (let i = 0; i<Math.floor(arr.length / 2); i++) {
    let temp = arr[i];
    arr[i] = arr[arr.length - (i + 1)];
    arr[arr.length - (i + 1)] = temp;
  }
  return arr.join('');
}

function reverse2(str) {
  debugger;
  str.split('').reduce((reversed, character) => character + reversed, '')
}

reverse2('asdf');

module.exports = reverse;
