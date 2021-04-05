// --- Directions
// Implement bubbleSort, selectionSort, and mergeSort

function bubbleSort(arr) {
  for (let i=0; i<arr.length; i++) {
    for (let k=0; k<arr.length-(i+1); k++) {
      if(arr[k] > arr[k+1]) {
        let lesser = arr[k+1];
        arr[k+1] = arr[k];
        arr[k] = lesser;
      }
    }
  }
  return arr;
}

function selectionSort(arr) {
  for (let i=0; i<arr.length; i++) {
    let index = i;
    for (let j=i; j<arr.length; j++) {
      if (arr[index] > arr[j]) index = j;
    }
    let lesser = arr[index];
    arr[index] = arr[i];
    arr[i] = lesser;
  }
  return arr;
}

function mergeSort(arr) {
  if (arr.length == 1) return arr;

  let mid = Math.floor(arr.length / 2);
  let left = arr.slice(0, mid);
  let right = arr.slice(mid);

  return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right) {
  const merged = [];
  while(left.length && right.length) {
    if (left[0] < right[0]) {
      merged.push(left.shift())
    } else {
      merged.push(right.shift());
    }
  }
  if (left.length) {
    merged.push(...left);
  }
  if (right.length) {
    merged.push(...right);
  }
  return merged
}

module.exports = { bubbleSort, selectionSort, mergeSort, merge };
