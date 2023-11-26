from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'ex_4',
}
def get_db_connection():
    return mysql.connector.connect(**db_config)
@app.route('/')
def display_employees():
    connection = get_db_connection()
    cursor = connection.cursor(dictionary=True)
    cursor.execute("SELECT * FROM employees")
    employees = cursor.fetchall()
    cursor.close()
    connection.close()
    return render_template('index.html', employees=employees)
if __name__ == '__main__':
    app.run(debug=True)
