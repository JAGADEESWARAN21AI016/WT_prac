from flask import Flask, render_template
from datetime import datetime

app = Flask(__name__)

@app.route('/')
def date_time():
    # Get current date and time
    current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # Render the HTML template with the current date and time
    return render_template('datetime_template.html', current_time=current_time)

if __name__ == '__main__':
    app.run(debug=True)
