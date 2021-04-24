const drink = {
  color: 'brown',
  carbonated: true,
  sugar: 40
}

// creates the tuple/ alias
type Drink = [string, boolean, number]

// const pepsi: [string, boolean, number] = ['brown', true, 40];
const pepsi: Drink = ['brown', true, 40];

// Tuples are not often used and usually you will use an object as you lose the 
// easy to understand key-value structure when using tuples 