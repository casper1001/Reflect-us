import os
from keras.models import load_model
from django.conf import settings

# Paths to your models
modeljp_path = os.path.join(settings.BASE_DIR, 'app1', 'models', 'modeljp.h5')
Armodeljp_path = os.path.join(settings.BASE_DIR, 'app1', 'models', 'Armodeljp.h5')

# Load models
modeljp = load_model(modeljp_path)
Armodeljp = load_model(Armodeljp_path)

def load_arabic_model():
    model_path = os.path.join(settings.BASE_DIR, 'app1', 'models', 'Armodeljp.h5')
    return load_model(model_path)

def load_american_model():
    model_path = os.path.join(settings.BASE_DIR, 'app1', 'models', 'modeljp.h5')
    return load_model(model_path)
