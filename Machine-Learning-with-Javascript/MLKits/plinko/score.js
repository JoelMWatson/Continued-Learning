const outputs = [];
const predictionPoint = 300;

function onScoreUpdate(dropPosition, bounciness, size, bucketLabel) {
  // Ran every time a balls drops into a bucket
  outputs.push([dropPosition, bounciness, size, bucketLabel])
}

function runAnalysis() {
  const testSize = 100;
  const k = 10;

  _.range(0, 3).forEach(feature => {
    // feature = 0, 1, or 2
    const data = _.map(outputs, row => [row[feature], _.last(row)])
    const [training, test] = splitDataset(minMax(data, 1), testSize);

    const accuracy = _.chain(test)
    .filter(testPoint => knn(training, _.initial(testPoint), k) === _.last(testPoint))
    .size()
    .divide(testSize)
    .value();

    console.log(`Algorithm Accuracy for feature ${feature}:`, accuracy);
  });
}

function knn(data, point, k) {
  return _.chain(data)
    .map(row => [distance(_.initial(row), point), _.last(row)])
    .sortBy(row => row[0])
    .slice(0,k)
    .countBy(row => row[1])
    .toPairs()
    .sortBy(row => row[1])
    .last()
    .first()
    .parseInt()
    .value(); 
}

function distance(pointA, pointB) {
  return _.chain(pointA)
    .zip(pointB)
    .map(([a, b]) => (a-b) ** 2)
    .sum()
    .value() ** 0.5;
}

function splitDataset(data, testCount) {
  const shuffled = _.shuffle(data);

  const test = _.slice(shuffled, 0, testCount);
  const training = _.slice(shuffled, testCount);

  return [training, test];
}

function minMax(data, featureCount) {
  const clone = _.cloneDeep(data);

  for (let i = 0; i<featureCount; i++) {
    const column = clone.map(row => row[i]);
    const min = _.min(column);
    const max = _.max(column);

    for (let j=0; j<clone.length; j++) {
      clone[j][i] = (clone[j][i] - min) / (max - min);
    }
  }

  return clone;
}
