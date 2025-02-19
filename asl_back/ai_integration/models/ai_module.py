# ai_integration/models/ai_module.py
import tensorflow as tf
from keras.models import load_model
import os
import cv2
import numpy as np

# Paths to your models
modeljp_path = os.path.join(os.path.dirname(__file__), '../app1/models/modeljp.h5')
Armodeljp_path = os.path.join(os.path.dirname(__file__), '../app1/models/Armodeljp.h5')


# Load models
modeljp = load_model(modeljp_path)
Armodeljp = load_model(Armodeljp_path)


def load_arabic_model():
    model_path = os.path.join(os.path.dirname(__file__), '../app1/models/Armodeljp.h5')
    return load_model(model_path)

def load_american_model():
    model_path = os.path.join(os.path.dirname(__file__), '../app1/models/modeljp.h5')
    return load_model(model_path)

# Your preprocessing logic here
def preprocess_image(file_path, s=255):
    image = cv2.imread(file_path)
    info = np.iinfo(image.dtype)
    image = image.astype(np.float64) / info.max
    image = 255 * image
    image = image.astype(np.uint8)
    image_array = cv2.resize(image, (s, s))
    image_array = image_array.astype(np.uint8)
    return image_array
