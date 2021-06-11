from flask_frozen import Freezer
from app import app

import os

freezer = Freezer(app)

@freezer.register_generator
def rootPage():
    for page in os.listdir("templates/root/"):
        yield {'page': page}

@freezer.register_generator
def specificGuide():
    for page in os.listdir("templates/guides/"):
        yield {'guide_name': page}


if __name__ == '__main__':
    freezer.freeze()