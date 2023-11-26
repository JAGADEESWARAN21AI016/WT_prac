from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def multiplication_table():
    if request.method == 'POST':
        try:
            number = int(request.form['number'])
            table_data = [(i, number * i) for i in range(1, 11)]
            return render_template('index.html', number=number, table_data=table_data)
        except ValueError:
            error_message = "Please enter a valid number."
            return render_template('index.html', error_message=error_message)

    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
