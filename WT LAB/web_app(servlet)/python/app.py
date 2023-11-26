from flask import Flask, render_template
from flask_mysqldb import MySQL

app = Flask(__name__)

# MySQL configurations
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'sampledb'

mysql = MySQL(app)

@app.route('/')
def index():
    # Create a cursor
    cur = mysql.connection.cursor()

    # Execute query
    cur.execute("SELECT id, name, email, salary FROM employees")

    # Fetch data from the database
    data = cur.fetchall()

    # Close the cursor
    cur.close()

    # Render template and pass data to it
    return render_template('index.html', employees=data)

if __name__ == '__main__':
    app.run(debug=True)
