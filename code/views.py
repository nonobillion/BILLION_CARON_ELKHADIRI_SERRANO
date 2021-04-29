from flask import Flask, render_template

app = Flask(__name__)

app.static_folder = "static"
app.template_folder = "template"
app.config.from_object("config")

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/marketplace")
def shop():
    return render_template("shop.html")

@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/contact_us")
def contact_us():
    return render_template("contact.html")