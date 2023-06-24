# Importing the libraries
import numpy as np
import tensorflow as tf
from keras.preprocessing import image

# Part 1 - Data Preprocessing
tf.__version__
# Preprocessing the Training set
train_datagen = image.ImageDataGenerator(
    rescale=1./255, 
    shear_range=0.2, 
    zoom_range=0.2, 
    horizontal_flip=True)

training_set = train_datagen.flow_from_directory(
    'training_set', 
    target_size=(64,64), 
    batch_size=32, 
    class_mode='binary')
print(training_set.class_indices)

# Preprocessing the Test set
test_datagen = image.ImageDataGenerator(rescale=1./255)

test_set = test_datagen.flow_from_directory(
    'test_set', 
    target_size=(64,64), 
    batch_size=32, 
    class_mode='binary')

# Part 2 - Building the CNN

# Initialising the CNN
cnn = tf.keras.models.Sequential()

# Step 1 - Convolution
cnn.add(tf.keras.layers.Conv2D(filters=32, kernel_size=3, activation='relu', input_shape=[64, 64, 3]))

# Step 2 - Pooling
cnn.add(tf.keras.layers.MaxPool2D(pool_size=2, strides=2))

# Adding a second convolutional layer
cnn.add(tf.keras.layers.Conv2D(filters=32, kernel_size=3, activation='relu'))
cnn.add(tf.keras.layers.MaxPool2D(pool_size=2, strides=2))

# Step 3 - Flattening
cnn.add(tf.keras.layers.Flatten())

# Step 4 - Full Connection
cnn.add(tf.keras.layers.Dense(units=128, activation='relu'))

# Step 5 - Output Layer
cnn.add(tf.keras.layers.Dense(units=1, activation='sigmoid'))

# Part 3 - Training the CNN

# Compiling the CNN
cnn.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])

# Training the CNN on the Training set and evaluating it on the Test set
cnn.fit(x=training_set, validation_data=test_set, epochs=25)

# Part 4 - Making a single prediction
test_image = image.image_utils.load_img('single_set/cat_or_dog4.jpg', target_size=(64,64))
test_image = image.image_utils.img_to_array(test_image)
test_image = np.expand_dims(test_image, axis=0)
result = cnn.predict(test_image)
if (result[0][0] == 0):
    print('cat')
else:
    print('dog')