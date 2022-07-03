from flask import Flask, render_template

import os

app = Flask(__name__)
app.config["FREEZER_DESTINATION"] = "docs/"

@app.route("/")
def index():
    return render_template("root/index.html")

@app.route("/<page>")
def rootPage(page):
    return render_template(f"root/{page}")

@app.route("/tools/")
@app.route("/tools/<page>")
def toolPages(page = "index.html"):
    return render_template(f"tools/{page}")

@app.route("/guides/")
@app.route("/guides/<page>")
def guidePages(page = "index.html"):
    if page == "index.html":
        files_to_titles = {}
        for entry in os.scandir("templates/guides/"):
            filename = entry.name
            article_name = filename.replace("-", " ").replace(".html","")
            article_name = article_name.capitalize()
            
            files_to_titles[filename] = article_name
        del files_to_titles["index.html"]
        return render_template(f"guides/{page}", files_to_titles=files_to_titles)

    return render_template(f"guides/{page}")


