import numpy as np
from tensorflow import keras
import requests
from PIL import Image
from io import BytesIO
import marshal
from pathlib import Path

def load_model(path):
    file = Path(path)
    if not file.exists():
        raise Exception("File not found")
    with open(path, "rb") as f:
        import types
        serialized = marshal.loads(f.read())
        predict = types.FunctionType(serialized, globals(), "predict")
    return predict


def predict(model, text):
    """Returns a PIL image of the text, can be converted to BytesIO if needed"""
    """Long texts will take a long time to process"""
    img = model(text)
    return Image.fromarray(img)