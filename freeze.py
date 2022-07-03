from flask_frozen import Freezer

from app import app

import os
import markdown

freezer = Freezer(app)

@freezer.register_generator
def rootPage():
    for page in os.listdir("templates/root/"):
        yield {'page': page}

@freezer.register_generator
def toolPages():
    for page in os.listdir("templates/tools/"):
        yield {'page': page}

@freezer.register_generator
def guidePages():
    for page in os.listdir("templates/guides/"):
        yield {'page': page}

def gen_blog():
    for entry in os.scandir("posts/"):
        with open(entry, "r") as f:
            filename = entry.name.replace("md","")
            content = f.read()
            html = markdown.markdown(content, extensions=['fenced_code', 'codehilite'])
            with open(f"templates/guides/{filename}html", "w") as f:
                f.write("{% extends 'template.html' %}\n")
                f.write("{% block head %}\n")
                f.write("<script src=\"/static/scripts/tools.js\"></script>\n")
                f.write("{% endblock head %}\n")
                f.write("{% block title %}{% endblock title %}\n")
                f.write("{% block content %}\n")
                f.write(html+"\n")
                f.write("{% endblock content %}")
            

if __name__ == '__main__':
    gen_blog()
    freezer.freeze()    