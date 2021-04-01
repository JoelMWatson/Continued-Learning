// --- Directions
// Check to see if two provided strings are anagrams of eachother.
// One string is an anagram of another if it uses the same characters
// in the same quantity. Only consider characters, not spaces
// or punctuation.  Consider capital letters to be the same as lower case
// --- Examples
//   anagrams('rail safety', 'fairy tales') --> True
//   anagrams('RAIL! SAFETY!', 'fairy tales') --> True
//   anagrams('Hi there', 'Bye there') --> False

function anagrams(stringA, stringB) {
  // initialize char maps and return value
  let mapA = {};
  let mapB = {};
  let anagram = true;

  // clean inputs of spaces/symbols
  let cleanA = stringA.replace(/[^\w]/g, '').toLowerCase();
  let cleanB = stringB.replace(/[^\w]/g, '').toLowerCase();
  
  // check lengths match
  if (cleanA.length !== cleanB.length)  {
    anagram = false;
  } else {
    // iterate through string filling char maps
    for (let i=0; i<cleanA.length; i++) {
      mapA[cleanA[i]] = mapA[cleanA[i]] ? mapA[cleanA[i]] + 1 : 1;
      mapB[cleanB[i]] = mapB[cleanB[i]] ? mapB[cleanB[i]] + 1 : 1;
    }

    // compare char maps 
    for (let char of Object.keys(mapA)) {
      if (mapA[char] !== mapB[char]) {
        anagram = false;
      }
    }
  }
  return anagram;
}

function anagrams2(str1, str2) {
  return (helper(str1) === helper(str2));
}

function helper(str) {
  return str.replace(/[^\w]/g, '').toLowerCase().split('').sort().join('');
}




module.exports = anagrams;
