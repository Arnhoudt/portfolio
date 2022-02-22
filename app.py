from flask import Flask, render_template, request
import json

app = Flask(__name__)


@app.route("/")
@app.route("/index.html")
def index():
    props = json.load(open("properties.json"))
    return render_template("index.html", props=props, args=request.args)


if __name__ == '__main__':
	app.run(debug=True)