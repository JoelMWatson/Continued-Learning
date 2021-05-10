const tf = require('@tensorflow/tfjs');

class LogisticRegression {
  constructor(features, labels, options) {
    this.features = this.featuring(features);
    this.labels = tf.tensor(labels); // [][]
    this.costHistory = [];

    // set default options and assign options over them
    Object.assign({ 
      learningRate: 0.01,
      iterations: 1000,
      batchSize: 10,
      decisionBoudnry: 0.5
    }, options);
    this.options = options;

    // set starting values for weights to zero
    this.weights = tf.zeros([this.features.shape[1], this.labels.shape[1]]);
  }

  // Slope of Cross Entropy
  // features * (sigmoid(features * weights) - labels) / n
  gradientDescent(features, labels) {
    //(features * weights)
    const guesses = features.matMul(this.weights).softmax();

    //((features * weights) - labels)
    const differences = guesses.sub(labels);
    
    //features * ((features * weights) - labels) / n
    const gradients = features
      .transpose()                      // flip it to allow matrix multiplication
      .matMul(differences)              // matrix multiply by differences matrix
      .div(features.shape[0]);     // divide by the number of rows in the matrix

    return this.weights.sub( 
      gradients.mul(this.options.learningRate)  // element multiply gradients by learning rate
    );                                          // subtract from current weights
  }

  train(){
    const { batchSize } = this.options;
    const batches = Math.floor(this.features.shape[0] / batchSize);   
    for (let i=0; i<this.options.iterations; i++) {
      for (let j=0; j < batches; j++) {
        const startPosition = [(j * batchSize), 0]; // [row, column]
        this.weights = tf.tidy(() => {
          const featureBatch = this.features.slice(startPosition, [batchSize, -1]); // column -1 = all
          const labelBatch = this.labels.slice(startPosition, [batchSize, -1]);
          return this.gradientDescent(featureBatch, labelBatch);
        })
      }
      this.recordCost();
      this.updateLR();
    }
  }

  test(testFeatures, testLabels){
    const predictions = this.predict(testFeatures);
    testLabels = tf.tensor(testLabels).argMax(1);

    const incorrect = predictions.notEqual(testLabels).sum().get();

    return (predictions.shape[0] - incorrect) / predictions.shape[0];
  }

  predict(observations) {
    // rounds based on decision boundry
    return this.featuring(observations)
      .matMul(this.weights)
      .softmax()
      .argMax(1);
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

    const filler = variance.cast('bool').logicalNot().cast('float32');

    this.mean = mean;
    this.variance = variance.add(filler);

    // 1 standard deviation = sqrt(variance)
    // mean - 1 standard deviation
    return features.sub(mean).div(this.variance.pow(0.5));
  }

  // Cross Entropy Equation
  // -sum(actual * log(guess) + (1-actual) * log(1-guess)) / n
  // Vectorized
  // -(actual * log(guesses) + (1-actual) * log(1-guesses)) / n
  //        term1                        term2
  recordCost() {
    const cost = tf.tidy(() => {
      const guesses = this.features
      .matMul(this.weights)  
      .softmax();

      const term1 = this.labels // (actual * log(guesses))
        .transpose()   
        .matMul(guesses.add(1e-7).log()); 

      const term2 = this.labels // (-actual + 1) * (log(-guesses + 1))
        .mul(-1)                
        .add(1) 
        .transpose()                
        .matMul(                
          guesses
            .mul(-1)            
            .add(1)
            .add(1e-7) // fix so we arent taking log of zero (causes issues)         
            .log()              
        )                     
      return term1.add(term2) // term1 + term2 * (-1/n)
        .div(this.features.shape[0])
        .mul(-1)
        .get(0,0);
    })

    this.costHistory.unshift(cost);
  }

  updateLR() {
    if (this.costHistory.length < 2) return;

    // if the mse just increased with the latest 
    if (this.costHistory[0] > this.costHistory[1]) {
      // reduce learning rate
      this.options.learningRate /= 2;
    } else {
      // increase learning rate
      this.options.learningRate *= 1.05
    }
  }
}

module.exports = LogisticRegression;
