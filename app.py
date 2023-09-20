from flask import Flask, render_template, redirect, url_for

app = Flask(__name__)

@app.route('/<name>')
def index(name):
    return render_template('index.html', content=name)

@app.route("/admin")
def admin():
    return redirect(url_for("index"))

if __name__ == "__main__":
    app.run()