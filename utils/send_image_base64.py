import os
from PIL import Image
import base64
import io


def get_image_data(filename_db: str, directory: str):
    width = 500
    filename = str(filename_db).split('version=')[0]
    abs_path = os.path.abspath(__file__)
    dir_name = os.path.dirname(abs_path)
    abs_upl_path = os.path.join(dir_name, 'uploads', directory)
    default_image_path = os.path.join(dir_name, 'default.jpg')
    image_file_path = os.path.join(abs_upl_path, filename)
    is_file = os.path.isfile(image_file_path)
    image_path = image_file_path if is_file else default_image_path
    with Image.open(image_path) as img:
        aspect_ratio = img.height / img.width
        new_height = int(width * aspect_ratio)
        img = img.resize((width, new_height))
        img_bytes = io.BytesIO()
        img.save(img_bytes, format='JPEG')
        img_bytes.seek(0)
        return base64.b64encode(img_bytes.read()).decode('utf-8')
