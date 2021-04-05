// --- Directions
// Write a function that returns the number of vowels
// used in a string.  Vowels are the characters 'a', 'e'
// 'i', 'o', and 'u'.
// --- Examples
//   vowels('Hi There!') --> 3
//   vowels('Why do you ask?') --> 4
//   vowels('Why?') --> 0

function vowels2(str) {
  let count = 0;
  let list = ['a', 'e', 'i', 'o', 'u'];
  for (let i=0; i<str.length; i++) {
    if (list.includes(str.charAt(i).toLowerCase())) {
      count++;
    }
  }
  return count;
}

function vowels(str) {
  return str.replace(/[^aeiou]/gi,'').length;
}

module.exports = vowels;
