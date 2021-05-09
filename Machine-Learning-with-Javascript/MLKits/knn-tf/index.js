require('@tensorflow/tfjs-node');
const tf = require('@tensorflow/tfjs');
const loadCSV = require('./load-csv');

const knn = (features, labels, predictionPoint, k) => {
  const { mean, variance } = tf.moments(features, 0);

  const scaledPrediction = predictionPoint.sub(mean).div(variance.pow(0.5));

  return features
    .sub(mean)
    .div(variance.pow(0.5))
    .sub(scaledPrediction)
    .pow(2)
    .sum(1)
    .pow(0.5)
    .expandDims(1)
    .concat(labels, 1)
    .unstack() // to array here
    .sort((a,b) => a.get(0) > b.get(0) ? 1 : -1) 
    .slice(0, k)
    .reduce((acc, pair) => acc + pair.get(1), 0) / k
}

//    lat/lng    price     10 test features/labels
let { features, labels, testFeatures, testLabels } = loadCSV('./kc_house_data.csv', {
  shuffle: true,
  splitTest: 10,
  dataColumns: ['lat', 'long', 'sqft_lot', 'sqft_living'],
  labelColumns: ['price']
});

features = tf.tensor(features);
labels = tf.tensor(labels);

testFeatures.forEach((testPoint, index) => {
  const result = knn(features, labels, tf.tensor(testPoint), 10);
  const accuracy = (testLabels[index][0] - result) / testLabels[index][0];
  console.log('Accuracy', accuracy * 100);
});

