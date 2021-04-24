const carMakers: string[] = ['Ford', 'Chevy', 'Dodge'];
const dates: Date[] = [new Date(), new Date()];

const carsByMake: string[][] = [];

// helps with type when getting out of typed array
const cars = carMakers[0];

// prevents wrong type when pushing to typed array
//carMakers.push(5);

// helps when using map to get the type for each element
carMakers.map((car) => {
  return car;
})

// Flexible types
const importantDates = [new Date(), '2030-10-15']; // array of string or Dates
const importantDates2: (Date | string)[] = [];