from flask import Flask, render_template, request, redirect, make_response
import datetime

app = Flask(__name__)

# Dictionary to store user credentials
user_credentials = {
    "user1": "password1",
    "user2": "password2",
    "jaga" : "8848",
    # Add more users as needed
}

def check_credentials(username, password):
    return username in user_credentials and user_credentials[username] == password

@app.route('/')
def welcome():
    return render_template('welcome.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        if check_credentials(username, password):
            # If credentials are correct, set a cookie with max_age and redirect to the welcome page
            max_age = 20  # Set the cookie to expire in 2 seconds
            resp = make_response(redirect('/welcome'))
            resp.set_cookie('username', username, max_age=max_age)
            return resp

    return render_template('login.html')

@app.route('/welcome')
def welcome_user():
    # Retrieve the username from the cookie
    username = request.cookies.get('username')
    if username:
        return render_template('welcome_user.html', username=username)
    else:
        return redirect('/login')

@app.route('/logout')
def logout():
    # Clear the username cookie and redirect to the login page
    resp = make_response(redirect('/login'))
    resp.delete_cookie('username')
    return resp

if __name__ == '__main__':
    app.run(debug=True)
