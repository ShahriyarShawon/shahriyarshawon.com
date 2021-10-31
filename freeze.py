from flask_frozen import Freezer
import markdown

from app import app


import os
import shutil

freezer = Freezer(app)


@freezer.register_generator
def rootPage():
    for page in os.listdir("templates/root/"):
        yield {'page': page}

@freezer.register_generator
def toolPages():
    for page in os.listdir("templates/tools/"):
        yield {'page': page}





if __name__ == '__main__':
    freezer.freeze()    