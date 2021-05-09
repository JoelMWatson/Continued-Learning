const tf = require('@tensorflow/tfjs');
const _ = require('lodash');

class LinearRegression {
  constructor(features, labels, options) {
    this.features = this.featuring(features);
    this.labels = tf.tensor(labels); // [][]
    this.mseHistory = [];

    // set default options and assign options over them
    Object.assign({ 
      learningRate: 0.01,
      iterations: 1000,
      batchSize: 10
    }, options);
    this.options = options;

    // set starting values for weights to zero
    this.weights = tf.zeros([this.features.shape[1], 1]);
  }

  // a combination of MSE slope w/ respect to m and b
  // features * ((features * weights) - labels) / n
  gradientDescent(features, labels) {
    //(features * weights)
    const guesses = features.matMul(this.weights);

    //((features * weights) - labels)
    const differences = guesses.sub(labels);
    
    //features * ((features * weights) - labels) / n
    const gradients = features
      .transpose()                      // flip it to allow matrix multiplication
      .matMul(differences)              // matrix multiply by differences matrix
      .div(features.shape[0]);     // divide by the number of rows in the matrix

    this.weights = this.weights.sub( 
      gradients.mul(this.options.learningRate)  // element multiply gradients by learning rate
    );                                          // subtract from current weights
  }

  train(){
    const { batchSize } = this.options;
    const batches = Math.floor(this.features.shape[0] / batchSize);   
    for (let i=0; i<this.options.iterations; i++) {
      for (let j=0; j < batches; j++) {
        const startPosition = [(j * batchSize), 0]; // [row, column]
        const featureBatch = this.features.slice(startPosition, [batchSize, -1]); // column -1 = all
        const labelBatch = this.labels.slice(startPosition, [batchSize, -1]);
        this.gradientDescent(featureBatch, labelBatch);
      }
      this.recordMSE();
      this.updateLR();
    }
  }

  test(testFeatures, testLabels){
    testFeatures = this.featuring(testFeatures);
    testLabels = tf.tensor(testLabels);

    // matrix multiply features by weights
    const predictions = testFeatures.matMul(this.weights);

    // calculate sum of squares of residuals
    const res = testLabels
      .sub(predictions)
      .pow(2)
      .sum()
      .get();

    // calculate total sum of squares
    const tot = testLabels
      .sub(testLabels.mean())
      .pow(2)
      .sum()
      .get();

    // calculate coefficient of determination
    return 1 - res / tot;
  }

  predict(observations) {
    return this.featuring(observations).matMul(this.weights);
  }

  // Helper Functions

  featuring(features) {
    features = tf.tensor(features);

    // standardize
    if (this.mean && this.variance) {
      features = features.sub(this.mean).div(this.variance.pow(0.5));
    } else {
      features = this.standardize(features);
    }

    // generate column of 1's to append to features
    features = tf.ones([features.shape[0], 1]).concat(features, 1);

    return features;
  }

  standardize(features) {
    // standardize features data
    const { mean, variance } = tf.moments(features, 0);

    this.mean = mean;
    this.variance = variance;

    // 1 standard deviation = sqrt(variance)
    // mean - 1 standard deviation
    return features.sub(mean).div(variance.pow(0.5));
  }

  // sum( ((features * weights) - labels)**2 ) / n
  recordMSE() {
    const mse = this.features
      .matMul(this.weights) // (features * weights)
      .sub(this.labels)
      .pow(2)
      .sum()
      .div(this.features.shape[0])
      .get();

    this.mseHistory.unshift(mse);
  }

  updateLR() {
    if (this.mseHistory.length < 2) return;

    // if the mse just increased with the latest 
    if (this.mseHistory[0] > this.mseHistory[1]) {
      // reduce learning rate
      this.options.learningRate /= 2;
    } else {
      // increase learning rate
      this.options.learningRate *= 1.05
    }
  }
}

module.exports = LinearRegression;

/*

OldGradientDescent() {
    const guesses = this.features.map((row) => {
      return this.m * row[0] + this.b;
    });

    // Mean Squared Error = 1/n sum{ ((m*x + b) - Actual)**2 }
    // n = this.features.length;
    // x = this.features[index][0]
    // Actual = this.labels[index][0]

    // MSE slope w/ respect to b = 2/n sum{ ((m*x + b) - Actual) }
    const bSlope = _.sum(guesses.map((guess, index) => {
      return guess - this.labels[index][0];
    })) * 2 / this.features.length;
    
    // MSE slope w/ respect to m = 2/n sum{ -x*(Actual - (m*x + b)) }
    const mSlope = _.sum(guesses.map((guess, index) => {
      return -1 * this.features[index][0] * (this.labels[index][0] - guess)
    })) * 2 / this.features.length;
    
    this.m = this.m - mSlope * this.options.learningRate;
    this.b = this.b - bSlope * this.options.learningRate;
  }

*/