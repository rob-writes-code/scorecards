from flask import Flask, render_template, redirect, url_for, request

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route("/admin")
def admin():
    return redirect(url_for("index"))

@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == "POST":
        # to access info from a form: dict key relates to input name on html form
        user = request.form["nm"]
        return redirect(url_for("user", usr=user))
    else:
        return render_template("login.html")

@app.route('/<usr>')
def user(usr):
    return f"<h1>{usr}</h1>"

if __name__ == "__main__":
    app.run(debug=True)