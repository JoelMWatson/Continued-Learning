//@ts-check

const fruitCollection = [
  { type: 'apple', weight: 0.9 },
  { type: 'banana', weight: 0.5 },
  { type: 'strawberry', weight: 0.1 },
  { type: 'kiwi', weight: 0.3 },
  { type: 'pineapple', weight: 1.8 },
  { type: 'orange', weight: 1 }
];

// time permitting, then by item weight
const oneAddedToWeight = (fruitArr) => {
  for (let fruit of fruitArr) {
    fruit.weight = fruit.weight + 1;
  }
  return fruitArr;
};

//@ts-check
/**
 * Assume the following markup exists
 *
 * <button id="the-button">Click me</button>
 *
 * Write a script that will add a new element to the DOM
 * When the user clicks.
 * (Bonus points: only add the element if it isn't already there)
 */

let body = document.querySelector('body');
let bodyContains = [];

document.querySelector('#the-button').addEventListener('click', () => {

  if (!bodyContains.includes('div')) {
    body.append(document.createElement('div'));
    bodyContains.push('div');
  }

  
})