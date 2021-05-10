require('@tensorflow/tfjs-node');
const tf = require('@tensorflow/tfjs');
const _ = require('lodash');
const LogisticRegression = require('./logistic-regression');
const plot = require('node-remote-plot');
const mnist = require('mnist-data');



// trick to reduce the memory usage. (garbage collection cleans original data array up)
const getData = () => {
  const data = mnist.training(0, 60000); // get training images (not inclusive)

  const features = data.images.values.map(image => _.flatMap(image));
  const encodedLabels = data.labels.values.map(label => {
    const row = new Array(10).fill(0);
    row[label] = 1;
    return row;
  });
  return [features, encodedLabels]
}

const [features, encodedLabels] = getData();




const regression = new LogisticRegression(features, encodedLabels, {
  learningRate:.1,
  iterations:10,
  batchSize: 100
});

regression.train();

const testData = mnist.testing(0, 1000);
const testFeatures = testData.images.values.map(image => _.flatMap(image));
const testEncodedLabels =  testData.labels.values.map(label => {
  const row = new Array(10).fill(0);
  row[label] = 1;
  return row;
});

plot({
  x: regression.costHistory.reverse()
})

console.log(regression.test(testFeatures, testEncodedLabels));
