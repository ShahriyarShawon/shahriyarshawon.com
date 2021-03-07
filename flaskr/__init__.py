import os

from flask import Flask, render_template, url_for


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # a simple page that says hello
    @app.route('/')
    @app.route('/index')
    def index():
        rendered_page = render_template("index.html")
        return rendered_page

    @app.route('/stuffIUse.html')
    def stuffIUse():
        rendered_page = render_template("stuffIUse.html")
        return rendered_page

    @app.route('/musicILike.html')
    def musicILike():
        rendered_page = render_template("musicILike.html")
        return rendered_page

        
    @app.route('/render')
    def renderPages():
        pages = [
        "index.html",
        "stuffIUse.html",
        "musicILike.html"
        ]   

        for page in pages:
            content = render_template(page)
            f = open(page, "w")
            f.writelines(content)
            f.close()
        return "Made all the pages"
        
    return app