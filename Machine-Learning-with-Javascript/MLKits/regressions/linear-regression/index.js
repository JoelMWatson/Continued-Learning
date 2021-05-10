require('@tensorflow/tfjs-node')
const tf = require('@tensorflow/tfjs');
const LinearRegression = require('./linear-regression');
const loadCSV = require('../load-csv');
const plot = require('node-remote-plot');

let { features, labels, testFeatures, testLabels } = loadCSV('../data/cars.csv', {
  shuffle: true,
  splitTest: 50,
  dataColumns: ['horsepower', 'weight', 'displacement'], // order matters in your predition function
  labelColumns: ['mpg']
});

const options = {
  learningRate: 0.1,
  iterations: 3,
  batchSize: 10 // 1 = stochastic gradient descent
};

const regression = new LinearRegression(features, labels, options);

regression.train();

// console.log('Updated M is:', regression.weights.get(0,1), 
// 'Updated B is:', regression.weights.get(0,0));

const r2 = regression.test(testFeatures, testLabels);

plot({
  x: regression.mseHistory.reverse(),
  xLabel: 'Iteration #',
  yLabel: 'Mean Squared Error'
});
console.log("Test Output:",r2);

regression.predict([
  [120, 2, 380]
]).print();