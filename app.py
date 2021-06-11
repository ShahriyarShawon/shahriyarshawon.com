from flask import Flask, render_template, url_for

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("root/index.html")

@app.route("/<page>")
def rootPage(page):
    return render_template(f"root/{page}")


@app.route("/guides/")
def guides():
    return render_template("guides/index.html")

@app.route("/guides/<guide_name>")
def specificGuide(guide_name):
    return render_template(f"guides/{guide_name}")