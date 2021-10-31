from flask import Flask, render_template, url_for

import os

app = Flask(__name__)
app.config["FREEZER_DESTINATION"] = "docs/"

@app.route("/")
def index():
    return render_template("root/index.html")

@app.route("/<page>")
def rootPage(page):
    return render_template(f"root/{page}")

# @app.route("/tools/")
# def tools():
#     return render_template("root/tools/index.html")

@app.route("/tools/")
@app.route("/tools/<page>")
def toolPages(page = "index.html"):
    return render_template(f"tools/{page}")

