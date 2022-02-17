# import flask app from your existing application
from app import app

from flask_frozen import Freezer


freezer = Freezer(app, with_static_files=True, log_url_for=False)


if __name__ == '__main__':
    freezer.freeze()