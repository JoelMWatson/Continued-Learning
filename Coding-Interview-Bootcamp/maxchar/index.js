// --- Directions
// Given a string, return the character that is most
// commonly used in the string.
// --- Examples
// maxChar("abcccccccd") === "c"
// maxChar("apple 1231111") === "1"

function maxChar(str) {
  let chars = {};
  let max = str[0] || null;
  for (let char of str) {
    chars[char] = chars[char] + 1 || 1;
    if (chars[char] > chars[max]) {
      max = char;
    }
  }
  return max;
}

module.exports = maxChar;
