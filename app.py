from flask import Flask, render_template
import json

app = Flask(__name__)


@app.route("/")
@app.route("/index")
def index():
    props = json.load(open("properties.json"))
    return render_template("index.html", props=props)


if __name__ == '__main__':
	app.run(debug=True)