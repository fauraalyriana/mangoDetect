import tensorflow as tf
from PIL import Image
import numpy as np
import io

model = tf.keras.models.load_model('model/mango_classifier_model.h5')

def predict_mango(image_file):
    img = Image.open(image_file)
    img = img.resize((224, 224))  
    img_array = np.array(img) / 255.0  
    
    img_array = np.expand_dims(img_array, axis=0)
    prediction = model.predict(img_array)
    
    return 'Mature' if prediction[0] > 0.5 else 'Immature'
