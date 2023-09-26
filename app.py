from flask import Flask, render_template, redirect, url_for, request, session, flash
from datetime import timedelta
import os
from dotenv import load_dotenv

load_dotenv()

app = Flask(__name__)
app.secret_key = os.getenv("FLASK_SECRET_KEY")
app.permanent_session_lifetime = timedelta(days=5)

# Home / Index page

@app.route('/')
def index():
    return render_template('index.html')

@app.route("/admin")
def admin():
    return redirect(url_for("index"))

# User pages

@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == "POST":
        session.permanent = True
        # to access info from a form: dict key relates to input name on html form
        user = request.form["nm"]
        session["user"] = user
        flash(f"Successfully logged in, {user}!", "info")
        return redirect(url_for("user"))
    else:
        if "user" in session:
            flash(f"Already logged in!", "info")
            return redirect(url_for("user"))
        return render_template("login.html")
    
@app.route("/logout")
def logout():
    flash("Successfully logged out!", "info")
    session.pop("user", None)
    return redirect(url_for("login"))

@app.route('/user')
def user():
    if "user" in session:
        user = session["user"]
        return render_template("user.html", user=user)
    else:
        flash("You are not logged in!", "info")
        return redirect(url_for("login"))
    
# Club accounts management

@app.route('/clubs')
def clubs():
    return render_template("clubs.html")

if __name__ == "__main__":
    app.run(debug=True)