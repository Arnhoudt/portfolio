# import flask app from your existing application
from app import app

from flask_frozen import Freezer

from flask_minify import Minify

Minify(app=app, html=True, js=True, cssless=True)

freezer = Freezer(app, with_static_files=True, log_url_for=False)


if __name__ == '__main__':
    freezer.freeze()